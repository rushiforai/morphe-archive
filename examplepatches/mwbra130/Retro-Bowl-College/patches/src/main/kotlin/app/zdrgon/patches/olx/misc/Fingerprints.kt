package app.zdrgon.patches.olx.misc

import app.morphe.patcher.Fingerprint

/**
 * The per-hit sink of the search repository: rrb.emit (a Flow
 * collector in Lrrb;, classes2.dex) deserializes each
 * ElasticSearch hit's "_source" into a ListingModel
 * (Ldl7;) via Lcl7;.a(Lcz6;Lwz6;)Ldl7;, de-duplicates it
 * by id against the repository's LinkedHashSet, and emits it
 * downstream. Every home / search / category listing passes through
 * this one method. Lrrb; declares exactly one emit method, so
 * class + name + signature identifies it uniquely. (No strings
 * criterion: patcher 2.4.0 failed to match this fingerprint while
 * the strings list was present — v1.79.21 — even though both
 * strings are in the method; the bundle's proven fingerprints
 * match on class/name/signature alone.)
 */
object ListingEmitFingerprint : Fingerprint(
    definingClass = "Lrrb;",
    name = "emit",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Lv13;"),
)

/**
 * The promo interleave of the search feed: urb.invokeSuspend
 * (Lurb;, classes2.dex) is the search repository's flow
 * transform; at fixed slots it substitutes/inserts promo items
 * (FeaturedAgency, CarInspectionWidget, the Google Ads
 * ListingAdBanner, InterScroller) into the listing stream. Lurb;
 * declares exactly one invokeSuspend method, so class + name +
 * signature identifies it uniquely. (No strings criterion — see
 * ListingEmitFingerprint above.)
 */
object FeedTransformFingerprint : Fingerprint(
    definingClass = "Lurb;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)
