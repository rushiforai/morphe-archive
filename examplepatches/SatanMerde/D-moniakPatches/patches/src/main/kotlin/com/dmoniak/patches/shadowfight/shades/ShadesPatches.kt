package com.dmoniak.patches.shadowfight.shades

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_SHADES
import java.util.logging.Logger

@Suppress("unused")
val shadesBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Shades Roguelike (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Shades: Shadow Fight Roguelike for instant in-run revives (Death Defy), free perk/shade rerolls, and extra rift keys. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_SHADES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Shades: Shadow Fight Roguelike")
    }
}

@Suppress("unused")
val shadesFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Shades Roguelike (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and store receipt validation in Shades: Shadow Fight Roguelike to unlock rift keys, gems, and rogue equipment sets. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_SHADES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shades: Shadow Fight Roguelike")
    }
}
