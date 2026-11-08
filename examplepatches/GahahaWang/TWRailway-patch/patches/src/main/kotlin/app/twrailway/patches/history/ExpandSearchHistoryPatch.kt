package app.twrailway.patches.history

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.twrailway.patches.settings.libappCopyPatch
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import java.util.logging.Logger

/** Sets the search history limit to 20 in libapp.so. */
private val searchHistoryLimitLibraryPatch = rawResourcePatch {
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        if (libraries.isEmpty()) throw PatchException("Could not find libapp.so")

        var patchedCount = 0
        libraries.forEach { path ->
            if (!path.startsWith("lib/arm64-v8a/")) {
                patchLogger.warning("Search history limit is only patched for arm64-v8a, skipping $path")
                return@forEach
            }

            val file = get(path)
            val bytes = file.readBytes()
            val offsets = bytes.indicesOf(VISIBLE_HISTORY_LIMIT)
            if (offsets.size != 1) {
                throw PatchException("Expected one search history limit in $path, found ${offsets.size}")
            }

            EXPANDED_LIMIT.copyInto(bytes, offsets.single())
            file.writeBytes(bytes)
            patchedCount++
        }

        if (patchedCount == 0) throw PatchException("Could not find an arm64-v8a libapp.so to patch")
    }
}

/**
 * The search history (最近搜尋) keeps up to 20 searches, but the search page only shows 3 of them
 * unless the subscription is active. This is decided in Dart, which is AOT compiled to
 * `libapp.so`:
 *
 * ```dart
 * // SearchHistoryManager.getVisibleItems
 * List<SearchHistoryItem> getVisibleItems(bool isPremium) =>
 *     items.take(isPremium ? 20 : 3).toList();
 * ```
 *
 * which compiles (arm64) to the Smi arithmetic below, where `x2` is the bool argument and `x0`
 * ends up as the Smi 3 (6) or 20 (0x28):
 *
 * ```
 * tst   x2, #0x10
 * csetm x0, eq          ; -1 if isPremium, else 0
 * mov   x16, #0x22
 * and   x0, x0, x16
 * add   x0, x0, #6
 * ```
 *
 * The patch replaces `csetm x0, eq` with `mov x0, #0x22`, so the limit is always 20.
 *
 * The number can be changed in the patch settings (1 to 20, or the app's own behavior). As it is
 * compiled code, the extension writes a copy of libapp.so with that number to the app's files
 * directory and passes it to the Flutter engine (`--aot-shared-library-name`) when the app starts,
 * see `LibappCopy` in the extension. The default of 20 uses the installed libapp.so.
 */
@Suppress("unused")
val expandSearchHistoryPatch = bytecodePatch(
    name = "Expand search history",
    description = "Shows up to 20 recent searches instead of 3. The number can be changed in the patch settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(libappCopyPatch, searchHistoryLimitLibraryPatch)

    execute {
        markPatchApplied("expand_search_history")
    }
}

private val patchLogger = Logger.getLogger("ExpandSearchHistoryPatch")

/** `csetm x0, eq; mov x16, #0x22; and x0, x0, x16; add x0, x0, #6`. */
private val VISIBLE_HISTORY_LIMIT = bytes(
    0xe0, 0x13, 0x9f, 0xda,
    0x50, 0x04, 0x80, 0xd2,
    0x00, 0x00, 0x10, 0x8a,
    0x00, 0x18, 0x00, 0x91,
)

/** `mov x0, #0x22`, replacing the `csetm`. */
private val EXPANDED_LIMIT = bytes(0x40, 0x04, 0x80, 0xd2)

private fun bytes(vararg values: Int) = ByteArray(values.size) { values[it].toByte() }

/** Offsets of [pattern] in this array, at 4 byte aligned positions as arm64 instructions are. */
private fun ByteArray.indicesOf(pattern: ByteArray): List<Int> {
    val result = mutableListOf<Int>()
    var i = 0
    while (i <= size - pattern.size) {
        var match = true
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) {
                match = false
                break
            }
        }
        if (match) result += i
        i += 4
    }
    return result
}
