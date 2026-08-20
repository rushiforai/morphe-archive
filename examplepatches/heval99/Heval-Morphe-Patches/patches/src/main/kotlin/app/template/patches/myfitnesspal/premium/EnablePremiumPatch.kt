package app.template.patches.myfitnesspal.premium

import app.template.patches.shared.Constants.COMPATIBILITY_MYFITNESSPAL

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(COMPATIBILITY_MYFITNESSPAL)

    execute {
        GetPremiumPlusFingerprint.method.returnEarly(true)
    }
}