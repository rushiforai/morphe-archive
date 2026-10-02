package io.github.bakwudo.uyu.patches.twitch.theatre

import app.morphe.patcher.Fingerprint

internal const val ROUTE_DECISION_CLASS = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecision;"

/**
 * Decides whether a channel opens in the React Native theatre ("Ultralight") or in the native
 * theatre. Both the RN feed and the native launcher ask it. The names are not obfuscated.
 */
internal object RNTheatreRouteDecisionFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecisionKt;",
    name = "rnTheatreRouteDecision",
    returnType = ROUTE_DECISION_CLASS,
)
