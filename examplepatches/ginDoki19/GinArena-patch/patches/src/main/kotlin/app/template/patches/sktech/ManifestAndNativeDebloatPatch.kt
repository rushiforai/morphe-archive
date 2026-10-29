package app.template.patches.sktech

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

// ============================================================================
// User-facing options — same option keys as the CricZ family so users
// switching between CricZ/PlayZ/SK Tech get consistent UX.
// ============================================================================

internal val removePushNotificationsOption = booleanOption(
    key = "removePushNotifications",
    default = true,
    title = "Remove push notifications",
    description = "Disables PushService and Firebase Cloud Messaging, skips Android 13+ notification " +
        "permission prompts, and removes notification permissions and receivers.",
)

internal val bypassUpdateGateOption = booleanOption(
    key = "bypassUpdateGate",
    default = true,
    title = "Bypass update & force-update screen",
    description = "Skips forced and optional update lockouts on Splash startup and Player exit, and " +
        "removes the REQUEST_INSTALL_PACKAGES permission used by the in-app self-updater.",
)

internal val bypassEnvironmentChecksOption = booleanOption(
    key = "bypassEnvironmentChecks",
    default = false,
    title = "Bypass root & sniffer checks",
    description = "Neutralizes RootBeer/su root lockouts, Frida/sniffer package checks, and " +
        "proxy-certificate lockouts. Not needed on ordinary phones/TVs; MainActivity startup " +
        "tamper crash-bombs are always neutralized separately.",
)

internal val stripNativeAndTelemetryBloatOption = booleanOption(
    key = "stripNativeAndTelemetryBloat",
    default = false,
    title = "Strip native & telemetry bloat",
    description = "Removes libnative-lib.so across all ABIs (plus libtoolChecker.so when the root " +
        "bypass is enabled) plus Firebase Analytics, Crashlytics, Sessions, DataTransport, and " +
        "AdServices manifest entries. Purely a size saving; the libraries are never loaded once " +
        "their Java entry points are removed.",
)

internal val disableWebActivityOption = booleanOption(
    key = "disableWebActivity",
    default = false,
    title = "Disable WebActivity (potential ad surface)",
    description = "Stubs WebActivity.onCreate to immediately finish() the activity. SK Tech TV's " +
        "WebActivity is a generic in-app WebView that could be repurposed for ad landing pages " +
        "via remote app.txt config; disabling it ensures no remote-config-driven WebView ad can " +
        "ever render. Off by default: WebActivity also opens legitimate in-app links, and the " +
        "config sanitizer already blanks the ad sponsor URLs.",
)


// ============================================================================
// Internal resource patch paired with `removeAdsTelemetryAndRestrictionsPatch`:
// 1. Strips ad/telemetry/push permissions, services, receivers, and registrars
//    from `AndroidManifest.xml` while preserving RemoteConfig, Installations,
//    Abt, FirebaseCommonKtx, FirebaseInitProvider, versionCode=17, minSdk=23,
//    and targetSdk=36.
// 2. Deletes `libnative-lib.so` across all ABIs (and `libtoolChecker.so` only
//    when the root bypass is enabled, since `RootBeerNative.<clinit>` loads it),
//    leaving Media3's `libffmpegJNI.so` and `libdav1dJNI.so` untouched.
// 3. Unlike CricZ, SK Tech TV does NOT use a NanoHTTPD banner ad server —
//    so there is no port-1120 server to disable. AdMob SDK is bundled but
//    never invoked from app code (verified via grep — see audit findings).
// ============================================================================

internal val manifestAndNativeDebloatPatch = resourcePatch {
    execute {
        val removePush = removePushNotificationsOption.value == true
        val bypassEnv = bypassEnvironmentChecksOption.value == true
        val bypassUpdate = bypassUpdateGateOption.value == true
        val stripBloat = stripNativeAndTelemetryBloatOption.value == true

        // ----------------------------------------------------------------------
        // 1. Clean AndroidManifest.xml while strictly preserving RemoteConfig +
        //    Installations + SDK/version metadata.
        // ----------------------------------------------------------------------
        document("AndroidManifest.xml").use { manifest ->
            val removablePermissions = buildSet {
                // Always strip ad-permissions — AdMob SDK is bundled but never
                // invoked, so stripping its permissions is safe and saves
                // Android 13+ Privacy Sandbox attribution noise.
                add("com.google.android.gms.permission.AD_ID")
                add("android.permission.ACCESS_ADSERVICES_ATTRIBUTION")
                add("android.permission.ACCESS_ADSERVICES_AD_ID")
                add("android.permission.ACCESS_ADSERVICES_TOPICS")
                if (bypassUpdate) {
                    add("android.permission.REQUEST_INSTALL_PACKAGES")
                }
                if (removePush) {
                    add("android.permission.POST_NOTIFICATIONS")
                    add("com.google.android.c2dm.permission.RECEIVE")
                }
                if (stripBloat) {
                    add("com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
                }
            }

            // `SupportActivity` deliberately stays declared: the 10-second sponsor
            // gate is bypassed in bytecode (CricZ-style kc.k.T goto), and removing
            // the activity could crash any other menu or deeplink entry that still
            // starts it.
            // `WebActivity` is also deliberately kept declared — its onCreate is
            // stubbed to finish() in the bytecode patch (see disableWebActivity).
            val removableComponents = buildSet {
                if (removePush) {
                    add("com.live.sktechtv.firebase.PushService")
                    add("com.google.firebase.iid.FirebaseInstanceIdReceiver")
                    add("com.google.firebase.messaging.FirebaseMessagingService")
                }
                if (stripBloat) {
                    add("com.google.android.gms.measurement.AppMeasurementReceiver")
                    add("com.google.android.gms.measurement.AppMeasurementService")
                    add("com.google.android.gms.measurement.AppMeasurementJobService")
                    add("com.google.firebase.sessions.SessionLifecycleService")
                    add("com.google.android.datatransport.runtime.backends.TransportBackendDiscovery")
                    add("com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService")
                    add("com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver")
                    add("androidx.profileinstaller.ProfileInstallReceiver")
                }
            }

            // Note: AbtRegistrar is intentionally kept because RemoteConfigRegistrar
            // declares a mandatory DI dependency on AbtComponent, whereas
            // AnalyticsConnector is optional.
            val removableMetaData = buildSet {
                if (removePush) {
                    add("com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingKtxRegistrar")
                    add("com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingRegistrar")
                }
                if (stripBloat) {
                    add("com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar")
                    add("com.google.firebase.components:com.google.firebase.crashlytics.FirebaseCrashlyticsKtxRegistrar")
                    add("com.google.firebase.components:com.google.firebase.crashlytics.CrashlyticsRegistrar")
                    add("com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar")
                    add("com.google.firebase.components:com.google.firebase.datatransport.TransportRegistrar")
                }
            }

            manifest.removeByAndroidName("uses-permission", removablePermissions)
            manifest.removeByAndroidName("activity", removableComponents)
            manifest.removeByAndroidName("service", removableComponents)
            manifest.removeByAndroidName("receiver", removableComponents)
            manifest.removeByAndroidName("meta-data", removableMetaData)
            if (stripBloat) {
                manifest.removeByAndroidName("uses-library", setOf("android.ext.adservices"))
            }
        }

        // ----------------------------------------------------------------------
        // 2. Delete unneeded native `.so` binaries across all ABIs
        //    (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`), keeping only
        //    Media3's `libffmpegJNI.so` and `libdav1dJNI.so`.
        //    `libnative-lib.so` is safe to strip — the bytecode patch replaces
        //    its sole Java entry point (DataHelper.AppData) with a pure-Java
        //    port, and DataHelper.<clinit>'s loadLibrary("native-lib") is
        //    replaced with return-void.
        // ----------------------------------------------------------------------
        if (stripBloat) {
            val removableNativeLibs = buildList {
                add("/libnative-lib.so")
                if (bypassEnv) add("/libtoolChecker.so")
            }
            for (entry in listApkEntries("lib/")) {
                if (removableNativeLibs.any(entry::endsWith)) {
                    delete(entry)
                }
            }
        }
    }
}

// ============================================================================
// DOM helpers — copied verbatim from the CricZ family
// ============================================================================

private fun Element.androidName(): String =
    getAttributeNS(ANDROID_NS, "name").ifEmpty { getAttribute("android:name") }

private fun Element.androidId(): String =
    getAttributeNS(ANDROID_NS, "id").ifEmpty { getAttribute("android:id") }

private fun Element.setAndroidAttr(localName: String, value: String) {
    if (hasAttributeNS(ANDROID_NS, localName)) {
        setAttributeNS(ANDROID_NS, "android:$localName", value)
    } else {
        setAttribute("android:$localName", value)
    }
}

private fun Document.removeByAndroidName(tagName: String, targets: Set<String>) {
    if (targets.isEmpty()) return
    val nodes = getElementsByTagName(tagName)
    val toRemove = ArrayList<Element>()
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as? Element ?: continue
        if (el.androidName() in targets) {
            toRemove.add(el)
        }
    }
    for (el in toRemove) {
        el.parentNode?.removeChild(el)
    }
}
