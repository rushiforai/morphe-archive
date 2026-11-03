package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.patch.rawResourcePatch

/** One branch edit: [expected] must be at [offset] before [patched] is written there. */
private class BranchFix(val offset: Int, val expected: ByteArray, val patched: ByteArray, val note: String)

/** Bytes that must already be at [offset] (the branch target); never written. */
private class Anchor(val offset: Int, val bytes: ByteArray)

/** All edits for one ABI's copy of the engine; applied all together or not at all. */
private class AbiFixes(val soPath: String, val fixes: List<BranchFix>, val anchors: List<Anchor>)

private fun hex(vararg b: Int) = ByteArray(b.size) { b[it].toByte() }

/*
 * Both copies hold the same internal seek-in-buffer function (logs "Seek buffering to audio: ...").
 * When the first or last queued packet is null it jumps to an error log that reads the packet pts
 * through that null pointer (rapid rewinds SIGSEGV). Each edit redirects the null branch to the
 * function's existing "return false" block, so only the log is skipped.
 */
private val ABI_FIXES = listOf(
    AbiFixes(
        "lib/armeabi-v7a/libmediaengine.so",
        listOf(
            // audio: beq 0x135dd4 ("Cannot seek audio buffer" log) -> beq 0x135df2 (b to return false).
            BranchFix(0x135db0, hex(0x10, 0xD0), hex(0x1F, 0xD0), "audio"),
            // video: beq 0x135f22 ("Cannot seek video buffer" log, crash pc 0x135f24) -> beq 0x135f42.
            BranchFix(0x135e7a, hex(0x52, 0xD0), hex(0x62, 0xD0), "video"),
        ),
        listOf(
            Anchor(0x135df2, hex(0xA6, 0xE0)), // b 0x135f42
            Anchor(0x135f42, hex(0x00, 0x24)), // movs r4, #0
        ),
    ),
    AbiFixes(
        "lib/arm64-v8a/libmediaengine.so",
        listOf(
            // audio: cbz x8 (last packet), #0x230cf0 -> cbz x8, #0x230d54.
            BranchFix(0x230b18, hex(0xC8, 0x0E, 0x00, 0xB4), hex(0xE8, 0x11, 0x00, 0xB4), "audio last"),
            // audio: cbz x9 (first packet), #0x230cf0 -> cbz x9, #0x230d54.
            BranchFix(0x230b1c, hex(0xA9, 0x0E, 0x00, 0xB4), hex(0xC9, 0x11, 0x00, 0xB4), "audio first"),
            // video: tbz w12, #0, #0x230d30 (log derefs at 0x230d34/0x230d38) -> tbz w12, #0, #0x230d54.
            BranchFix(0x230bc8, hex(0x4C, 0x0B, 0x00, 0x36), hex(0x6C, 0x0C, 0x00, 0x36), "video"),
        ),
        listOf(
            Anchor(0x230d54, hex(0xF4, 0x03, 0x1F, 0x2A)), // mov w20, wzr
        ),
    ),
)

private fun ByteArray.matches(offset: Int, want: ByteArray) =
    offset >= 0 && offset + want.size <= size && want.indices.all { this[offset + it] == want[it] }

private fun ByteArray.hexAt(offset: Int, n: Int) =
    (offset until minOf(offset + n, size)).joinToString(" ") { "%02x".format(this[it].toInt() and 0xFF) }

/**
 * Skips two null dereference crashes on rapid seeks in the Vimu media engine.
 *
 * Retargets the null-packet branches of the engine's seek-in-buffer function in both
 * lib/armeabi-v7a and lib/arm64-v8a libmediaengine.so, so a failed seek lookup returns
 * instead of logging through a null pointer. Each ABI is checked first (every original
 * byte and the branch target): when anything differs (another engine build) that ABI is
 * left alone and the patch still succeeds, so the skip keeps working without the crash
 * fix. Runs with Intro Skip (Vimu).
 */
val vimuNativePatch = rawResourcePatch(
    name = "Intro Skip native fix (Vimu)",
    description = "Fixes native crashes on rapid seeks in the Vimu media engine. Runs with the Intro Skip (Vimu) patch.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)

    execute {
        for (abi in ABI_FIXES) {
            val so = abi.soPath
            val file = try {
                get(so)
            } catch (error: Exception) {
                null
            }
            if (file == null || !file.isFile) {
                println("Vimu native fix: $so not in this APK, skipped.")
                continue
            }
            val bytes = file.readBytes()
            val bad = abi.fixes.filterNot { bytes.matches(it.offset, it.expected) }.map { it.offset to it.expected.size } +
                abi.anchors.filterNot { bytes.matches(it.offset, it.bytes) }.map { it.offset to it.bytes.size }
            if (bad.isNotEmpty()) {
                val where = bad.joinToString { (off, n) -> "0x${off.toString(16)} (found ${bytes.hexAt(off, n)})" }
                println("Vimu native fix: unexpected bytes in $so at $where, this ABI left unpatched.")
                continue
            }
            for (fix in abi.fixes) {
                fix.patched.copyInto(bytes, fix.offset)
                println("Vimu native fix: patched $so at 0x${fix.offset.toString(16)} (${fix.note}).")
            }
            file.writeBytes(bytes)
        }
    }
}
