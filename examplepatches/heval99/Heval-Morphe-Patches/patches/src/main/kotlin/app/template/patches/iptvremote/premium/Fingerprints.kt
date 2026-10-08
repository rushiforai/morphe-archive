package app.template.patches.iptvremote.premium

import app.morphe.patcher.Fingerprint

// IptvFreeApplication.k()Z returns true when an interstitial was closed less than 20 minutes
// ago (m5.l is stamped in the Google AdListener's onAdClosed). It is not a Pro or trial gate:
// its only caller, IptvChannelsActivity, uses it to skip the Play in-app review prompt.
// Forcing it true keeps that prompt away.
//
// Method name "k" is R8-obfuscated and may rotate between versions, but the free app class
// name is preserved and k()Z is the only no-arg boolean method declared on
// IptvFreeApplication, so the signature uniquely identifies it.
object IptvFreeApplicationIsProFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lru/iptvremote/android/iptv/IptvFreeApplication;" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)
