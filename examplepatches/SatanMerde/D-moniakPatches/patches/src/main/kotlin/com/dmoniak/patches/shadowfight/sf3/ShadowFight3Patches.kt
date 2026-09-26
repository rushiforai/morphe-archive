package com.dmoniak.patches.shadowfight.sf3

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_3
import java.util.logging.Logger

@Suppress("unused")
val sf3BypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Shadow Fight 3 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Shadow Fight 3 for instant duel chest unlock timer skips, free booster card draws, bonus shadow energy, and quest multipliers. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_3)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Shadow Fight 3")
    }
}

@Suppress("unused")
val sf3FreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Shadow Fight 3 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and Banzai Games purchasing service in Shadow Fight 3 to simulate store purchases for booster packs and equipment in campaign mode. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_3)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shadow Fight 3")
    }
}
