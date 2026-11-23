package patches.upflix

import app.morphe.patcher.patch.resourcePatch
import patches.shared.originalInput
import patches.upflix.shared.COMPATIBILITY_UPFLIX
import org.w3c.dom.Element
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

private const val ANDROID = "http://schemas.android.com/apk/res/android"

// ---------------------------------------------------------------------------
// Titanium asset cipher (com.douglas.upflix.AssetCryptImpl + libti.cloak.so).
// AES/CBC/PKCS5Padding, 16-byte IV ("salt"), key assembled by the native
// Binding.getKey() from KEY_BLOCK XOR salt. Recovery is documented in
// .analysis/upflix-5.12.10-ads-tracking/README.md §2.3.
// ---------------------------------------------------------------------------
private val UPFLIX_IV = byteArrayOf(
    121, 79, -106, -1, -86, -7, 119, 120, -101, -64, -87, 113, -20, -127, -68, -60,
)
private val UPFLIX_KEY = "8d87b67cafecb1b161444d2207430e17".hexToBytes()

private fun String.hexToBytes(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun assetCipher(mode: Int): Cipher =
    Cipher.getInstance("AES/CBC/PKCS5Padding").apply {
        init(mode, SecretKeySpec(UPFLIX_KEY, "AES"), IvParameterSpec(UPFLIX_IV))
    }

internal fun decryptBundle(bytes: ByteArray): ByteArray = assetCipher(Cipher.DECRYPT_MODE).doFinal(bytes)
internal fun encryptBundle(bytes: ByteArray): ByteArray = assetCipher(Cipher.ENCRYPT_MODE).doFinal(bytes)

// ---------------------------------------------------------------------------
// Small string surgery helpers. Every anchor is asserted unique so a changed
// upstream bundle fails the patch instead of shipping half-patched JS.
// ---------------------------------------------------------------------------
private fun String.anchor(anchor: String): Int {
    val index = indexOf(anchor)
    check(index >= 0) { "Upflix bundle changed: missing anchor ${anchor.take(70)}" }
    check(lastIndexOf(anchor) == index) { "Upflix bundle changed: ambiguous anchor ${anchor.take(70)}" }
    return index
}

private fun String.replaceAnchor(anchor: String, replacement: String): String {
    anchor(anchor)
    return replace(anchor, replacement)
}

private fun String.replacePattern(pattern: String, replacement: String): String {
    val regex = Regex(pattern)
    val matches = regex.findAll(this).count()
    check(matches == 1) { "Upflix bundle changed: expected 1 match for ${pattern.take(70)}, got $matches" }
    return regex.replace(this, Regex.escapeReplacement(replacement))
}

/** Index just past the bracket that closes the one at [openIndex], skipping string literals. */
private fun String.closeOf(openIndex: Int, open: Char, close: Char): Int {
    var depth = 0
    var index = openIndex
    while (index < length) {
        when (val c = this[index]) {
            '\'', '"', '`' -> {
                index++
                while (index < length) {
                    if (this[index] == '\\') {
                        index += 2
                        continue
                    }
                    if (this[index] == c) break
                    index++
                }
            }
            open -> depth++
            close -> {
                depth--
                if (depth == 0) return index + 1
            }
        }
        index++
    }
    error("Upflix bundle changed: unbalanced '$open' at $openIndex")
}

/** Replace a whole `function name(...) { ... }` whose header is [header] (ending in '{'). */
private fun String.replaceFunction(
    header: String,
    replacement: String,
    stripLeadingNewline: Boolean = false,
): String {
    val headerStart = anchor(header)
    var start = headerStart
    if (stripLeadingNewline && start > 0 && this[start - 1] == '\n') start--
    val end = closeOf(headerStart + header.length - 1, '{', '}')
    return take(start) + replacement + substring(end)
}

/** Replace `marker(...)` — the bracket is between the marker and its arguments. */
private fun String.replaceCall(marker: String, replacement: String, openOffset: Int = -1): String {
    val start = anchor(marker)
    val open = if (openOffset >= 0) {
        start + openOffset
    } else {
        indexOf('(', start + marker.length - 1)
    }
    check(open >= 0 && this[open] == '(') { "Upflix bundle changed: no call brackets for ${marker.take(50)}" }
    check(open >= 0) { "Upflix bundle changed: no call brackets for ${marker.take(50)}" }
    val end = closeOf(open, '(', ')')
    return take(start) + replacement + substring(end)
}

/** Remove a whole `marker(...)` call and its optional trailing semicolon. */
private fun String.removeCall(marker: String, openOffset: Int = -1): String {
    val start = anchor(marker)
    val open = if (openOffset >= 0) start + openOffset else indexOf('(', start + marker.length - 1)
    var end = closeOf(open, '(', ')')
    if (getOrNull(end) == ';') end++
    return take(start) + substring(end)
}

/** Remove `,name={ ... }` (or `name={...}`) from a declaration list. */
private fun String.removeAssignment(marker: String): String {
    val start = anchor(marker)
    val brace = indexOf('{', start + marker.length - 1)
    check(brace >= 0) { "Upflix bundle changed: no object for $marker" }
    val end = closeOf(brace, '{', '}')
    val cutFrom = if (start > 0 && this[start - 1] == ',') start - 1 else start
    return take(cutFrom) + substring(end)
}

/** Remove `,{ ...marker... }` (an array element starting with [objectMarker]). */
private fun String.removeArrayObject(objectMarker: String): String {
    val start = anchor(objectMarker)
    val end = closeOf(start, '{', '}')
    val cutFrom = if (start > 0 && this[start - 1] == ',') start - 1 else start
    return take(cutFrom) + substring(end)
}

// ---------------------------------------------------------------------------
// Replacement fragments
// ---------------------------------------------------------------------------
private const val ANALYTICS_STUB =
    "global.FirebaseAnalytics={log:function(){}," +
        "setScreenNameAndScreenClass:function(){}," +
        "saveUserProperty:function(){}," +
        "setAnalyticsCollectionEnabled:function(){}," +
        "resetAnalyticsData:function(){}}"

private const val INSTALL_ID =
    "global.installId=function(){var i=Titanium.App.Properties.getString(\"install_id\");" +
        "return i||(i=Titanium.Platform.createUUID()," +
        "Titanium.App.Properties.setString(\"install_id\",i),i)},"

private const val AD_OBJECT_STUB =
    "{addEventListener:function(){},removeEventListener:function(){},load:function(){},show:function(){},loaded:!1}"

internal const val PAYWALL_STUB =
    "// Paywall removed by the ad/tracking patch.\n" +
        "function RemoveAdsWindow(){}\n" +
        "RemoveAdsWindow.prototype.open=function(){};\n" +
        "RemoveAdsWindow.prototype.addEventListener=function(){};\n" +
        "RemoveAdsWindow.prototype.hideLoading=function(){};\n" +
        "module.exports=RemoveAdsWindow;\n"

internal const val FS_STUB =
    "{getDocument:function(o){o&&o.callback&&o.callback({success:!1,exists:!1})}," +
        "addDocumentWithId:function(o){o&&o.callback&&o.callback({success:!1})}," +
        "setDocument:function(o){o&&o.callback&&o.callback({success:!1})}}"

internal const val FCM_STUB =
    "{fcmToken:null,token:null,lastData:null,addEventListener:function(){},removeEventListener:function(){},getToken:function(){},deleteToken:function(){},subscribeToTopic:function(){},unsubscribeFromTopic:function(){},clearLastData:function(){},setNotificationChannel:function(){},checkPlayServices:function(){return !0},areNotificationsEnabled:function(){return !0},isIgnoringBatteryOptimizations:function(){return !0},openNotificationSettings:function(){},requestIgnoreBatteryOptimizations:function(){},showPlayServicesErrorDialog:function(){},registerForPushNotifications:function(){}}"

internal const val ADS_CONSENT_STUB =
    "// Ads consent (UMP) step removed by the ad/tracking patch.\n" +
        "function AdsConsent(){\n" +
        "  var v = Titanium.UI.createView({});\n" +
        "  v.presentation = function(){};\n" +
        "  v.next = function(){};\n" +
        "  v.back = function(){};\n" +
        "  v.purchaseRemoveAds = function(){};\n" +
        "  v.requestAd = function(p){ p && p.finished && p.finished({error:!0}); };\n" +
        "  v.removeAdmobListeners = function(){};\n" +
        "  return v;\n" +
        "}\n" +
        "module.exports = AdsConsent;\n"

// ---------------------------------------------------------------------------
// Per-module transforms
// ---------------------------------------------------------------------------
internal fun patchAppJs(text: String): String {
    var out = text.replaceAnchor(
        "global.FirebaseAnalytics=require(\"firebase.analytics\")",
        ANALYTICS_STUB,
    )
    out = out.replaceAnchor(
        "global.standardApiResquestAddress=\"https://api2.upflix.net\",",
        "global.standardApiResquestAddress=\"https://api2.upflix.net\"," + INSTALL_ID,
    )
    // First-party reporting: Firestore profile/duo documents, FCM token/topics.
    out = out.replaceFunction(
        "global.updateFirestoreDocument=function(){",
        "global.updateFirestoreDocument=function(){}",
    )
    out = out.replaceFunction(
        "global.setFirestoreDocumentForDuo=function(data,success,error){",
        "global.setFirestoreDocumentForDuo=function(data,success,error){}",
    )
    out = out.replaceFunction(
        "global.updateFirestoreDocumentForDuo=function(document,success,error){",
        "global.updateFirestoreDocumentForDuo=function(document,success,error){}",
    )
    out = out.replaceAnchor("require(\"firebase.core\")", "{configure:function(){}}")
    out = out.replaceAnchor("require(\"titanium.firestore\")", FS_STUB)
    out = out.replaceAnchor("require(\"firebase.cloudmessaging\")", FCM_STUB)
    return out
}

internal fun patchNetworkJs(text: String): String {
    var out = text
        .replaceAnchor("hashuuid:Titanium.Platform.id", "hashuuid:global.installId()")
        .replaceFunction(
            "exports.getUserIp=function(callback){",
            "exports.getUserIp=function(callback){callback&&callback({error:!0})}",
            stripLeadingNewline = true,
        )
        .replaceFunction(
            "exports.geoIp=function(ip,callback){",
            "exports.geoIp=function(callback){callback&&callback({error:!0})}",
            stripLeadingNewline = true,
        )
        .replaceFunction(
            "exports.geoUserLocation=function(callback){",
            "exports.geoUserLocation=function(callback){callback&&callback({error:!0})}",
            stripLeadingNewline = true,
        )
        .replaceFunction(
            "exports.testIfUsa=(callback)=>{",
            "exports.testIfUsa=(callback)=>{callback&&callback({error:!0,is_us_form:!1})}",
            stripLeadingNewline = true,
        )
        .replaceFunction(
            "function ipinfo(callback){",
            "function ipinfo(callback){callback&&callback({success:!1,error:!0,data:null})}",
            stripLeadingNewline = true,
        )
        .replaceFunction(
            "exports.RegisterPush=function(locals){",
            "exports.RegisterPush=function(locals){}",
        )
    return out
}

internal fun patchLoadingWindow(text: String): String {
    var out = text.replaceAnchor(
        "window.addEventListener(\"open\",function(){!0==Titanium.App.Properties.getBool(\"jaComprou\")" +
            "?setTimeout(()=>{OpenApplicationWindow()},1e3):(Admob.requestConsentForm(DEBUG_GEOGRAPHY)," +
            "Admob.setAppVolume(\"30%\"))});",
        "window.addEventListener(\"open\",function(){setTimeout(function(){OpenApplicationWindow()},1e3)});",
    )
    out = out.replaceFunction(
        "function resetConsentAndShowPaywallAlert(){",
        "function resetConsentAndShowPaywallAlert(){}",
    )
    return out.replaceFunction(
        "function handleInterstitalAds(text){",
        "function handleInterstitalAds(){OpenApplicationWindow()}",
    )
}

internal fun patchOnboardingWindow(text: String): String {
    var out = text.replaceAnchor(
        "var adsConsent=new AdsConsent;adsConsent.next=next,adsConsent.back=back," +
            "adsConsent.purchaseRemoveAds=function(){new RemoveAdsWindow().open({modal:!0})}," +
            "adsConsent.requestAd=function(params){createInterstitalAd(params.started,params.finished)};",
        "",
    )
    out = out.replacePattern(
        "adsConsent\\.top=new_top,\\s*adsConsent\\.bottom=new_bottom,\\s*",
        "",
    )
    out = out.replacePattern("adsConsent\\.removeAdmobListeners\\(\\),\\s*", "")
    out = out.replaceAnchor(
        "streamingServicesView,adsConsent,independentView",
        "streamingServicesView,independentView",
    )
    // Removing pages shrank this scrollable; +2 can run past the last index and make
    // the premium Confirm path a no-op. Clamp the jump.
    out = out.replaceAnchor(
        "let jumpOneView=function(){scrollableView.scrollToView(scrollableView.currentPage+2)}",
        "let jumpOneView=function(){scrollableView.scrollToView(" +
            "Math.min(scrollableView.currentPage+2,scrollableView.views.length-1))}",
    )
    out = out.replaceAnchor(
        "PushNotificationView=require(\"/ui/onboarding/PushNotificationView\"),",
        "",
    )
    out = out.replaceAnchor(
        "var pushNotificationView=new PushNotificationView;" +
            "pushNotificationView.next=next,pushNotificationView.back=back;",
        "",
    )
    out = out.replacePattern(
        "pushNotificationView\\.top=new_top,\\s*pushNotificationView\\.bottom=new_bottom,\\s*",
        "",
    )
    out = out.replaceAnchor("pushNotificationView,", "")
    return out.replaceFunction(
        "function createInterstitalAd(started,finished){",
        "function createInterstitalAd(started,finished){started&&started();" +
            "finished&&finished({error:!1});openApplicationWindow()}",
    )
}

internal fun patchApplicationWindow(text: String): String {
    var out = text.replaceCall("appOpenAd=Admob.createAppOpenAd(", "appOpenAd=$AD_OBJECT_STUB")
    out = out.replaceAnchor("setTimeout(function(){LoadAppOpen()},1e4),", "")
    // FCM token refresh interval.
    out = out.removeCall(
        "setInterval(function(){var currentToken=FirebaseCloudMessaging.fcmToken",
        "setInterval".length,
    )
    // Notification permission prompt / push registration.
    out = out.replaceAnchor("requestPushPermissions(),", "")
    return out.replaceFunction(
        "function requestPushPermissions(){",
        "function requestPushPermissions(){}",
    )
}

internal fun patchFeaturedWindow(text: String): String =
    text.replaceFunction(
        "function createRemoveAdsView(){",
        "function createRemoveAdsView(){return Titanium.UI.createView({visible:!1,height:0})}",
    )

internal fun patchChangeStreaming(text: String): String =
    text.replaceAnchor(
        "premium_button=Titanium.UI.createView({",
        "premium_button=Titanium.UI.createView({visible:!1,",
    )

internal fun patchMasterWindow(text: String): String {
    var out = text.replaceAnchor(
        "templates:{standard:standard_template,banner:banner_template,ads:ads_template," +
            "new_layout:new_layout_template}",
        "templates:{standard:standard_template,banner:banner_template," +
            "new_layout:new_layout_template}",
    )
    out = out.replaceAnchor(
        "(flushPendingItems(),section.appendItems({properties:{template:\"ads\"," +
            "type:\"remove_ads\"},template:\"ads\"}))",
        "!1",
    )
    return out.removeAssignment(",ads_template=")
}

internal fun patchExpiringTitles(text: String): String =
    text.removeArrayObject("{type:\"Admob.AdaptiveBanner\"")

internal fun patchRouletteWindow(text: String): String {
    val anchor = "window.addEventListener(\"loadAdmobBanner\""
    val start = text.anchor(anchor)
    val open = start + "window.addEventListener".length
    check(text[open] == '(') { "Upflix bundle changed: loadAdmobBanner call shape" }
    val end = text.closeOf(open, '(', ')')
    var stop = end
    if (text.getOrNull(stop) == ';') stop++
    return text.take(start) + "void 0" + text.substring(stop)
}

internal fun patchTitleDetails(text: String): String {
    var out = text.replaceAnchor(
        ",!Titanium.App.Properties.getBool(\"jaComprou\")){",
        ",!1){",
    )
    out = out.replaceCall("Admob.createAdaptiveBanner(", "null")
    val listenerOpen = "adMobView.addEventListener".length
    out = out.replaceCall("adMobView.addEventListener(Admob.AD_LOADED", "void 0", listenerOpen)
    return out.replaceCall("adMobView.addEventListener(Admob.AD_FAILED_TO_LOAD", "void 0", listenerOpen)
}

internal fun patchMenuWindow(text: String): String {
    var out = text.replaceAnchor(
        "let canShowPremiumBadge=!Titanium.App.Properties.getBool(\"jaComprou\")&&" +
            "Titanium.App.Properties.getBool(\"isNewUserAfterCreatingThePaywall\");",
        "let canShowPremiumBadge=!1;",
    )
    out = out.replaceAnchor(
        "const header_view_wrapper=Titanium.UI.createView({top:16,",
        "const header_view_wrapper=Titanium.UI.createView({visible:!1,top:16,",
    )
    out = out.replaceFunction("function resetConsentCallback(){", "function resetConsentCallback(){}")
    out = out.replacePattern(
        "1==a\\.index&&\\(\\s*activityIndicator\\.show\\(\\),\\s*Admob\\.resetConsentForm\\(\\),\\s*" +
            "Admob\\.requestConsentForm\\(DEBUG_GEOGRAPHY\\)\\s*\\)",
        "1==a.index&&activityIndicator.show()",
    )
    return out.replaceCall(
        "Admob.isPrivacyOptionsRequired()&&Admob.presentPrivacyOptionsForm",
        "void 0",
    )
}

internal val MODULE_PATCHES: Map<String, (String) -> String> = mapOf(
    "Resources/app.js" to ::patchAppJs,
    "Resources/services/network.js" to ::patchNetworkJs,
    "Resources/ui/common/LoadingWindow.js" to ::patchLoadingWindow,
    "Resources/ui/common/MasterWindow.js" to ::patchMasterWindow,
    "Resources/ui/common/FeaturedWindow.js" to ::patchFeaturedWindow,
    "Resources/ui/common/ChangeStreamingServicesOnNew.js" to ::patchChangeStreaming,
    "Resources/ui/common/ExpiringTitlesView.js" to ::patchExpiringTitles,
    "Resources/ui/common/RouletteWindow.js" to ::patchRouletteWindow,
    "Resources/ui/common/TitleDetailsWindow.js" to ::patchTitleDetails,
    "Resources/ui/common/MenuWindow.js" to ::patchMenuWindow,
    "Resources/ui/onboarding/OnboardingWindow.js" to ::patchOnboardingWindow,
    "Resources/ui/handheld/android/ApplicationWindow.js" to ::patchApplicationWindow,
)

/** Apply the module-specific edit (if any) followed by the global edit. */
internal fun patchModuleText(relative: String, text: String): String =
    patchGlobal(MODULE_PATCHES[relative]?.invoke(text) ?: text)

/** Applied to every module after its own edit: no device identifier, no test-device hook. */
internal fun patchGlobal(text: String): String =
    text
        .replace("Titanium.Platform.id", "global.installId()")
        .replace("Admob.setTestDeviceId(TEST_DEVICE_ID);", "")
        // Premium features are client-side gated only; open every gate.
        .replace("Titanium.App.Properties.getBool(\"jaComprou\")", "!0")
        .replace("Titanium.App.Properties.getBool(\"jaComprou\",!1)", "!0")

// ---------------------------------------------------------------------------
// Manifest
// ---------------------------------------------------------------------------
private val REMOVED_ACTIVITY_PREFIXES = listOf(
    "com.applovin.",
    "com.bytedance.sdk.openadsdk.",
    "com.mbridge.msdk.",
)
private val REMOVED_ACTIVITIES = setOf(
    "com.google.android.gms.ads.AdActivity",
    "com.google.android.libraries.ads.mobile.sdk.common.AdActivity",
    "com.inmobi.ads.rendering.InMobiAdActivity",
    "com.vungle.ads.internal.ui.VungleActivity",
)
private val REMOVED_SERVICES = setOf(
    "com.applovin.impl.adview.activity.FullscreenAdService",
    "com.google.firebase.messaging.FirebaseMessagingService",
    "com.google.firebase.components.ComponentDiscoveryService",
    "com.douglas.upflix.gcm.RegistrationIntentService",
    "firebase.cloudmessaging.TiFirebaseMessagingService",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)
private val REMOVED_RECEIVERS = setOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.firebase.iid.FirebaseInstanceIdReceiver",
    "firebase.cloudmessaging.BootReceiver",
    "firebase.cloudmessaging.NotificationActionReceiver",
    "com.mbridge.msdk.foundation.same.broadcast.NetWorkChangeReceiver",
)
private val REMOVED_PROVIDERS = setOf(
    "com.applovin.sdk.AppLovinInitProvider",
    "com.vungle.ads.VungleProvider",
    "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
    "com.facebook.internal.FacebookInitProvider",
    "com.facebook.FacebookContentProvider",
)
private val REMOVED_METADATA = setOf(
    "com.google.android.gms.ads.APPLICATION_ID",
    "com.google.android.gms.ads.flag.OPTIMIZE_INITIALIZATION",
    "com.google.android.gms.ads.flag.OPTIMIZE_AD_LOADING",
    "com.facebook.sdk.ApplicationId",
    "com.facebook.sdk.ClientToken",
    "com.bytedance.sdk.pangle.version",
    "com.google.firebase.components:com.google.firebase.iid.Registrar",
    "com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingRegistrar",
    "com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingKtxRegistrar",
    "com.google.firebase.components:com.google.firebase.firestore.FirestoreRegistrar",
    "com.google.firebase.components:com.google.firebase.firestore.FirebaseFirestoreKtxRegistrar",
    "com.google.firebase.components:com.google.firebase.installations.FirebaseInstallationsRegistrar",
    "com.google.firebase.components:com.google.firebase.installations.FirebaseInstallationsKtxRegistrar",
    "com.google.firebase.components:com.google.firebase.datatransport.TransportRegistrar",
    "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar",
    "com.google.firebase.components:com.google.firebase.crashlytics.CrashlyticsRegistrar",
    "com.google.firebase.components:com.google.firebase.crashlytics.FirebaseCrashlyticsKtxRegistrar",
    "com.google.firebase.components:com.google.firebase.abt.component.AbtRegistrar",
    "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar",
    "com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingRegistrar",
    "com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingKtxRegistrar",
    "com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayRegistrar",
    "com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayKtxRegistrar",
)
private val REMOVED_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.POST_NOTIFICATIONS",
)
private val DISABLED_METADATA = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
)

internal fun patchManifest(document: org.w3c.dom.Document) {
    fun elements(tag: String): List<Element> {
        val nodes = document.getElementsByTagName(tag)
        return (nodes.length - 1 downTo 0).map { nodes.item(it) as Element }
    }

    fun remove(tag: String, predicate: (String) -> Boolean) =
        elements(tag)
            .filter { predicate(it.getAttributeNS(ANDROID, "name")) }
            .forEach { it.parentNode.removeChild(it) }

    remove("activity") { name ->
        name in REMOVED_ACTIVITIES || REMOVED_ACTIVITY_PREFIXES.any(name::startsWith)
    }
    remove("service") { it in REMOVED_SERVICES }
    remove("receiver") { it in REMOVED_RECEIVERS }
    remove("provider") { it in REMOVED_PROVIDERS }
    remove("meta-data") { it in REMOVED_METADATA }
    remove("uses-permission") { it in REMOVED_PERMISSIONS }

    // apktool re-encodes android:resource="@null" as a null reference, which Android 14+
    // rejects; FCM falls back to the app icon without these entries.
    elements("meta-data")
        .filter { it.getAttributeNS(ANDROID, "resource") == "@null" }
        .forEach { it.parentNode.removeChild(it) }

    // Deleting a lone <action> leaves an empty <intent>, which Android rejects with
    // INSTALL_PARSE_FAILED_MANIFEST_MALFORMED. Drop any node we emptied.
    listOf("intent", "intent-filter", "queries").forEach { tag ->
        elements(tag)
            // only truly childless nodes: an <intent-filter> with <action>/<category>/
            // <data> children has blank textContent and must be kept (the LAUNCHER
            // filter would otherwise be deleted and the app would vanish from the launcher).
            .filter { element -> !element.hasChildNodes() }
            .forEach { it.parentNode.removeChild(it) }
    }

    val application = document.getElementsByTagName("application").item(0) as Element
    DISABLED_METADATA.forEach { (name, value) ->
        val matches = elements("meta-data").filter { it.getAttributeNS(ANDROID, "name") == name }
        check(matches.size <= 1) { "Duplicate manifest flag: $name" }
        val element = matches.singleOrNull() ?: document.createElement("meta-data").also {
            it.setAttributeNS(ANDROID, "android:name", name)
            application.appendChild(it)
        }
        element.setAttributeNS(ANDROID, "android:value", value)
    }
}

// ---------------------------------------------------------------------------
// Patch
// ---------------------------------------------------------------------------
@Suppress("unused")
val disableAdsAndTracking = resourcePatch(
    name = "Disable ads and tracking",
    description = "Removes all seven ad placements and the ad SDK bootstrap, the Google UMP consent " +
        "flow, Firebase Analytics/Crashlytics collection, the advertising ID, Facebook SDK auto-init " +
        "and third-party IP geolocation. The encrypted Titanium bundle is rewritten and re-encrypted " +
        "with the app's own key, and the stable device identifier becomes a random per-install UUID.",
) {
    compatibleWith(COMPATIBILITY_UPFLIX)
    // The tracking strip removes the Crashlytics component, and a re-signed build needs the
    // PairIP bypass; without these two the app would crash, so they are hard dependencies.
    dependsOn(originalInput(COMPATIBILITY_UPFLIX), disableCrashlyticsReporter, disableLicenseCheck)

    execute {
        document("AndroidManifest.xml").use { document -> patchManifest(document) }

        val modules = listApkEntries("assets/Resources/").filter { it.endsWith(".js.bin") }
        check(modules.size >= 60) { "Upflix bundle is missing: found ${modules.size} JS assets" }

        modules.forEach { entry ->
            val file = get(entry)
            val original = decryptBundle(file.readBytes()).toString(Charsets.UTF_8)
            val relative = entry.removePrefix("assets/").removeSuffix(".bin")

            if (relative == "Resources/ui/common/RemoveAdsWindow.js") {
                file.writeBytes(encryptBundle(PAYWALL_STUB.toByteArray(Charsets.UTF_8)))
                return@forEach
            }

            if (relative == "Resources/ui/onboarding/AdsConsent.js") {
                file.writeBytes(encryptBundle(ADS_CONSENT_STUB.toByteArray(Charsets.UTF_8)))
                return@forEach
            }

            val patched = patchModuleText(relative, original)
            if (patched != original) {
                file.writeBytes(encryptBundle(patched.toByteArray(Charsets.UTF_8)))
            }
        }
    }
}
