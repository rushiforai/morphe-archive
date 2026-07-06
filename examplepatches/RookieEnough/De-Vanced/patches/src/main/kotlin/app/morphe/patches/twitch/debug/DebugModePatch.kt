/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/debug/DebugModePatch.kt
 */
package app.morphe.patches.twitch.debug

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val debugModePatch = bytecodePatch(
    name = "Debug mode",
    description = "Enables Twitch's internal debugging mode.",
    default = false,
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // Upstream uses extension/resources/preferences; we just force-enable debug behavior.
        IsDebugConfigEnabledMethodFingerprint.method.returnEarly(true)
        IsOmVerificationEnabledMethodFingerprint.method.returnEarly(true)
        ShouldShowDebugOptionsMethodFingerprint.method.returnEarly(true)
    }
}

