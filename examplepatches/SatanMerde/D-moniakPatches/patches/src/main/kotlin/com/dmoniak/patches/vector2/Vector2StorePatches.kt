package com.dmoniak.patches.vector2

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeBypassRewardedAdsLogic
import com.dmoniak.patches.shadowfight.executeShadowFightFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VECTOR_2
import java.util.logging.Logger

@Suppress("unused")
val vector2BypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Vector 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses rewarded video ads in Vector 2 for free protocol revives upon death and instant datacore decryption without watching ads. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_VECTOR_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Vector 2")
    }
}

@Suppress("unused")
val vector2FreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Vector 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing in Vector 2 to obtain upgrade chips, research tokens, and accelerator packs for free. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_VECTOR_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Vector 2")
    }
}
