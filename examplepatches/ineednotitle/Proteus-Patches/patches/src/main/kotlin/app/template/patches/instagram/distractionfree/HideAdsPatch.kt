/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.returnEarly

private object DisableAdsFingerprint : Fingerprint(
    strings = listOf("Is ad pod"),
)

@Suppress("unused")
val instagramHideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes ads from the Instagram feed and stories.",
    default = true,
) {
    dependsOn(
        overrideInstagramMobileConfigBooleanFlag(
            override = "110800::0" to false, // ig_android_controller_migration::use_v2_controller
        ),
    )

    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        DisableAdsFingerprint.method.returnEarly(false)
    }
}
