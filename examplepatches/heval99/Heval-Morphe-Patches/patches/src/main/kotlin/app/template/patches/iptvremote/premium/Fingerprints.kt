package app.template.patches.iptvremote.premium

import app.morphe.patcher.Fingerprint

// IptvFreeApplication.k()Z is the pro/trial gate. Base IptvApplication.k()Z
// returns false; the free app override returns true only during the 20-minute
// trial window after install (checks m5.l install time vs 0x124f80 ms). After
// trial expiry the free app nags the user with in-app review prompts and
// locks pro features. The separate Pro app (ru.iptvremote.android.iptv.pro)
// ships its own IptvApplication subclass that always returns true.
//
// Method name "k" is R8-obfuscated and may rotate between versions, but the
// free app class name is preserved and k()Z is the only no-arg boolean method
// declared on IptvFreeApplication, so the signature uniquely identifies it.
object IptvFreeApplicationIsProFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lru/iptvremote/android/iptv/IptvFreeApplication;" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)