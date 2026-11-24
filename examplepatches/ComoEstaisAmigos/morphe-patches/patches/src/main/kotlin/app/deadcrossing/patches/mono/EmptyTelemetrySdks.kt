package app.deadcrossing.patches.mono

import app.deadcrossing.patches.shared.Constants.UNITY_ANDROID_ACTIVITY
import app.deadcrossing.patches.shared.blankConstStrings
import app.adebisi.patches.shared.PUBLIC
import app.adebisi.patches.shared.STATIC
import app.adebisi.patches.shared.addStub
import app.adebisi.patches.shared.emptySdkPrefixes
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Java ad/analytics SDKs whose method and field string constants still hold their hosts.
 * Feelingtouch wrappers stay; [stubTelemetryWrappers] makes them return before they touch
 * these types. Youmi is emptied by [app.deadcrossing.patches.compat.emptyYoumiSdksPatch],
 * not here. Billing (`Lcom/android/vending/`) stays.
 */
internal val TELEMETRY_SDK_PREFIXES = listOf(
    "Lcom/chartboost/" to 211,
    "Lcom/tapjoy/" to 166,
    "Lcom/applovin/" to 146,
    "Lcom/sponsorpay/" to 76,
    "Lcom/flurry/" to 50,
    "Lcom/aarki/" to 37,
    "Lcom/inmobi/" to 28,
    "Lcom/apsalar/" to 25,
    "Lcom/google/ads/" to 197,
)

internal val TELEMETRY_WRAPPERS = listOf(
    "Lcom/feelingtouch/unityandroid/OfferWallUtil;",
    "Lcom/feelingtouch/felad/FelAdManager;",
)

internal val TELEMETRY_CONST_STRING_KEYS = listOf(
    "TAPJOY_ID",
    "TAPJOY_KEY",
    "CB_APPID",
    "CB_SIGNATURE",
    "AARKI_KEY",
    "AARKI_EVENT_ID",
    "SPONSORPAY_APP_ID",
    "SPONSORPAY_SECURITY_TOKEN",
)

internal val TELEMETRY_META_KEYS = TELEMETRY_CONST_STRING_KEYS + listOf(
    "AARKI_PLACEMENT_ID",
    "ADMOB_ID",
    "IGA_KEY",
    "applovin.sdk.key",
)

internal val TELEMETRY_ACTIVITIES = listOf(
    "com.aarki.AarkiOfferActivity",
    "com.apsalar.sdk.Activity",
    "com.chartboost.sdk.CBDialogActivity",
    "com.google.ads.AdActivity",
    "com.sponsorpay.sdk.android.publisher.ofw.OfferWallActivity",
    "com.tapjoy.TJAdUnitView",
    "com.tapjoy.TJCOffersWebView",
    "com.tapjoy.TapjoyDailyRewardAdWebView",
    "com.tapjoy.TapjoyFeaturedAppWebView",
    "com.tapjoy.TapjoyFullScreenAdWebView",
    "com.tapjoy.TapjoyVideoView",
    "com.tapjoy.mraid.view.ActionHandler",
    "com.tapjoy.mraid.view.Browser",
)

internal val TELEMETRY_ACTIVITY_METHODS = listOf(
    "getOfferWallPoints",
    "getAarkiPoints",
    "showSponsorPay",
    "showAarkiOffer",
    "showTapjoy",
    "showAdmob",
    "showApplovin",
    "showChartBoost",
    "hideAdmob",
    "initAdmob",
    "initInmobi",
    "setAdmobPos",
    "trackInit",
)

/**
 * Removed from onCreate / onResume rather than stubbed. Calling a stubbed
 * FelAdManager.initFullScreenAds still runs its <clinit>, which constructs a
 * ChartboostDelegate against the emptied Chartboost classes and never leaves splash.
 */
internal val BOOT_SDK_INVOKES = listOf(
    "Lcom/feelingtouch/unityandroid/OfferWallUtil;" to "initTapjoy",
    "Lnet/youmi/android/appoffers/YoumiOffersManager;" to "init",
    "Lcom/aarki/AarkiContact;" to "registerApp",
    "Lcom/feelingtouch/felad/FelAdManager;" to "initFullScreenAds",
    "Lcom/feelingtouch/unityandroid/net/NetUtils;" to "SubmitGameStart",
    "Lcom/sponsorpay/sdk/android/SponsorPay;" to "start",
    "Lcom/sponsorpay/sdk/android/advertiser/SponsorPayAdvertiser;" to "register",
)

private const val AARKI_CONTACT = "Lcom/aarki/AarkiContact;"
private const val SPONSOR_PAY = "Lcom/sponsorpay/sdk/android/SponsorPay;"
private const val SPONSOR_PAY_ADVERTISER = "Lcom/sponsorpay/sdk/android/advertiser/SponsorPayAdvertiser;"
internal const val APSALAR = "Lcom/apsalar/sdk/Apsalar;"
internal const val APSALAR_DEVICE_ID = "getDeviceId"

internal const val NET_UTILS = "Lcom/feelingtouch/unityandroid/net/NetUtils;"
internal const val ADS_TRANSPORT = "Lcom/feelingtouch/rpc/ads/AdsTransport;"
internal const val ADS_TRANSPORT_CONFIG = "Lcom/feelingtouch/rpc/config/AdsTransportConfig;"

/**
 * SubmitGameStart only starts NetUtils$2, which then hits AdsTransport.submitInstall
 * / submitActiveUser. C# also calls the upload methods through JNI.
 */
internal val NET_UTILS_ADS_METHODS = listOf(
    "SubmitGameStart",
    "uploadInstallRecord",
    "uploadActiveUserRecord",
    "submitClick",
)

internal val ADS_TRANSPORT_URLS = listOf(
    "http://ads.feelingtouch.com:8080/ads-server/",
    "http://amazonads.feelingtouch.com:8080/ads-server/",
)

internal fun stubTelemetryWrappers() {
    for (type in TELEMETRY_WRAPPERS) {
        stubWrapper(mutableClassDefBy(type))
    }
}

internal fun skipBootSdkInvokes() {
    val wanted = BOOT_SDK_INVOKES.toSet()
    val found = HashSet<Pair<String, String>>()
    for (method in listOf(ActivityOnCreateFingerprint.method, ActivityOnResumeFingerprint.method)) {
        val impl = method.implementation
            ?: throw PatchException("${method.definingClass} ${method.name} has no code")
        val indexes = ArrayList<Int>()
        impl.instructions.forEachIndexed { index, ins ->
            if (ins.opcode != Opcode.INVOKE_STATIC && ins.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEachIndexed
            val ref = (ins as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
            val key = ref.definingClass to ref.name
            if (key in wanted) {
                indexes.add(index)
                found.add(key)
            }
        }
        for (index in indexes.asReversed()) {
            method.removeInstruction(index)
        }
    }
    if (found != wanted) {
        throw PatchException("Boot SDK invokes: expected $wanted, found $found")
    }
}

internal fun stubActivityAdMethods() {
    val c = mutableClassDefBy(UNITY_ANDROID_ACTIVITY)
    for (name in TELEMETRY_ACTIVITY_METHODS) {
        val methods = c.methods.filter { it.name == name && it.implementation != null }
        if (methods.isEmpty()) {
            throw PatchException("$UNITY_ANDROID_ACTIVITY has no code for $name")
        }
        for (method in methods) stubReturn(method, UNITY_ANDROID_ACTIVITY)
    }
}

internal fun stubNetUtilsAds() {
    val c = mutableClassDefBy(NET_UTILS)
    for (name in NET_UTILS_ADS_METHODS) {
        val methods = c.methods.filter { it.name == name && it.implementation != null }
        if (methods.isEmpty()) {
            throw PatchException("$NET_UTILS has no code for $name")
        }
        for (method in methods) stubReturn(method, NET_UTILS)
    }
}

internal fun blankAdsTransportUrls() {
    val c = mutableClassDefBy(ADS_TRANSPORT_CONFIG)
    var remaining: Set<String> = ADS_TRANSPORT_URLS.toSet()
    for (method in c.methods) {
        if (method.implementation == null) continue
        remaining = blankConstStrings(method, remaining)
    }
    if (remaining.isNotEmpty()) {
        throw PatchException("$ADS_TRANSPORT_CONFIG const-string missing $remaining")
    }
}

internal fun stubAdsTransport() {
    val c = mutableClassDefBy(ADS_TRANSPORT)
    for (method in c.methods.toList()) {
        if (method.name == "<init>" || method.name == "<clinit>") continue
        if (method.implementation == null) continue
        stubReturn(method, c.type)
    }
}

internal fun emptyTelemetrySdks() {
    emptySdkPrefixes(TELEMETRY_SDK_PREFIXES)
    stubEmptiedEntryPoints()
}

private fun stubWrapper(c: MutableClass) {
    for (method in c.methods.toList()) {
        if (method.name == "<init>") continue
        if (method.implementation == null) continue
        stubReturn(method, c.type)
    }
}

private fun stubReturn(method: MutableMethod, type: String) {
    when (val kind = method.returnType.first()) {
        'V' -> method.returnEarly()
        'Z' -> method.returnEarly(false)
        'I' -> method.returnEarly(0)
        'J' -> method.returnEarly(0L)
        'L', '[' -> method.returnEarly(null)
        else -> throw PatchException("$type ${method.name} returns ${method.returnType} ($kind)")
    }
}

/**
 * `onCreate` / `onResume` still name these methods after the wrappers return. Put no-op
 * stubs back so the invokes resolve.
 */
private fun stubEmptiedEntryPoints() {
    mutableClassDefBy(AARKI_CONTACT).addStub(
        name = "registerApp",
        parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
        access = PUBLIC or STATIC,
        registerCount = 3,
        smali = "return-void",
    )
    mutableClassDefBy(SPONSOR_PAY).addStub(
        name = "start",
        parameters = listOf(
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/app/Activity;",
        ),
        returnType = "Ljava/lang/String;",
        access = PUBLIC or STATIC,
        registerCount = 4,
        smali = """
            const-string v0, ""
            return-object v0
        """,
    )
    mutableClassDefBy(SPONSOR_PAY_ADVERTISER).addStub(
        name = "register",
        parameters = listOf("Landroid/content/Context;"),
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = "return-void",
    )
    // C# calls this through JNI on boot. The emptied class has no methods, so Unity
    // throws NoSuchMethodError and never leaves the splash. Stock returns "None"
    // when no session exists.
    mutableClassDefBy(APSALAR).addStub(
        name = APSALAR_DEVICE_ID,
        returnType = "Ljava/lang/String;",
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = """
            const-string v0, "None"
            return-object v0
        """,
    )
}
