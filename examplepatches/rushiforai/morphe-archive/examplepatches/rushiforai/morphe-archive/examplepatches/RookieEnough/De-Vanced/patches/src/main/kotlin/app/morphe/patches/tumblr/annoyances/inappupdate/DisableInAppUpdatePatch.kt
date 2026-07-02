/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/inappupdate/DisableInAppUpdatePatch.kt
 */
package app.morphe.patches.tumblr.annoyances.inappupdate

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tumblr.featureflags.addFeatureFlagOverride
import app.morphe.patches.tumblr.featureflags.overrideFeatureFlagsPatch

@Suppress("unused")
val disableInAppUpdatePatch = bytecodePatch(
    name = "Disable in-app update",
    description = "Disables the in-app update check and update prompt.",
) {
    dependsOn(overrideFeatureFlagsPatch)

    compatibleWith(AppCompatibilities.TUMBLR)

    execute {
        // Before checking for updates using Google Play core AppUpdateManager, the value of this feature flag is checked.
        // If this flag is false or the last update check was today and no update check is performed.
        addFeatureFlagOverride("inAppUpdate", "false")
    }
}

