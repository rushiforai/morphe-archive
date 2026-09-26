package com.dmoniak.patches.shadowfight.arena

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_4
import java.util.logging.Logger

@Suppress("unused")
val sfaBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Shadow Fight Arena (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Shadow Fight 4: Arena for free roulette spins, warrior chest timer skips, and bonus hero card rewards. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_4)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Shadow Fight 4: Arena")
    }
}

@Suppress("unused")
val sfaFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Shadow Fight Arena (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and client-side store verification in Shadow Fight 4: Arena to simulate in-app purchases. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_4)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shadow Fight 4: Arena")
    }
}
