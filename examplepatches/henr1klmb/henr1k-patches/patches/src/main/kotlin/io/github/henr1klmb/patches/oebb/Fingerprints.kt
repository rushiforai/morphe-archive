package io.github.henr1klmb.patches.oebb

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val OEBB_COMPATIBILITY = Compatibility(
    packageName = "de.hafas.android.oebb",
    name = "ÖBB Scotty",
    targets = listOf(AppTarget("9.0.5 (72)")),
)

// Tracking Fingerprints

internal object WebbugTryEnableTrackingFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Mismatch: No. of configured trackers != no. of mapping configs! No trackers initialized!"),
)

internal object HafasTrackingConsentFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("tracking", "TRACKING_ENABLED_DEFAULT"),
)

internal object PiwikTrackEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lde/hafas/tracking/data/TrackingEntry;"),
    strings = listOf("dimensionId should be great than 0 (arg: %d)"),
)

internal object PiwikTrackScreenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lde/hafas/tracking/data/TrackingEntry;"),
    strings = listOf("Screen tracking requires a non-empty path"),
)

internal object MatomoInstallReferrerFingerprint : Fingerprint(
    definingClass = "Lorg/matomo/sdk/extra/InstallReferrerReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
)

// Ads & WebView Fingerprints

internal object HafasWebViewClientFingerprint : Fingerprint(
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    superclass = "Landroid/webkit/WebViewClient;",
)

internal object OebbDrawerAdFingerprint : Fingerprint(
    name = "updateOebbAdView",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("ch.swift.willi"),
)

internal object ShowTrmBannersFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    strings = listOf("topPlaceholder", "bottomPlaceholder", "loyaltyPlaceholder"),
)

internal object OebbAdClickHandlerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("https://wegfinder.app/scotty", "oebb-banner-ad"),
)

internal object OebbConnectionOverviewAdFingerprint : Fingerprint(
    returnType = "Landroidx/recyclerview/widget/RecyclerView\$e0;",
    parameters = listOf("Landroid/view/ViewGroup;", "I"),
    strings = listOf("oebbAdView", "WAYFINDER_AD_ENABLED"),
)

// Map Fingerprints

internal object MapScreenMapComponentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(
        "de.hafas.googlemap.component.GoogleMapComponent",
        "de.hafas.haconmap.component.HaconMapComponent",
    ),
)

internal object OsmTileProviderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("OSM", "MAP_SERVER_OSM", "MAP_SERVER_OSM_RETINA"),
)

internal object TileHttpConnectionFingerprint : Fingerprint(
    returnType = "Ljava/net/HttpURLConnection;",
    parameters = listOf("Ljava/lang/String;"),
)
