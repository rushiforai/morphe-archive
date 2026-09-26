package com.dmoniak.patches.bbr

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BEACH_BUGGY_RACING
import java.util.logging.Logger

@Suppress("unused")
val bbrBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Beach Buggy Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Beach Buggy Racing for free spins of the Daily Fortune Wheel, post-race coin doublers, and instant ticket refills without viewing ads. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_BEACH_BUGGY_RACING)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Beach Buggy Racing")
    }
}

@Suppress("unused")
val bbrFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Beach Buggy Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and in-game purchase verification in Beach Buggy Racing to unlock car packages, gem bundles, and coin packs for free. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_BEACH_BUGGY_RACING)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Beach Buggy Racing")
    }
}
