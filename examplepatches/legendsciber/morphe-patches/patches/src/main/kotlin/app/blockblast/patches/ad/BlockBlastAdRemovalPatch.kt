package app.blockblast.patches.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.blockblast.patches.shared.Constants.COMPATIBILITY_BLOCKBLAST

/**
 * Block Blast Ad Removal
 *
 * Removes all ads (banner, interstitial, rewarded) by patching
 * all ad-related code paths to skip execution.
 *
 * How it works:
 *
 * 1. Banner ad control (be/b.smali c() and d()) → always returns immediately.
 *    Prevents banner show/hide logic from executing.
 *
 * 2. Banner ad display (be/a.smali i()) → always returns immediately.
 *    Prevents the primary banner display decision from executing.
 *
 * 3. Ad async work (yf/g.smali b()) → always returns immediately.
 *    Prevents ad-related async tasks from launching.
 *
 * 4. Ad SDK init (wg/h0.smali preAsyncInitWorkManager) → always returns immediately.
 *    Prevents AppLovin MAX SDK initialization.
 *
 * Note: isADShow is set from native Hermes bytecode and cannot be patched
 * at smali level. Instead, we patch all code paths that CHECK isADShow
 * to skip ad logic entirely.
 */
@Suppress("unused")
val blockblastAdRemovalPatch = bytecodePatch(
    name = "Ad Removal",
    description = "Removes all ads (banner, interstitial, rewarded).",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLOCKBLAST)

    execute {
        // 1. be/b.c() → return immediately (skip banner control)
        BannerAdControlFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 2. be/b.d() → return immediately (skip banner control variant)
        BannerAdControlVariantFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 3. be/a.i() → return immediately (skip banner display)
        BannerAdDisplayFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 4. yf/g.b() → return immediately (skip ad async work)
        AdAsyncWorkFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 5. wg/h0.preAsyncInitWorkManager → return immediately (skip ad SDK init)
        AdSdkInitFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())
    }
}
