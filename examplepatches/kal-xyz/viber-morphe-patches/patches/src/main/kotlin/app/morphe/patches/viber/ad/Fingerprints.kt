package app.morphe.patches.viber.ad

import app.morphe.patcher.Fingerprint

internal object ViberAdLoaderFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("ad_unit_id", "banner_ad")
)

internal object ViberBannerViewFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("banner_container")
)