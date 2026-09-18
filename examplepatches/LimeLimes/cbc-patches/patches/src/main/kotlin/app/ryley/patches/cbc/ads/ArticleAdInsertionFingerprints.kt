package app.ryley.patches.cbc.ads

import app.morphe.patcher.Fingerprint

/**
 * `ca.cbc.android.data.handler.PolopolyHandler.insertAd(String): String`
 *
 * Splices the `[INSERTED_AD]` marker into the Polopoly CMS article body (`StringExtensions.intersperse`
 * on `</p>`). Instance method with registers v0..v8, so `this` is v7 and the incoming body is v8;
 * the method's own "no ads" path returns v8 unchanged.
 */
internal val PolopolyInsertAdFingerprint = Fingerprint(
    definingClass = "Lca/cbc/android/data/handler/PolopolyHandler;",
    name = "insertAd",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * `ca.cbc.android.data.parser.GqlStoryParserStrategyImpl.insertAds(ArrayList, InReadAdConfig, String): ArrayList`
 *
 * The GraphQL equivalent: inserts `InsertedAd` objects into the parsed article body. Registers are
 * v0..v9 with `this` at v6, the body list at v7, the config at v8 and the story id at v9; its own
 * "no ads" path returns v7.
 */
internal val GqlInsertAdsFingerprint = Fingerprint(
    definingClass = "Lca/cbc/android/data/parser/GqlStoryParserStrategyImpl;",
    name = "insertAds",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(
        "Ljava/util/ArrayList;",
        "Lca/cbc/android/ads/InReadAdConfig;",
        "Ljava/lang/String;",
    ),
)
