package app.ryley.patches.cbc.ads

import app.morphe.patcher.Fingerprint

/**
 * `ca.cbc.android.ads.InReadAdConfig.isAdsEnabled(): Boolean`
 *
 * The single gate for in-article ads. The config is built from remote config
 * (`NewsModules.configurations$lambda$0$1`) and read by both article body paths:
 *
 *  - `ca.cbc.android.data.handler.PolopolyHandler.insertAd(String)` — splices `[INSERTED_AD]`
 *    markers between paragraphs of the Polopoly HTML body.
 *  - `ca.cbc.android.data.parser.GqlStoryParserStrategyImpl.insertAds(...)` — same for the
 *    GraphQL story path.
 *
 * Both start with `if (!inReadAdConfig.isAdsEnabled()) return <body unchanged>`, so returning
 * false here keeps the article HTML free of ad markup.
 */
internal val InReadAdsEnabledFingerprint = Fingerprint(
    definingClass = "Lca/cbc/android/ads/InReadAdConfig;",
    name = "isAdsEnabled",
    returnType = "Z",
    parameters = emptyList(),
)
