package app.pigfoot.patches.camscanner

import org.w3c.dom.Document
import org.w3c.dom.Element

internal val removableAdComponents = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.facebook.ads.AudienceNetworkActivity",
    "com.vungle.ads.internal.ui.VungleActivity",
    "com.mbridge.msdk.config.activity.MBRewardVideoActivity",
    "com.mbridge.msdk.activity.MBCommonActivity",
    "com.mbridge.msdk.out.LoadingActivity",
    "com.mbridge.msdk.reward.player.MBRewardVideoActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTCeilingLandingPageActivity",
    "com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTLandingPageActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTPlayableLandingPageActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTVideoLandingPageLink2Activity",
    "com.bytedance.sdk.openadsdk.activity.single.TTHistoryLandingPageActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdTransActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTRewardVideoActivity",
    "com.bytedance.sdk.openadsdk.activity.TTRewardWebActivity",
    "com.bytedance.sdk.openadsdk.activity.TTFullWebActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTRewardExpressVideoActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTFullScreenVideoActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTFullScreenExpressVideoActivity",
    "com.bytedance.sdk.openadsdk.activity.single.TTAdActivity",
    "com.mbridge.msdk.foundation.same.broadcast.NetWorkChangeReceiver",
    "com.facebook.ads.AudienceNetworkContentProvider",
    "com.vungle.ads.VungleProvider",
    "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
    "com.google.android.gms.ads.flag.OPTIMIZE_INITIALIZATION",
    "com.google.android.gms.ads.flag.OPTIMIZE_AD_LOADING"
)
internal fun removeAdComponents(doc: Document): Int {
    val nodes = doc.getElementsByTagName("*")
    val remove = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttribute("android:name") in removableAdComponents }
    remove.forEach { it.parentNode.removeChild(it) }
    return remove.size
}
internal fun removeInternet(doc: Document): Int {
    val nodes = doc.getElementsByTagName("uses-permission")
    val remove = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttribute("android:name") == "android.permission.INTERNET" }
    require(remove.isNotEmpty()) { "INTERNET missing: unsupported or already offline input" }
    remove.forEach { it.parentNode.removeChild(it) }
    return remove.size
}
internal fun metadata(doc: Document, key: String, value: String) {
    val app = doc.getElementsByTagName("application").item(0) as Element
    val nodes = app.getElementsByTagName("meta-data")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttribute("android:name") == key }
    require(matches.size <= 1) { "Duplicate telemetry metadata: $key" }
    val element = matches.singleOrNull() ?: doc.createElement("meta-data").also { app.appendChild(it) }
    element.setAttribute("android:name", key)
    element.setAttribute("android:value", value)
}
