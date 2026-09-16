package util

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.androidxr.*
import app.template.patches.steamlink.binary.*
import app.template.patches.steamlink.identity.patchHmdModelIdentity
import java.io.File
import java.security.MessageDigest

/** Exercises current production helpers on the original decoded bytes, without writing the input. */
object SteamLink2363NativeAudit {
    @JvmStatic
    fun main(args: Array<String>) {
        val root = File(args.single()).canonicalFile
        val base = File(root, "decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363")
        val library = File(base, "lib/arm64-v8a/libvrlink_scene.so")
        val stock = library.readBytes()
        check(stock.size == 2_292_008 && stock.sha256() == MODERN_TONGUE_STOCK_SHA256_5002363)
        fun exactDiff(output: ByteArray, ranges: List<IntRange>) {
            check(output.size == stock.size)
            check(stock.indices.all { stock[it] == output[it] || ranges.any { range -> it in range } })
        }
        fun rejects(block: () -> Unit) {
            check(runCatching(block).exceptionOrNull() is PatchException)
        }

        val presets = mapOf("voice-communication" to 7, "voice-recognition" to 6, "unprocessed" to 9, "voice-performance" to 10)
        for ((preset, value) in presets) {
            val output = patchNativeMicrophonePreset(stock, preset, "2.0.23", "5002363")
            exactDiff(output, listOf(0xf44c0..0xf44c3))
            check(output.word(0xf44c0) == (0x52800001 or (value shl 5)))
            for (next in presets.keys) {
                check(patchNativeMicrophonePreset(output, next, "2.0.23", "5002363")
                    .contentEquals(patchNativeMicrophonePreset(stock, next, "2.0.23", "5002363")))
            }
        }
        val brokenMic = stock.copyOf().apply { this[0xf44bc] = 0 }
        val savedMic = brokenMic.copyOf()
        rejects { patchNativeMicrophonePreset(brokenMic, "voice-recognition", "2.0.23", "5002363") }
        check(brokenMic.contentEquals(savedMic))
        check(patchNativeMicrophonePreset(stock, "voice-recognition", "2.0.22", "5002363").contentEquals(stock))
        println("PASS 5002363 microphone: 4 presets, 16 transitions, exact 4-byte diff, idempotence, atomic rejection, exact-pair guard")

        val tongue = patchModernTongueTransport(stock, "2.0.23", "5002363")
        exactDiff(tongue, listOf(0x141c6c until 0x141c6c + 24))
        check(tongue.copyOfRange(0x141c6c, 0x141c6c + 24).contentEquals(MODERN_TONGUE_REPLACEMENT_5002363))
        check(patchModernTongueTransport(tongue, "2.0.23", "5002363").contentEquals(tongue))
        check(patchModernTongueTransport(stock, "2.0.22", "5002363").contentEquals(stock))
        rejects { patchModernTongueTransport(stock.copyOf().apply { this[0x141c6c] = 0 }, "2.0.23", "5002363") }
        println("PASS 5002363 tongue: exact 24-byte block, idempotence, wrong-pair and bad-byte guards")

        val phoff = stock.longWord(32).toInt()
        val phsize = stock.shortWord(54)
        val headers = (0 until stock.shortWord(56)).map { phoff + it * phsize }
        val note = headers.single { stock.word(it) == 4 }
        val velocity = listOf(0x102190, 0x102194, 0x102198, 0x1021a4, 0x1021a8, 0x1021b4)
        val cave = 0x22f0f0
        val ranges = listOf(note until note + 56, cave until cave + 20, 0x101f1c..0x101f1f) + velocity.map { it until it + 4 }
        val offsets = listOf(0L, 1L, 60L, 100L, 1000L, 4000L)
        for (offset in offsets) {
            val output = patchVisualDelay(stock, offset, "2.0.23", "5002363")
            exactDiff(output, ranges)
            check(output.word(note) == 1 && output.word(note + 4) == 5)
            check(output.longWord(note + 8) == 0x22c000L)
            check(output.longWord(note + 16) == 0xc7c000L)
            check(output.longWord(note + 32) == 0x3104L && output.longWord(note + 48) == 0x4000L)
            check(output.word(0x101f1c) == (0x14000000 or (((0xc7f0f0 - 0x101f1c) / 4) and 0x3ffffff)))
            velocity.forEachIndexed { index, site ->
                check(output.word(site) == (0xB9000000.toInt() or (((28 + index * 4) / 4) shl 10) or (19 shl 5) or 31))
            }
            val ns = ((output.word(cave + 4) ushr 5) and 65535).toLong() or
                (((output.word(cave + 8) ushr 5) and 65535).toLong() shl 16)
            check(ns == offset * 1_000_000)
            check(patchVisualDelay(output, offset, "2.0.23", "5002363").contentEquals(output))
            for (next in offsets) {
                check(patchVisualDelay(output, next, "2.0.23", "5002363")
                    .contentEquals(patchVisualDelay(stock, next, "2.0.23", "5002363")))
            }
        }
        check(patchVisualDelay(stock, 60, "2.0.22", "5002363").contentEquals(stock))
        println("PASS 5002363 Visual Delay: 6 offsets, 36 transitions, exact branch/6 stores/PT_LOAD/cave bytes, original PLT preserved")

        // Shared native edits must commute; packaging order cannot change the result.
        val mutations: List<(ByteArray) -> ByteArray> = listOf(
            { patchModernTongueTransport(it, "2.0.23", "5002363") },
            { patchNativeMicrophonePreset(it, "voice-recognition", "2.0.23", "5002363") },
            { patchVisualDelay(it, 60, "2.0.23", "5002363") },
            {
                val bytes = it.copyOf()
                paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP).copyInto(bytes, findVideoShader(bytes))
                setProjectionSwapchainFormat(bytes, VideoOutputPrecision.SRGB8_HIGHP, "2.0.23", "5002363")
            },
        )
        val expected = mutations.fold(stock) { bytes, mutate -> mutate(bytes) }
        fun permutations(rest: List<Int>): List<List<Int>> = if (rest.isEmpty()) listOf(emptyList()) else
            rest.flatMap { index -> permutations(rest - index).map { listOf(index) + it } }
        for (order in permutations(mutations.indices.toList())) {
            val output = order.fold(stock) { bytes, index -> mutations[index](bytes) }
            check(output.contentEquals(expected))
            check(order.fold(output) { bytes, index -> mutations[index](bytes) }.contentEquals(output))
        }
        println("PASS 5002363 combined native patches: 24 execution orders and reapplications agree")

        val hmd = File(base, "assets/config/hmd_config.json").readText()
        for (profile in listOf("samsung-galaxy-xr", "meta-quest-pro", "pico-4-pro", "stock-no-change")) {
            val output = patchHmdModelIdentity(hmd, profile, exactProductLookup = true)
            check(patchHmdModelIdentity(output, profile, exactProductLookup = true) == output)
        }
        check(library.readBytes().sha256() == stock.sha256())
        println("PASS 5002363 identity profiles: real config/idempotence; source hash unchanged")
    }

    private fun ByteArray.word(offset: Int): Int = (0..3).fold(0) { value, i -> value or ((this[offset + i].toInt() and 255) shl (8 * i)) }
    private fun ByteArray.longWord(offset: Int): Long = (0..7).fold(0L) { value, i -> value or ((this[offset + i].toLong() and 255) shl (8 * i)) }
    private fun ByteArray.shortWord(offset: Int): Int = (this[offset].toInt() and 255) or ((this[offset + 1].toInt() and 255) shl 8)
    private fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
