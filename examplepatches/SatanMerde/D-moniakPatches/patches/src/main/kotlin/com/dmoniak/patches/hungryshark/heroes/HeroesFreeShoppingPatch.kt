package com.dmoniak.patches.hungryshark.heroes

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.hungryshark.executeFreeShoppingLogic
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_HEROES
import java.util.logging.Logger

@Suppress("unused")
val heroesFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Heroes (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks gem packs, shark training bundles, and reef expansions in Hungry Shark Heroes by cleanly replacing billing service purchase methods. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_HEROES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFreeShoppingLogic(logger, "Hungry Shark Heroes")
    }
}
