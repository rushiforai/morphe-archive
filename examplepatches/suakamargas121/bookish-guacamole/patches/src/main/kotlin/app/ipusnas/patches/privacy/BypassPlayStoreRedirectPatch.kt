package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

/**
 * The app is protected by Google's PairIP / Play Integrity license checker.
 * `performLocalInstallerCheck()` returns `false` when the app was not installed
 * through `com.android.vending` (Play Store), which makes the app show a
 * "Something went wrong" dialog and redirect the user to the Play Store after
 * a few seconds — closing the app. This is a known blocker for any sideloaded
 * or patched build.
 *
 * Making the method always return `true` lets the license check proceed as if
 * the app came from the Play Store.
 */
@Suppress("unused")
val bypassPlayStoreRedirectPatch = bytecodePatch(
    name = "Bypass Play Store redirect",
    description = "Makes the PairIP license check pass for sideloaded installs so the app no longer redirects to the Play Store and closes.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        LicenseClientPerformLocalInstallerCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
