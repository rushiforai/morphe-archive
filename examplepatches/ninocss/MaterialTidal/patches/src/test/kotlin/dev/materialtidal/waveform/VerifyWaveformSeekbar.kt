package dev.materialtidal.waveform

import java.io.File
import java.net.URLClassLoader
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.math.abs

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyWaveformSeekbarKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testEnvelopeExtractionAndNormalization(loader)
    testQuantizationRoundTripAndResampling(loader)
    testSeededPlaceholderDeterminism(loader)
    testNonDestructiveLiveAudioAnalysis(loader)
    testMaterialYouConfigDefaults(loader)

    println("ALL WAVEFORM SEEKBAR TESTS PASSED.")
}

private fun testEnvelopeExtractionAndNormalization(loader: ClassLoader) {
    val analyzerCls = loader.loadClass("dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer")
    val accCls = loader.loadClass("dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer\$EnvelopeAccumulator")

    val ctor = accCls.getConstructor(
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val acc = ctor.newInstance(44100, 1, 512)
    val accept = accCls.getMethod(
        "acceptPcm16",
        ByteBuffer::class.java,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val build = accCls.getMethod("buildCanonicalEnvelope")

    // Feed 3 dynamic sections: quiet intro -> loud chorus -> silent break
    val quietBuf = ByteBuffer.allocate(8820 * 2).order(ByteOrder.LITTLE_ENDIAN)
    for (i in 0 until 8820) {
        quietBuf.putShort((kotlin.math.sin(i * 0.08) * 1800.0).toInt().toShort())
    }
    quietBuf.flip()

    val loudBuf = ByteBuffer.allocate(8820 * 2).order(ByteOrder.LITTLE_ENDIAN)
    for (i in 0 until 8820) {
        loudBuf.putShort((kotlin.math.sin(i * 0.14) * 26000.0).toInt().toShort())
    }
    loudBuf.flip()

    val tailQuiet = ByteBuffer.allocate(8820 * 2).order(ByteOrder.LITTLE_ENDIAN)
    for (i in 0 until 8820) {
        tailQuiet.putShort((kotlin.math.sin(i * 0.05) * 900.0).toInt().toShort())
    }
    tailQuiet.flip()

    repeat(3) {
        quietBuf.rewind()
        accept.invoke(acc, quietBuf, 0, quietBuf.limit())
    }
    repeat(3) {
        loudBuf.rewind()
        accept.invoke(acc, loudBuf, 0, loudBuf.limit())
    }
    repeat(3) {
        tailQuiet.rewind()
        accept.invoke(acc, tailQuiet, 0, tailQuiet.limit())
    }

    val env = build.invoke(acc) as FloatArray
    check(env.size == 64) { "Expected 64 canonical bins, got ${env.size}" }
    env.forEachIndexed { idx, v ->
        check(v in 0.10f..1.05f) { "Canonical bin $idx out of bounds: $v" }
    }

    val introAvg = env.slice(2..15).average()
    val chorusAvg = env.slice(25..38).average()
    val outroAvg = env.slice(48..61).average()
    check(chorusAvg > introAvg + 0.20) { "Expected loud chorus ($chorusAvg) > quiet intro ($introAvg)" }
    check(chorusAvg > outroAvg + 0.25) { "Expected loud chorus ($chorusAvg) > quiet outro ($outroAvg)" }

    // Also test silent array fallback
    val finalize = analyzerCls.getMethod(
        "finalizeEnvelope",
        FloatArray::class.java,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val silent = finalize.invoke(null, FloatArray(20), 20, 64) as FloatArray
    check(silent.size == 64 && silent.all { abs(it - 0.16f) < 0.01f }) {
        "Expected steady 0.16f floor for silence"
    }
}

private fun testQuantizationRoundTripAndResampling(loader: ClassLoader) {
    val analyzerCls = loader.loadClass("dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer")
    val quantize = analyzerCls.getMethod("quantizeToBytes", FloatArray::class.java)
    val dequantize = analyzerCls.getMethod("dequantizeFromBytes", ByteArray::class.java)
    val resample = analyzerCls.getMethod("resampleEnvelope", FloatArray::class.java, Int::class.javaPrimitiveType)

    val original = FloatArray(64) { i -> 0.12f + 0.85f * (i / 63f) }
    val bytes = quantize.invoke(null, original) as ByteArray
    check(bytes.size == 64) { "Expected 64 quantized bytes" }
    val restored = dequantize.invoke(null, bytes) as FloatArray
    for (i in original.indices) {
        check(abs(original[i] - restored[i]) <= 1.0f / 255.0f + 0.002f) {
            "Quantization error too high at $i: orig=${original[i]} vs ${restored[i]}"
        }
    }

    for (target in intArrayOf(36, 56, 76)) {
        val rs = resample.invoke(null, restored, target) as FloatArray
        check(rs.size == target) { "Expected $target resampled bars, got ${rs.size}" }
        check(rs.last() > rs.first() + 0.6f) { "Expected upward monotonic shape after resample($target)" }
    }
}

private fun testSeededPlaceholderDeterminism(loader: ClassLoader) {
    val analyzerCls = loader.loadClass("dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer")
    val gen = analyzerCls.getMethod("generateSeededPlaceholder", String::class.java, Int::class.javaPrimitiveType)

    val a1 = gen.invoke(null, "id:123456789", 64) as FloatArray
    val a2 = gen.invoke(null, "id:123456789", 64) as FloatArray
    val b = gen.invoke(null, "id:987654321", 64) as FloatArray

    check(a1.contentEquals(a2)) { "Same song seed must produce identical placeholder waveform" }
    check(!a1.contentEquals(b)) { "Different song seeds must produce distinct waveforms" }
    check(a1.all { it in 0.16f..0.96f }) { "Placeholder bars must stay inside [0.16, 0.96]" }
}

private fun testNonDestructiveLiveAudioAnalysis(loader: ClassLoader) {
    val analyzerCls = loader.loadClass("dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer")
    val analyze = analyzerCls.getMethod(
        "analyzeLiveBuffer",
        ByteBuffer::class.java,
        Int::class.javaPrimitiveType,
    )

    // PCM 16-bit buffer with non-zero position/limit window
    val raw = ByteBuffer.allocate(512).order(ByteOrder.LITTLE_ENDIAN)
    raw.position(32)
    raw.limit(320)
    for (i in 32 until 320 step 2) {
        raw.putShort(i, 16384.toShort())
    }
    raw.order(ByteOrder.BIG_ENDIAN) // verify analyzer doesn't depend on or change buffer order
    val level16 = analyze.invoke(null, raw, 2) as Float
    check(raw.position() == 32 && raw.limit() == 320 && raw.order() == ByteOrder.BIG_ENDIAN) {
        "Live PCM analyzer MUST NOT mutate ByteBuffer position, limit, or order"
    }
    check(level16 in 0.45f..1.0f) { "Expected substantial level for half-scale PCM-16 sine/DC, got $level16" }

    // PCM Float buffer check
    val floatBuf = ByteBuffer.allocate(256).order(ByteOrder.LITTLE_ENDIAN)
    for (i in 0 until 64) {
        floatBuf.putFloat(i * 4, 0.5f)
    }
    val levelFloat = analyze.invoke(null, floatBuf, 4) as Float
    check(floatBuf.position() == 0 && floatBuf.limit() == 256) { "Float ByteBuffer cursor mutated" }
    check(levelFloat in 0.45f..1.0f) { "Expected substantial level for 0.5 float PCM, got $levelFloat" }
}

private fun testMaterialYouConfigDefaults(loader: ClassLoader) {
    val cfgCls = loader.loadClass("dev.materialtidal.extension.tidal.theme.MaterialYouConfig")
    val enabled = cfgCls.getMethod("isPlayerWaveformSeekbarEnabled").invoke(null) as Boolean
    val style = cfgCls.getMethod("getPlayerWaveformStyle").invoke(null) as Int
    val density = cfgCls.getMethod("getPlayerWaveformBarDensity").invoke(null) as Int
    val barCount = cfgCls.getMethod("getPlayerWaveformBarCount").invoke(null) as Int
    val reactive = cfgCls.getMethod("isPlayerWaveformLiveReactiveEnabled").invoke(null) as Boolean

    check(!enabled) { "Waveform seekbar patch flag must default to false (optional patch)" }
    check(style == 0) { "Default style should be 0 (Centered Mirrored Bars)" }
    check(density == 1 && barCount == 56) { "Default density should be Balanced (56 bars)" }
    check(reactive) { "Live audio reactivity must default to true" }
}
