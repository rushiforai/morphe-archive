package app.hellvetica.patches.sankaku

import app.morphe.patcher.patch.rawResourcePatch
import app.hellvetica.patches.shared.Constants.COMPATIBILITY_SANKAKU

/**
 * Patch to disable the "Want unlimited access? Get Sankaku Infinite!" upsell popup
 * in the Sankaku Channel app (com.sankakucomplex.channel.black).
 *
 * ## App architecture
 * Sankaku Channel is a React Native application. Its UI and business logic are compiled
 * into a Hermes bytecode file at `assets/index.android.bundle`.
 *
 * ## Root cause analysis (via hbc-decompiler + hbc-disassembler)
 *
 * The popup is controlled by function #43041 `showPopupUpsell` located at
 * file offset 0x00DE772B. The decompiled logic is:
 *
 * ```js
 * function showPopupUpsell() {
 *     if (isPremium) { return; }  // ← JmpTrue offset=116, reg=r1
 *     setUpsellCounting({ lastShowBannerUpsellTime: Date.now() });
 *     setIsShowModalUpsell(true);  // ← This shows the popup
 * }
 * ```
 *
 * The Hermes bytecode at function offset 0x00:
 * ```
 * 0x00: GetEnvironment     r0, 0        ; r0 = environment (always truthy object)
 * 0x03: LoadFromEnvironment r1, r0, 3   ; r1 = isPremium flag
 * 0x07: JmpTrue            116, r1      ; if isPremium → skip popup (return)
 * 0x0A: ... (popup display code)
 * 0x7B: LoadConstUndefined r0
 * 0x7D: Ret                r0           ; return undefined
 * ```
 *
 * ## Patch strategy (single byte change)
 *
 * Change the `JmpTrue` instruction's register operand from `r1` (isPremium) to `r0`
 * (environment object, which is **always truthy**). This makes the jump unconditional,
 * so `showPopupUpsell` **always** takes the "skip" branch and never displays the popup.
 *
 * Original bytes (function start, 10 bytes):
 *   `29 00 00  2E 01 00 03  90 74 01`
 *                                  ↑ register r1 (isPremium)
 *
 * Patched bytes:
 *   `29 00 00  2E 01 00 03  90 74 00`
 *                                  ↑ register r0 (environment = always truthy → always jumps)
 *
 * This is a 1-byte change at file offset 0x00DE7734.
 * The function size remains unchanged; no offsets are shifted.
 */
@Suppress("unused")
val disableInfinitePopupPatch = rawResourcePatch(
    name = "Disable Infinite Upgrade Popup",
    description = "Disables the \"Want unlimited access? Get Sankaku Infinite!\" " +
            "upsell popup that periodically appears while browsing the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SANKAKU)

    execute {
        val bundlePath = "assets/index.android.bundle"

        // Unique byte pattern: the first 10 bytes of function #43041 showPopupUpsell.
        //
        // 29 00 00  = GetEnvironment r0, 0
        // 2E 01 00 03 = LoadFromEnvironment r1, r0, slot3
        // 90 74 01  = JmpTrue addr=116, reg=r1   ← the `01` is what we change to `00`
        //
        // This pattern is unique within the entire bundle (verified by binary search).
        val targetPattern = byteArrayOf(
            0x29, 0x00, 0x00,        // GetEnvironment r0, 0
            0x2E.toByte(), 0x01, 0x00, 0x03,  // LoadFromEnvironment r1, r0, 3
            0x90.toByte(), 0x74, 0x01,          // JmpTrue 116, r1
        )

        // Patched version: only the last byte changes (r1 → r0).
        val replacementPattern = byteArrayOf(
            0x29, 0x00, 0x00,
            0x2E.toByte(), 0x01, 0x00, 0x03,
            0x90.toByte(), 0x74, 0x00,          // JmpTrue 116, r0  ← always truthy
        )

        val bundleFile = get(bundlePath)
        val content = bundleFile.readBytes()
        val patched = content.copyOf()

        // Search for the unique pattern and patch it.
        var matchIndex = -1
        outer@ for (i in 0..(patched.size - targetPattern.size)) {
            for (j in targetPattern.indices) {
                if (patched[i + j] != targetPattern[j]) continue@outer
            }
            matchIndex = i
            break
        }

        require(matchIndex >= 0) {
            "showPopupUpsell function signature not found in $bundlePath. " +
                    "The app may have been updated. Expected pattern: " +
                    targetPattern.joinToString(" ") { "0x%02X".format(it) }
        }

        // Apply the single-byte patch.
        replacementPattern.copyInto(patched, matchIndex)

        bundleFile.writeBytes(patched)
    }
}
