package com.dmoniak.patches.shadowfight.sf2se

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_2_SE
import java.util.logging.Logger

@Suppress("unused")
val sf2seFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - SF2 Special Edition (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient in Shadow Fight 2 Special Edition to unlock premium weapons, armor, and gems without grinding. Note: Special Edition has no ads and unlimited energy by design. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2_SE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shadow Fight 2 Special Edition")
    }
}
