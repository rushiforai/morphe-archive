package app.ryley.patches.cbc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ryley.patches.cbc.shared.Constants.COMPATIBILITY_CBC_NEWS

/**
 * Removes the ads the app splices into article bodies.
 *
 * Three hooks, so the removal does not depend on a single remote-config value:
 *
 *  1. `InReadAdConfig.isAdsEnabled()` returns false — the config gate both insertion sites consult.
 *  2. `PolopolyHandler.insertAd(String)` returns the CMS body untouched (no `[INSERTED_AD]` markers).
 *  3. `GqlStoryParserStrategyImpl.insertAds(...)` returns the parsed body list untouched.
 *
 * (2) and (3) are the app's own no-ads paths — the same values the methods return when the config
 * gate is already false — so behaviour stays identical for callers if CBC changes how the gate is
 * read.
 */
@Suppress("unused")
val disableArticleAdsPatch = bytecodePatch(
    name = "Disable article ads",
    description = "Prevents ads from being inserted into article bodies.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CBC_NEWS)

    execute {
        InReadAdsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Return the article body unchanged instead of interspersing ad markers.
        PolopolyInsertAdFingerprint.method.addInstructions(0, "return-object v8")

        // Return the parsed body list unchanged instead of inserting InsertedAd items.
        GqlInsertAdsFingerprint.method.addInstructions(0, "return-object v7")
    }
}
