package util

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.androidxr.CONTROLLER_POSE_TIME_SCENES
import app.template.patches.steamlink.androidxr.MODERN_TONGUE_ORIGINAL
import app.template.patches.steamlink.androidxr.MODERN_TONGUE_REPLACEMENT
import app.template.patches.steamlink.androidxr.patchModernTongueTransport
import app.template.patches.steamlink.androidxr.validateCodecsSupportScene
import app.template.patches.steamlink.androidxr.validateControllerPoseTimeScene
import app.template.patches.steamlink.androidxr.validateFovealCanvasScene
import app.template.patches.steamlink.binary.BLUE_NOISE_LAYOUTS
import app.template.patches.steamlink.binary.BlueNoiseLayer
import app.template.patches.steamlink.binary.FoveaMode
import app.template.patches.steamlink.binary.VIDEO_SHADER_SIZE
import app.template.patches.steamlink.binary.VideoOutputPrecision
import app.template.patches.steamlink.binary.applyBlueNoiseLayer
import app.template.patches.steamlink.binary.applyVdSdrFovea
import app.template.patches.steamlink.binary.applyNetworkOptimizationsMain
import app.template.patches.steamlink.binary.applyNetworkOptimizationsScene
import app.template.patches.steamlink.binary.findVideoShader
import app.template.patches.steamlink.binary.paddedVideoShader
import app.template.patches.steamlink.binary.patchNativeMicrophonePreset
import app.template.patches.steamlink.binary.patchVisualDelay
import app.template.patches.steamlink.binary.setProjectionSwapchainFormat
import java.io.File
import java.security.MessageDigest

/** Exercises current production helpers on the original decoded 2.0.24/5002395 bytes. */
object SteamLink2395NativeAudit {
    private const val VERSION = "2.0.24"
    private const val CODE = "5002395"
    private const val SIZE = 2_301_432
    private const val SHA256 = "5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b"

    @JvmStatic
    fun main(args: Array<String>) {
        val root = File(args.single()).canonicalFile
        val base = listOf(
            File(root, "android-steamlinkvr-release-base-$VERSION-$CODE"),
            File(root, "../android-steamlinkvr-release-base-$VERSION-$CODE"),
        ).first { it.isDirectory }
        val library = File(base, "lib/arm64-v8a/libvrlink_scene.so")
        val stock = library.readBytes()
        check(stock.size == SIZE && stock.sha256() == SHA256) { "Unexpected 2.0.24 scene" }

        fun exactDiff(output: ByteArray, ranges: List<IntRange>) {
            check(output.size == stock.size)
            check(stock.indices.all { stock[it] == output[it] || ranges.any { range -> it in range } }) {
                "Out-of-scope mutation"
            }
        }
        fun rejects(block: () -> Unit) {
            check(runCatching(block).exceptionOrNull() is PatchException)
        }

        // Microphone: four presets, exact 4-byte site, idempotence and pair rejection.
        val presets = mapOf(
            "voice-communication" to 7, "voice-recognition" to 6,
            "unprocessed" to 9, "voice-performance" to 10,
        )
        for ((preset, value) in presets) {
            val output = patchNativeMicrophonePreset(stock, preset, VERSION, CODE)
            exactDiff(output, listOf(0xf5710..0xf5713))
            check(output.word(0xf5710) == (0x52800001 or (value shl 5)))
            for (next in presets.keys) {
                check(patchNativeMicrophonePreset(output, next, VERSION, CODE)
                    .contentEquals(patchNativeMicrophonePreset(stock, next, VERSION, CODE)))
            }
        }
        check(patchNativeMicrophonePreset(stock, "voice-recognition", "2.0.23", CODE).contentEquals(stock))
        rejects { patchNativeMicrophonePreset(stock.copyOf().apply { this[0xf570c] = 0 }, "voice-recognition", VERSION, CODE) }
        println("PASS 5002395 microphone: 4 presets, exact 4-byte diff, transitions, idempotence, guards")

        // Tongue transport: exact 24-byte block.
        val tongue = patchModernTongueTransport(stock, VERSION, CODE)
        exactDiff(tongue, listOf(0x1433ac until 0x1433ac + 24))
        check(tongue.copyOfRange(0x1433ac, 0x1433ac + 24).contentEquals(MODERN_TONGUE_REPLACEMENT))
        check(!tongue.copyOfRange(0x1433ac, 0x1433ac + 24).contentEquals(MODERN_TONGUE_ORIGINAL))
        check(patchModernTongueTransport(tongue, VERSION, CODE).contentEquals(tongue))
        check(patchModernTongueTransport(stock, "2.0.23", CODE).contentEquals(stock))
        rejects { patchModernTongueTransport(stock.copyOf().apply { this[0x1433ac] = 0 }, VERSION, CODE) }
        println("PASS 5002395 tongue: exact 24-byte block, idempotence and wrong-pair guards")

        // Visual Delay: exact hook, six velocity stores, injected PT_LOAD and cave.
        val phoff = stock.longWord(32).toInt()
        val phsize = stock.shortWord(54)
        val headers = (0 until stock.shortWord(56)).map { phoff + it * phsize }
        val note = headers.single { stock.word(it) == 4 }
        val velocity = listOf(0x1033e8, 0x1033ec, 0x1033f0, 0x1033fc, 0x103400, 0x10340c)
        val caveFile = 0x2315c0
        val caveVa = 0xc815c0
        val ranges = listOf(note until note + 56, caveFile until caveFile + 20, 0x103174..0x103177) +
            velocity.map { it until it + 4 }
        val offsets = listOf(0L, 1L, 60L, 100L, 1000L, 4000L)
        for (offset in offsets) {
            val output = patchVisualDelay(stock, offset, VERSION, CODE)
            exactDiff(output, ranges)
            check(output.word(note) == 1 && output.word(note + 4) == 5)
            check(output.longWord(note + 8) == 0x230000L)
            check(output.longWord(note + 16) == 0xc80000L)
            check(output.longWord(note + 32) == 0x15d4L && output.longWord(note + 48) == 0x4000L)
            check(output.word(0x103174) == (0x14000000 or (((caveVa - 0x103174) / 4) and 0x3ffffff)))
            velocity.forEachIndexed { index, site ->
                check(output.word(site) == (0xB9000000.toInt() or (((28 + index * 4) / 4) shl 10) or (19 shl 5) or 31))
            }
            val ns = ((output.word(caveFile + 4) ushr 5) and 65535).toLong() or
                (((output.word(caveFile + 8) ushr 5) and 65535).toLong() shl 16)
            check(ns == offset * 1_000_000)
            check(patchVisualDelay(output, offset, VERSION, CODE).contentEquals(output))
            for (next in offsets) {
                check(patchVisualDelay(output, next, VERSION, CODE)
                    .contentEquals(patchVisualDelay(stock, next, VERSION, CODE)))
            }
        }
        check(patchVisualDelay(stock, 60, "2.0.23", CODE).contentEquals(stock))
        println("PASS 5002395 Visual Delay: hook, 6 stores, PT_LOAD/cave, 36 transitions")

        // OLED shader/format and VD SDR fovea.
        val shader = findVideoShader(stock)
        check(shader == 0x97aae)
        val calibrated = stock.copyOf().apply {
            paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP).copyInto(this, shader)
        }
        exactDiff(calibrated, listOf(shader until shader + VIDEO_SHADER_SIZE))
        for (precision in VideoOutputPrecision.entries) {
            val formatted = setProjectionSwapchainFormat(calibrated, precision, VERSION, CODE)
            val expected = when (precision) {
                VideoOutputPrecision.SRGB8_HIGHP -> byteArrayOf(0x69, 0x88.toByte(), 0x91.toByte(), 0x52)
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL -> byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52)
                VideoOutputPrecision.RGBA16F_EXPERIMENTAL -> byteArrayOf(0x49, 0x03, 0x91.toByte(), 0x52)
            }
            listOf(0x10da98, 0x10db08, 0x10db78).forEach { offset ->
                check(formatted.copyOfRange(offset, offset + 4).contentEquals(expected))
            }
            check(setProjectionSwapchainFormat(formatted, VideoOutputPrecision.SRGB8_HIGHP, VERSION, CODE)
                .contentEquals(calibrated))
        }
        for (mode in FoveaMode.entries) {
            val vd = applyVdSdrFovea(calibrated, VERSION, CODE, mode, 1.05f)
            check(vd.indices.all { it in 0xa3ceb until 0xa3ceb + 296 || calibrated[it] == vd[it] })
            check(applyVdSdrFovea(vd, VERSION, CODE, FoveaMode.OFF).contentEquals(calibrated))
        }
        println("PASS 5002395 OLED/VD: shader, 3 formats, reversible foveal suffix")

        // Blue-noise import hooks and helper configuration.
        val blueLayout = BLUE_NOISE_LAYOUTS.single { it.version == VERSION && it.code == CODE }
        for (layer in BlueNoiseLayer.entries) {
            val result = applyBlueNoiseLayer(stock, VERSION, CODE, FoveaMode.INPUT_10BIT, layer)
            check(result.helper != null)
            val changed = stock.indices.filter { stock[it] != result.scene[it] }
            check(changed.isNotEmpty() && changed.all { offset ->
                blueLayout.sites.any { offset in it.offset until it.offset + it.stock.length + 1 }
            })
            check(applyBlueNoiseLayer(result.scene, VERSION, CODE, FoveaMode.OFF, layer,
                existingHelper = result.helper).scene.contentEquals(stock))
        }
        println("PASS 5002395 blue noise: fovea/background hooks, helper config and OFF restore")

        // Network Optimizations exact patched hashes.
        val scenePatched = applyNetworkOptimizationsScene(stock, VERSION, CODE)
        check(scenePatched.sha256() == "8b71e6a72533935d7a5f4e1649c181fc627d1993809957ed8c1ee4232c3323fc")
        val main = File(base, "lib/arm64-v8a/libmain.so").readBytes()
        val mainPatched = applyNetworkOptimizationsMain(main, VERSION, CODE)
        check(mainPatched.sha256() == "69f2c7789735e96322f8402fa44b1b118a0210df6c1477fa23bb6447dcc06075")
        println("PASS 5002395 Network Optimizations: scene and main output hashes")

        // Pinned scene contracts used by the layer patches.
        validateCodecsSupportScene(stock, VERSION, CODE)
        validateFovealCanvasScene(stock, VERSION, CODE)
        validateControllerPoseTimeScene(
            CONTROLLER_POSE_TIME_SCENES.single { it.version == VERSION && it.versionCode.toString() == CODE },
            stock,
        )
        listOf(0x10d41c, 0x10df58).forEach { offset ->
            val tampered = stock.copyOf().apply { this[offset] = (this[offset].toInt() xor 1).toByte() }
            rejects { validateFovealCanvasScene(tampered, VERSION, CODE) }
        }
        println("PASS 5002395 codecs/foveal/pose-time scene contracts and tamper rejection")

        check(library.readBytes().sha256() == SHA256)
        println("PASS 5002395 native scene source hash unchanged")
    }

    private fun ByteArray.word(offset: Int): Int =
        (0..3).fold(0) { value, i -> value or ((this[offset + i].toInt() and 255) shl (8 * i)) }

    private fun ByteArray.longWord(offset: Int): Long =
        (0..7).fold(0L) { value, i -> value or ((this[offset + i].toLong() and 255) shl (8 * i)) }

    private fun ByteArray.shortWord(offset: Int): Int =
        (this[offset].toInt() and 255) or ((this[offset + 1].toInt() and 255) shl 8)

    private fun ByteArray.sha256(): String =
        MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
