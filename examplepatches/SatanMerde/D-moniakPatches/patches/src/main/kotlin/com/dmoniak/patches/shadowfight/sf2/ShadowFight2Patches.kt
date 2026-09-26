package com.dmoniak.patches.shadowfight.sf2

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_2
import java.util.logging.Logger

@Suppress("unused")
val sf2BypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Shadow Fight 2 for instant energy/stamina refills and post-duel coin multipliers without watching ads. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Shadow Fight 2")
    }
}

@Suppress("unused")
val sf2FreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and receipt validation in Shadow Fight 2 to unlock coins, gems, weapons, and armor in the Dojo store. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shadow Fight 2")
    }
}
