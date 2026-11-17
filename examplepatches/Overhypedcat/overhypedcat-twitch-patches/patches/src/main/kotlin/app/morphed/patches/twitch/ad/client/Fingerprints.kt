package app.morphed.patches.twitch.ad.client

import app.morphe.patcher.Fingerprint

/**
 * Collects playback related reasons why a viewer is not shown a client-side (VAST) ad: Chromecast,
 * picture-in-picture, audio only. Every ad eligibility check adds these to its own reasons; any
 * reason at all means no ad.
 */
object AdIneligibilityReasonsFingerprint : Fingerprint(
    returnType = "Ljava/util/LinkedHashSet;",
    strings = listOf("Returning ineligible due to audio only mode"),
)

/**
 * The full ad eligibility check: channel, spacing, Turbo, subscription, raid and long tail reasons,
 * then the reasons from [AdIneligibilityReasonsFingerprint], returned together.
 */
object AdEligibilityCheckFingerprint : Fingerprint(
    strings = listOf("Returning ineligible due to long tail"),
)

/**
 * Where the app gets an ad trigger (a display ad beside the stream, LeftThird or Banner, or a video ad) and
 * decides to request the ad or decline it.
 */
object AdTriggerFingerprint : Fingerprint(
    strings = listOf("ad_request_client_trigger_received", "ad_request_client_trigger_declined"),
)
