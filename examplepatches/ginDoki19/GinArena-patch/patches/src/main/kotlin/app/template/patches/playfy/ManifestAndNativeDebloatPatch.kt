package app.template.patches.playfy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

// ============================================================================
// User-facing options — same option keys as the sibling TV apps in this
// bundle so users switching between them get consistent settings.
// ============================================================================

internal val removePushNotificationsOption = booleanOption(
    key = "removePushNotifications",
    default = true,
    title = "Remove push notifications",
    description = "Disables FCM push notifications and the notification permission prompt.",
)

internal val bypassUpdateGateOption = booleanOption(
    key = "bypassUpdateGate",
    default = true,
    title = "Bypass update & force-update screen",
    description = "Skips forced update screens. With this on the app never updates itself — re-patch a newer stock version to update.",
)

internal val bypassEnvironmentChecksOption = booleanOption(
    key = "bypassEnvironmentChecks",
    default = false,
    title = "Bypass sniffer-app check",
    description = "Bypasses the sniffer-app lockout. Only turn this on if the app refuses to run on your device.",
)

internal val stripNativeAndTelemetryBloatOption = booleanOption(
    key = "stripNativeAndTelemetryBloat",
    default = false,
    title = "Strip native & telemetry bloat",
    description = "Deletes unused libraries and tracking components to save space. Not needed for ad removal.",
)

// ============================================================================
// Internal resource patch paired with `removeAdsTelemetryAndRestrictionsPatch`:
// 1. Strips ad/push permissions, the Unity Ads auto-initializer, and (per
//    option) push services/receivers and telemetry components from
//    `AndroidManifest.xml`, while preserving RemoteConfig, Installations,
//    Abt, FirebaseCommonKtx, FirebaseInitProvider, DrakeNet's initializer,
//    versionCode=8, minSdk=21, and targetSdk=36.
// 2. With `stripNativeAndTelemetryBloat`, deletes `libumairi-lib.so` and
//    `libnative-lib.so` across all ABIs (the bytecode patch ports both
//    decoders to pure Java and stubs `NintyMin.<clinit>`), plus the Unity
//    Ads activities. Media3's `libffmpegJNI.so` / `libgav1JNI.so` stay.
// ============================================================================

internal val manifestAndNativeDebloatPatch = resourcePatch {
    execute {
        val removePush = removePushNotificationsOption.value == true
        val bypassEnv = bypassEnvironmentChecksOption.value == true
        val bypassUpdate = bypassUpdateGateOption.value == true
        val stripBloat = stripNativeAndTelemetryBloatOption.value == true

        document("AndroidManifest.xml").use { manifest ->
            val removablePermissions = buildSet {
                // Ad-identification permissions serve no purpose once every
                // ad entry point is disabled in bytecode.
                add("com.google.android.gms.permission.AD_ID")
                add("android.permission.ACCESS_ADSERVICES_ATTRIBUTION")
                add("android.permission.ACCESS_ADSERVICES_AD_ID")
                add("android.permission.ACCESS_ADSERVICES_TOPICS")
                // The blocked-apps uninstall prompt is bypassed in bytecode,
                // so its permission is never needed.
                add("android.permission.REQUEST_DELETE_PACKAGES")
                if (bypassUpdate) {
                    add("android.permission.REQUEST_INSTALL_PACKAGES")
                }
                if (bypassEnv) {
                    // Only the sniffer/blocked-apps scans enumerate packages.
                    add("android.permission.QUERY_ALL_PACKAGES")
                }
                if (removePush) {
                    add("android.permission.POST_NOTIFICATIONS")
                    add("com.google.android.c2dm.permission.RECEIVE")
                }
                if (stripBloat) {
                    add("com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
                }
            }

            // `SponsorActivity` and `FullBannerActivity` deliberately stay
            // declared: their launch gates are disabled in bytecode, and
            // removing the activities could crash any deep link or menu
            // entry that still references them.
            val removableComponents = buildSet {
                if (removePush) {
                    add("com.playfy.tv.helpers.PushService")
                    add("com.google.firebase.iid.FirebaseInstanceIdReceiver")
                    add("com.google.firebase.messaging.FirebaseMessagingService")
                }
                if (stripBloat) {
                    add("com.google.android.gms.measurement.AppMeasurementReceiver")
                    add("com.google.android.gms.measurement.AppMeasurementService")
                    add("com.google.android.gms.measurement.AppMeasurementJobService")
                    add("com.google.android.datatransport.runtime.backends.TransportBackendDiscovery")
                    add("com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService")
                    add("com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver")
                    add("androidx.profileinstaller.ProfileInstallReceiver")
                    // Unity Ads screens — unreachable once initialization and
                    // every `UnityAds.show` call are disabled.
                    add("com.unity3d.services.ads.adunit.AdUnitActivity")
                    add("com.unity3d.services.ads.adunit.AdUnitSoftwareActivity")
                    add("com.unity3d.services.ads.adunit.AdUnitTransparentActivity")
                    add("com.unity3d.services.ads.adunit.AdUnitTransparentSoftwareActivity")
                    add("com.unity3d.ads.adplayer.FullScreenWebViewDisplay")
                }
            }

            // Note: AbtRegistrar is intentionally kept because
            // RemoteConfigRegistrar declares a mandatory DI dependency on
            // AbtComponent, whereas AnalyticsConnector is optional.
            val removableMetaData = buildSet {
                // Unity Ads would otherwise auto-initialize at app start via
                // androidx.startup even with all SDK calls disabled.
                add("com.unity3d.services.core.configuration.AdsSdkInitializer")
                if (removePush) {
                    add("com.google.firebase.components:com.google.firebase.messaging.ktx.FirebaseMessagingLegacyRegistrar")
                    add("com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingKtxRegistrar")
                    add("com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingRegistrar")
                }
                if (stripBloat) {
                    add("com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar")
                    add("com.google.firebase.components:com.google.firebase.analytics.ktx.FirebaseAnalyticsLegacyRegistrar")
                    add("com.google.firebase.components:com.google.firebase.datatransport.TransportRegistrar")
                    add("backend:com.google.android.datatransport.cct.CctBackendFactory")
                    add("androidx.profileinstaller.ProfileInstallerInitializer")
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

        // Delete the two decoder libraries across all ABIs. Safe because
        // the bytecode patch replaces both `NintyMin` native entry points
        // with pure-Java ports and stubs the `loadLibrary` calls.
        if (stripBloat) {
            val removableNativeLibs = listOf(
                "/libumairi-lib.so",
                "/libnative-lib.so",
            )
            for (entry in listApkEntries("lib/")) {
                if (removableNativeLibs.any(entry::endsWith)) {
                    delete(entry)
                }
            }
        }
    }
}

// ============================================================================
// DOM helpers — copied verbatim from the SK Tech / CricZ family
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
