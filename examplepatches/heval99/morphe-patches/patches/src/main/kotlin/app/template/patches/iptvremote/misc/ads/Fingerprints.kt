package app.template.patches.iptvremote.misc.ads

import app.morphe.patcher.Fingerprint

// Wortise is IPTV's ad mediation SDK (wraps AppLovin, Yandex Mobile Ads,
// Google Mobile Ads, etc.). Both initialize overloads are public API on
// the un-obfuscated com.wortise.ads.WortiseSdk class. Killing them prevents
// every mediated ad format from loading.
object WortiseSdkInitializeFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/wortise/ads/WortiseSdk;" &&
                method.name == "initialize" &&
                method.returnType == "V" &&
                method.parameters == listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                )
    }
)

object WortiseSdkInitializeWithListenerFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/wortise/ads/WortiseSdk;" &&
                method.name == "initialize" &&
                method.returnType == "V" &&
                method.parameters == listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lmi0;",
                )
    }
)