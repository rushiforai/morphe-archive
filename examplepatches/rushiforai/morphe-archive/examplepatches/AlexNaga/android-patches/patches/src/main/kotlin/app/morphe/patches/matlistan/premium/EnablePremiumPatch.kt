package app.morphe.patches.matlistan.premium

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Removes item/list limits and unlocks premium features (copy to list, manual sort, etc.)."
) {
    compatibleWith(Compatibility(
        name = "Matlistan",
        packageName = "se.matlistan.free",
        appIconColor = 0x00C29B,
        targets = listOf(AppTarget("3.10.0"))
    ))

    execute {
        IsPremiumUiFingerprint.method.returnEarly(true)
        IsPremiumAppFingerprint.method.returnEarly(true)
    }
}
