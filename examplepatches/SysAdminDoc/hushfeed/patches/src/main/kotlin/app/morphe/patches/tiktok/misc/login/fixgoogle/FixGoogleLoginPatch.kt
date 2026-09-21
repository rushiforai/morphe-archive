/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/misc/login/fixgoogle/FixGoogleLoginPatch.kt
 */
package app.morphe.patches.tiktok.misc.login.fixgoogle

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val fixGoogleLoginPatch = bytecodePatch(
    name = "Fix Google login",
    description = "Restores Google account sign-in after patching.",
    default = true,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        // returnEarly writes the same two instructions and refuses a method whose return type
        // is not Z first, which the raw smali did not: a build that made this answer a Boolean
        // object would have taken an integer return and failed verification on the phone.
        GoogleAuthAvailableFingerprint.method.returnEarly(false)
    }
}

