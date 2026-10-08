package app.template.patches.iptvremote.misc.ads

import app.morphe.patcher.Fingerprint

// IPTV runs its own ad mediation layer: an abstract provider (R8-renamed, `a4` in 9.1.25)
// with two concrete subclasses. The ad-supported one (`b4`) rotates Yandex Mobile Ads,
// Wortise and a third network across banner/interstitial/instream placements; the other
// (`i5`) is the app's built-in no-ads provider (empty placement list, no-op interstitial,
// null instream page). Its `f(Context)J` reads the instream preload lead time from remote
// config under this key; IptvFreeApplication.onCreate also holds the string but returns
// void, so the return type and parameter pin the provider.
object AdProviderInstreamLeadFingerprint : Fingerprint(
    returnType = "J",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("instream_preload_lead_sec"),
)
