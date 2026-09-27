package com.dmoniak.patches.fruitninja

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FRUIT_NINJA
import java.util.logging.Logger

@Suppress("unused")
val fruitNinjaBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Commercials - Fruit Ninja (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables pre-game video ads, post-match banners, and promotional reward prompts in Fruit Ninja by hooking real mediation SDKs.",
) {
    compatibleWith(COMPATIBILITY_FRUIT_NINJA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFruitNinjaBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeFruitNinjaBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Commercials patch for Fruit Ninja...")
    val hooked = executeComprehensiveAdBlock(logger, "FruitNinja")
    logger.info("[FruitNinja Ads] Total ad-blocking hooks applied: $hooked")
}
