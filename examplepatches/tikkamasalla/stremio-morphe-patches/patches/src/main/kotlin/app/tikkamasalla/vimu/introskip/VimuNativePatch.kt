package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.patch.rawResourcePatch

private const val SO_PATH = "lib/armeabi-v7a/libmediaengine.so"

/** One 2-byte branch edit: the original bytes are checked before anything is written. */
private class BranchFix(val offset: Int, val expected0: Int, val expected1: Int, val patched0: Int)

private val BRANCH_FIXES = listOf(
    // beq to the logging path -> beq past it (the log path dereferences a null pointer).
    BranchFix(0x135db0, 0x10, 0xD0, 0x1F),
    // second null dereference in the same log path, hit on rewinds: beq 0x135f22 -> beq 0x135f42.
    BranchFix(0x135e7a, 0x52, 0xD0, 0x62),
)

/**
 * Skips two null dereference crashes on rapid seeks in the Vimu media engine.
 *
 * Changes one byte each at two branch instructions of
 * lib/armeabi-v7a/libmediaengine.so (file offsets 0x135db0 and 0x135e7a) so a
 * failed seek lookup returns instead of logging through a null pointer. The
 * original bytes are checked first: when they differ (another engine build)
 * that edit is left alone and the patch still succeeds, so the skip keeps
 * working without the crash fix. Runs with Intro Skip (Vimu).
 */
val vimuNativePatch = rawResourcePatch(
    name = "Intro Skip native fix (Vimu)",
    description = "Fixes native crashes on rapid seeks in the Vimu media engine. Runs with the Intro Skip (Vimu) patch.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)

    execute {
        val file = try {
            get(SO_PATH)
        } catch (error: Exception) {
            println("Vimu native fix: $SO_PATH not in this APK, skipped.")
            return@execute
        }
        val bytes = file.readBytes()
        for (fix in BRANCH_FIXES) {
            val hex = "0x" + fix.offset.toString(16)
            if (fix.offset + 2 > bytes.size) {
                println("Vimu native fix: $SO_PATH too small for $hex, skipped.")
                continue
            }
            val have0 = bytes[fix.offset].toInt() and 0xFF
            val have1 = bytes[fix.offset + 1].toInt() and 0xFF
            if (have0 != fix.expected0 || have1 != fix.expected1) {
                println(
                    "Vimu native fix: unexpected bytes at $hex " +
                        "(found ${have0.toString(16)} ${have1.toString(16)}), skipped.",
                )
                continue
            }
            bytes[fix.offset] = fix.patched0.toByte()
            println("Vimu native fix: patched $SO_PATH at $hex.")
        }
        file.writeBytes(bytes)
    }
}
