package com.dmoniak.patches.hungryshark.evolution

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_EVOLUTION
import java.util.logging.Logger

@Suppress("unused")
val evolutionFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Evolution (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks sharks, baby sharks, accessories, and gem packs in Hungry Shark Evolution by cleanly replacing billing service purchase methods and receipt validation. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_EVOLUTION)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFreeShoppingLogic(logger, "Hungry Shark Evolution")
    }
}
