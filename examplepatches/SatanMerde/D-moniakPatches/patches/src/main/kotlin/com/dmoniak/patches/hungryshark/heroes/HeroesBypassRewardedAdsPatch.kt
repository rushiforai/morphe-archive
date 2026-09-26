package com.dmoniak.patches.hungryshark.heroes

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_HEROES
import java.util.logging.Logger

@Suppress("unused")
val heroesBypassRewardedAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Heroes (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Hungry Shark Heroes for instant egg incubation and hatching, arena battle revives, and daily reward card multipliers. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_HEROES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Hungry Shark Heroes")
    }
}
