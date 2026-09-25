package com.dmoniak.patches.shadowfight

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_2
import java.util.logging.Logger

@Suppress("unused")
val shadowFightBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Shadow Fight 2 for free energy refills and reward multipliers without watching ads. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Shadow Fight 2")
    }
}
