package app.template.patches.textnow.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.template.patches.textnow.TextNowAdjustOnCreate
import app.template.patches.textnow.TextNowFlurryInit

/**
 * No-ops the **Adjust** (attribution) and **Flurry** (analytics) initialisers so neither
 * SDK ever starts, independently of their manifest components (disabled by
 * [textnowDisableTrackerComponentsPatch]).
 */
@Suppress("unused")
val textnowDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "No-ops the Adjust (attribution) and Flurry (analytics) SDK initialisers " +
        "so no tracking payload is collected or sent.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        TextNowAdjustOnCreate.method.returnEarly()
        TextNowFlurryInit.method.returnEarly()
    }
}
