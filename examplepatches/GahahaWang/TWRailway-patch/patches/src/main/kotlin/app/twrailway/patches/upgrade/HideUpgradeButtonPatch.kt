package app.twrailway.patches.upgrade

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.twrailway.patches.settings.libappCopyPatch
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import java.util.logging.Logger

/** Makes the search pages never build the upgrade button in libapp.so. */
private val upgradeButtonLibraryPatch = rawResourcePatch {
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        if (libraries.isEmpty()) throw PatchException("Could not find libapp.so")

        var patchedCount = 0
        libraries.forEach { path ->
            if (!path.startsWith("lib/arm64-v8a/")) {
                patchLogger.warning("The upgrade button is only hidden for arm64-v8a, skipping $path")
                return@forEach
            }

            val file = get(path)
            val bytes = file.readBytes()
            val offsets = bytes.upgradeButtonChecks()
            if (offsets.isEmpty() || offsets.size > MAX_UPGRADE_BUTTONS) {
                throw PatchException("Expected 1 to $MAX_UPGRADE_BUTTONS upgrade buttons in $path, found ${offsets.size}")
            }

            offsets.forEach { offset -> NOP.copyInto(bytes, offset + TBNZ_INDEX * 4) }
            file.writeBytes(bytes)
            patchedCount++
        }

        if (patchedCount == 0) throw PatchException("Could not find an arm64-v8a libapp.so to patch")
    }
}

/**
 * The search pages (台鐵 and 高鐵) show a subscribe button, whose text
 * comes from Firebase Remote Config (`cta_subscribe_text`, e.g. "付費移除廣告，免開app 直接查").
 * It is Dart code, AOT compiled to `libapp.so`:
 *
 * ```dart
 * // _SearchPageWidget._buildUpgradeButton, and the same in _ThsrSearchPageWidget
 * Widget _buildUpgradeButton() => Obx(() {
 *       if (iapController.isPurchased.value) return const SizedBox();
 *       return Container(width: double.infinity, child: ElevatedButton(...));
 *     });
 * ```
 *
 * which compiles (arm64) to:
 *
 * ```
 * ldur  w1, [x0, #0x17]   ; iapController
 * add   x1, x1, x28, lsl #32
 * ldur  w0, [x1, #0x1b]   ; isPurchased
 * add   x0, x0, x28, lsl #32
 * mov   x1, x0
 * bl    RxObjectMixin.value
 * tbnz  w0, #4, button    ; false: build the button
 * ldr   x0, [x27, #0x7740] ; const SizedBox()
 * mov   sp, fp
 * ldp   fp, lr, [sp], #0x10
 * ret
 * ```
 *
 * The patch replaces the `tbnz` with a `nop`, so the button is never built. The subscription
 * itself is not unlocked: only this check in the two search pages is changed.
 *
 * The button can be shown again in the patch settings. As it is compiled code, the extension then
 * loads a copy of libapp.so with the `tbnz` put back, see `LibappCopy` in the extension.
 */
@Suppress("unused")
val hideUpgradeButtonPatch = bytecodePatch(
    name = "Hide upgrade button",
    description = "Hides the subscribe button (such as \"付費移除廣告，免開app 直接查\") of the search pages. " +
        "It can be shown again in the patch settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(libappCopyPatch, upgradeButtonLibraryPatch)

    execute {
        markPatchApplied("hide_upgrade_button")
    }
}

private val patchLogger = Logger.getLogger("HideUpgradeButtonPatch")

/** The 台鐵 and 高鐵 search pages. */
private const val MAX_UPGRADE_BUTTONS = 2

/** The check before the upgrade button, without the `bl` (index 5) whose offset differs. */
private val UPGRADE_BUTTON_CHECK = intArrayOf(
    0xb8417001.toInt(), // ldur w1, [x0, #0x17]
    0x8b1c8021.toInt(), // add x1, x1, x28, lsl #32
    0xb841b020.toInt(), // ldur w0, [x1, #0x1b]
    0x8b1c8000.toInt(), // add x0, x0, x28, lsl #32
    0xaa0003e1.toInt(), // mov x1, x0
    0, // bl RxObjectMixin.value
    0x372000a0, // tbnz w0, #4, +0x14
    0xf97ba360.toInt(), // ldr x0, [x27, #0x7740]
    0xaa1d03ef.toInt(), // mov sp, fp
    0xa8c179fd.toInt(), // ldp fp, lr, [sp], #0x10
    0xd65f03c0.toInt(), // ret
)
private const val BL_INDEX = 5
private const val TBNZ_INDEX = 6

private val NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())

/** Offsets of [UPGRADE_BUTTON_CHECK] whose `bl` calls the same function. */
private fun ByteArray.upgradeButtonChecks(): List<Int> {
    val result = mutableListOf<Int>()
    val blTargets = mutableSetOf<Long>()
    var offset = 0
    while (offset <= size - UPGRADE_BUTTON_CHECK.size * 4) {
        val matches = UPGRADE_BUTTON_CHECK.indices.all { i ->
            val word = readInt(offset + i * 4)
            if (i == BL_INDEX) word ushr 26 == 0x25 else word == UPGRADE_BUTTON_CHECK[i]
        }
        if (matches) {
            result += offset
            val bl = readInt(offset + BL_INDEX * 4)
            val imm26 = (bl shl 6) shr 6
            blTargets += offset + BL_INDEX * 4 + imm26.toLong() * 4
        }
        offset += 4
    }
    if (blTargets.size > 1) throw PatchException("The upgrade button checks call different functions")
    return result
}

private fun ByteArray.readInt(offset: Int) =
    (this[offset].toInt() and 0xff) or
        ((this[offset + 1].toInt() and 0xff) shl 8) or
        ((this[offset + 2].toInt() and 0xff) shl 16) or
        ((this[offset + 3].toInt() and 0xff) shl 24)
