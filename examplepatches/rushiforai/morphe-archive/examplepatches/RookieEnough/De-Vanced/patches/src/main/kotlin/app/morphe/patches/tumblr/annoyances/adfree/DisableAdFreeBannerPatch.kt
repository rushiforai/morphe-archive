/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/adfree/DisableAdFreeBannerPatch.kt
 */
package app.morphe.patches.tumblr.annoyances.adfree

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tumblr.featureflags.addFeatureFlagOverride
import app.morphe.patches.tumblr.featureflags.overrideFeatureFlagsPatch

@Suppress("unused")
val disableAdFreeBannerPatch = bytecodePatch(
    name = "Disable Ad-Free Banner",
    description = "Disables the banner with a frog, prompting you to buy Tumblr Ad-Free.",
) {
    dependsOn(overrideFeatureFlagsPatch)

    compatibleWith(AppCompatibilities.TUMBLR)

    execute {
        // Disable the "AD_FREE_CTA_BANNER" ("Whether or not to show ad free prompt") feature flag.
        addFeatureFlagOverride("adFreeCtaBanner", "false")
    }
}

