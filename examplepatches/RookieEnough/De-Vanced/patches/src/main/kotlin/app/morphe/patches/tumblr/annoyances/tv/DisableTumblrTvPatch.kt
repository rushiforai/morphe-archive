/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/tv/DisableTumblrTvPatch.kt
 */
package app.morphe.patches.tumblr.annoyances.tv

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tumblr.featureflags.addFeatureFlagOverride
import app.morphe.patches.tumblr.featureflags.overrideFeatureFlagsPatch

@Suppress("unused")
val disableTumblrTvPatch = bytecodePatch(
    name = "Disable Tumblr TV",
    description = "Removes the Tumblr TV navigation button from the bottom navigation bar.",
) {
    dependsOn(overrideFeatureFlagsPatch)

    compatibleWith(AppCompatibilities.TUMBLR)

    execute {
        addFeatureFlagOverride("tumblrTvMobileNav", "false")
    }
}

