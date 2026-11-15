/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramHideInstantsPatch = bytecodePatch(
    name = "Hide Instants",
    description = "Hides Instants from DMs page.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    dependsOn(
        overrideInstagramMobileConfigBooleanFlag(
            override = "71567::9" to false, // ig_studio_quick_snap_android::direct_variant_enabled
        ),
        overrideInstagramMobileConfigBooleanFlag(
            override = "71567::42" to false, // ig_studio_quick_snap_android::direct_variant_enabled_igid
        ),
    )
}
