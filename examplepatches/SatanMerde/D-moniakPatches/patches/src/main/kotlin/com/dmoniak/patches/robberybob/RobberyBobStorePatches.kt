package com.dmoniak.patches.robberybob

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ROBBERY_BOB
import java.util.logging.Logger

@Suppress("unused")
val robberyBobBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Robbery Bob (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Robbery Bob for free stealth utility gadgets (wind-up noisy toys, donuts, invisibility potions) and free level continues. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_ROBBERY_BOB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Robbery Bob")
    }
}

@Suppress("unused")
val robberyBobFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Robbery Bob (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing in Robbery Bob to unlock all thief outfits, ability upgrades, and utility packs for free. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_ROBBERY_BOB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Robbery Bob")
    }
}
