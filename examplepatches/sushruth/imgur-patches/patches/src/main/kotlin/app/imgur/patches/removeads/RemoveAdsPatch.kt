package app.imgur.patches.removeads

import app.imgur.patches.shared.Constants.COMPATIBILITY_IMGUR
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Forces the "Emerald" (no-ads) entitlement flag. The app gates every ad surface
 * on this flag:
 *
 * - Feed ads (legacy feed filters promoted items when ads are disabled)
 * - Ad tiles in the new Spaces feed (promoted is excluded from the API request)
 * - Sticky/banner/headliner/insertable/full-page ads
 * - Sponsored reactions
 *
 * See FeatureUtils.isForceEmeraldEnabled() in the decompiled APK.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes all ads in the app by forcing the no-ads (Emerald) entitlement flag.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IMGUR)

    execute {
        IsForceEmeraldEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
