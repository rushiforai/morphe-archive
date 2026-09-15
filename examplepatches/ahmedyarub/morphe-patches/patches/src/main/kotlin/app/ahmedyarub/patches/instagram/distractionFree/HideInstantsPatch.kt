/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * Compatibility widened to Instagram 446.0.0.49.77; patch logic unchanged.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.morphe.library.instagram.patches.overrideMobileConfigBooleanFlag
import app.morphe.patcher.patch.bytecodePatch
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val hideInstantsPatch = bytecodePatch(
    name = "Hide Instants",
    description = "Hides Instants from DMs page.",
    default = false
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(
        overrideMobileConfigBooleanFlag(
            override = "71567::9" to false // ig_studio_quick_snap_android::direct_variant_enabled
        ),
        overrideMobileConfigBooleanFlag(
            override = "71567::42" to false // ig_studio_quick_snap_android::direct_variant_enabled_igid
        )
    )
}
