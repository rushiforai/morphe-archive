package com.dmoniak.patches.hungryshark.evolution

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_EVOLUTION
import java.util.logging.Logger

@Suppress("unused")
val evolutionBypassRewardedAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Evolution (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Hungry Shark Evolution for free revives on Game Over, doubling gold and gems, daily spins, and treasure chests. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_EVOLUTION)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Hungry Shark Evolution")
    }
}
