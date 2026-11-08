package app.twrailway.patches.history

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.twrailway.patches.settings.libappCopyPatch
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import java.util.logging.Logger

/** Shows the expanded limit in the search history count and removes its "升級" text in libapp.so. */
private val searchHistoryCountLibraryPatch = rawResourcePatch {
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        if (libraries.isEmpty()) throw PatchException("Could not find libapp.so")

        var patchedCount = 0
        libraries.forEach { path ->
            if (!path.startsWith("lib/arm64-v8a/")) {
                patchLogger.warning("The search history count is only patched for arm64-v8a, skipping $path")
                return@forEach
            }

            val file = get(path)
            val bytes = file.readBytes()

            val clamp = bytes.single(BADGE_CLAMP, path, "search history count clamp")
            val limit = bytes.single(BADGE_LIMIT, path, "search history count limit")
            val text = bytes.single(BADGE_TEXT, path, "search history count text")

            bytes.writeWord(clamp + 4 * CLAMP_CMP_INDEX, cmpX0(EXPANDED_LIMIT))
            bytes.writeWord(clamp + 4 * CLAMP_MOV_INDEX, movX0(EXPANDED_LIMIT))
            bytes.writeWord(limit + 4 * LIMIT_MOV_INDEX, movX0(EXPANDED_LIMIT))
            BADGE_TEXT_PATCHED.forEachIndexed { i, word -> bytes.writeWord(text + 4 * i, word) }

            file.writeBytes(bytes)
            patchedCount++
        }

        if (patchedCount == 0) throw PatchException("Could not find an arm64-v8a libapp.so to patch")
    }
}

/**
 * Next to 搜尋歷史 on the search page, free users see a badge like "(3/3) 升級", which opens the
 * subscription page. It is Dart code, AOT compiled to `libapp.so`:
 *
 * ```dart
 * // _SearchPageWidget._buildSearchHistorySection
 * if (!iapController.isPurchased.value)
 *   HistoryUpgradeBadge(count: visibleHistory.length, limit: 3, onTap: ...)
 *
 * // HistoryUpgradeBadge.build
 * final shown = count < 0 ? 0 : count > 3 ? 3 : count;
 * Text("($shown/$limit) ${"search.upgradeBadge".tr}")
 * ```
 *
 * With Expand search history the page shows up to 20 searches, but the badge still counts to 3.
 * The patch:
 *
 * - changes the limit passed by the search page and the clamp in the badge from 3 to 20
 *   (`mov x0, #3` and `cmp x0, #3`), so the badge shows e.g. "(5/20)";
 * - loads ")" instead of ") " after the count, and translates the key "" instead of
 *   "search.upgradeBadge" (GetX returns a missing key as is, so it is empty), removing "升級".
 *
 * Both strings are already in the object pool, at offsets that only hold for the code matched
 * by [BADGE_TEXT], which itself loads its strings from fixed pool offsets.
 *
 * It can be turned off in the patch settings, and follows the number set for Expand search
 * history. As it is compiled code, the extension then loads a copy of libapp.so with those
 * values, see `LibappCopy` in the extension.
 */
@Suppress("unused")
val fixSearchHistoryCountPatch = bytecodePatch(
    name = "Fix search history count",
    description = "Shows the expanded limit (such as \"(5/20)\") in the count next to 搜尋歷史, " +
        "and removes the \"升級\" text. It can be turned off in the patch settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    // The count is set to the limit of the expanded search history.
    dependsOn(libappCopyPatch, expandSearchHistoryPatch, searchHistoryCountLibraryPatch)

    execute {
        markPatchApplied("fix_search_history_count")
    }
}

private val patchLogger = Logger.getLogger("FixSearchHistoryCountPatch")

private const val EXPANDED_LIMIT = 20

/** HistoryUpgradeBadge.build: `shown = count < 0 ? 0 : count > 3 ? 3 : count`. */
private val BADGE_CLAMP = intArrayOf(
    0xf840b020.toInt(), // ldur x0, [x1, #0xb]      ; count
    0xb6f80060.toInt(), // tbz x0, #63, +0xc
    0xd2800000.toInt(), // mov x0, #0
    0x14000004, //         b +0x10
    0xf1000c1f.toInt(), // cmp x0, #3
    0x5400004d, //         b.le +8
    0xd2800060.toInt(), // mov x0, #3
    0xf81f83a0.toInt(), // stur x0, [fp, #-8]
)
private const val CLAMP_CMP_INDEX = 4
private const val CLAMP_MOV_INDEX = 6

/** _buildSearchHistorySection: `HistoryUpgradeBadge(count: ..., limit: 3)`. */
private val BADGE_LIMIT = intArrayOf(
    0xaa0003e3.toInt(), // mov x3, x0               ; the badge
    0xf85c83a0.toInt(), // ldur x0, [fp, #-0x38]
    0xf81e83a3.toInt(), // stur x3, [fp, #-0x18]
    0xf800b060.toInt(), // stur x0, [x3, #0xb]      ; count
    0xd2800060.toInt(), // mov x0, #3
    0xf8013060.toInt(), // stur x0, [x3, #0x13]     ; limit
)
private const val LIMIT_MOV_INDEX = 4

/** HistoryUpgradeBadge.build: `") "` and `"search.upgradeBadge".tr` of the badge text. */
private val BADGE_TEXT = intArrayOf(
    0x91407370.toInt(), // add x16, PP, #0x1c, lsl #12
    0xf9466e10.toInt(), // ldr x16, [x16, #0xcd8]   ; ") "
    0xb801f050.toInt(), // stur w16, [x2, #0x1f]
    0x91407361.toInt(), // add x1, PP, #0x1c, lsl #12
    0xf9467021.toInt(), // ldr x1, [x1, #0xce0]     ; "search.upgradeBadge"
)

private val BADGE_TEXT_PATCHED = intArrayOf(
    addPp(16, CLOSE_PAREN_POOL_OFFSET),
    ldrPp(16, CLOSE_PAREN_POOL_OFFSET),
    BADGE_TEXT[2],
    addPp(1, EMPTY_STRING_POOL_OFFSET),
    ldrPp(1, EMPTY_STRING_POOL_OFFSET),
)

/** Object pool offsets of ")" and "" in 5.3.4. */
private const val CLOSE_PAREN_POOL_OFFSET = 0x10b8
private const val EMPTY_STRING_POOL_OFFSET = 0x788

/** `add xd, PP, #(offset >> 12), lsl #12`, PP being x27. */
private fun addPp(rd: Int, offset: Int) = 0x91400000.toInt() or ((offset ushr 12) shl 10) or (27 shl 5) or rd

/** `ldr xd, [xd, #(offset & 0xfff)]`. */
private fun ldrPp(rd: Int, offset: Int) = 0xf9400000.toInt() or (((offset and 0xfff) / 8) shl 10) or (rd shl 5) or rd

private fun cmpX0(value: Int) = 0xf100001f.toInt() or (value shl 10)

private fun movX0(value: Int) = 0xd2800000.toInt() or (value shl 5)

private fun ByteArray.single(pattern: IntArray, path: String, name: String): Int {
    val offsets = mutableListOf<Int>()
    var offset = 0
    while (offset <= size - pattern.size * 4) {
        if (pattern.indices.all { i -> readWord(offset + i * 4) == pattern[i] }) offsets += offset
        offset += 4
    }
    if (offsets.size != 1) throw PatchException("Expected one $name in $path, found ${offsets.size}")
    return offsets.single()
}

private fun ByteArray.readWord(offset: Int) =
    (this[offset].toInt() and 0xff) or
        ((this[offset + 1].toInt() and 0xff) shl 8) or
        ((this[offset + 2].toInt() and 0xff) shl 16) or
        ((this[offset + 3].toInt() and 0xff) shl 24)

private fun ByteArray.writeWord(offset: Int, value: Int) {
    this[offset] = value.toByte()
    this[offset + 1] = (value shr 8).toByte()
    this[offset + 2] = (value shr 16).toByte()
    this[offset + 3] = (value shr 24).toByte()
}
