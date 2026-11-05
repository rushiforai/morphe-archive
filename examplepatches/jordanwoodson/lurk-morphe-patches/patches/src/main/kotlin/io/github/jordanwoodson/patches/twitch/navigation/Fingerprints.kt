package io.github.jordanwoodson.patches.twitch.navigation

import app.morphe.patcher.Fingerprint

// The router every launch and link goes through: it stores the destination in the intent for the main
// screen, or sends a signed-out user to the login screen. A plain launch asks for the Default destination.
internal object DestinationRouterFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("destinationOrdinal", "intent_router"),
    custom = { method, _ -> method.parameterTypes.size == 3 && method.parameterTypes[1].toString() == "Landroid/os/Bundle;" },
)

// The React Native Home feed's initial props: DiscoveryFeedRNInitialPropsBuilder.build(isFromDeeplink,
// benchmarkRunId, benchmarkTrial, subfeedTab, subfeedSlug, subfeedContentType, clipSlug, seedClipSlug,
// consumeFeedPreload). Twitch keeps the class and method names; the strings are the props it writes.
internal object FeedInitialPropsFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/feature/discovery/feed/rn/feed/DiscoveryFeedRNInitialPropsBuilder;",
    name = "build",
    returnType = "Landroid/os/Bundle;",
    strings = listOf("subfeedTab", "discovery-feed", "isFromDeeplink"),
    custom = { method, _ ->
        method.parameterTypes.size == 9 && method.parameterTypes[0].toString() == "Z" &&
            method.parameterTypes[3].toString() == "Ljava/lang/String;"
    },
)
