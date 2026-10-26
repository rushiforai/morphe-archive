package app.template.patches.cricz

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

internal val hidePromoMarqueeOption = booleanOption(
    key = "hidePromoMarquee",
    default = true,
    title = "Hide promo announcement bar",
    description = "Hides the scrolling promo announcement card on the Events and Player screens.",
)

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
    description = "Skips forced and optional update lockouts on Splash startup and Player exit.",
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

/**
 * Internal resource patch paired with [removeAdsTelemetryAndRestrictionsPatch]:
 * 1. Strips ad/telemetry/push permissions, services, receivers, and registrars from `AndroidManifest.xml`
 *    while preserving `RemoteConfigRegistrar`, `FirebaseInstallationsRegistrar`, `AbtRegistrar`,
 *    `FirebaseCommonKtxRegistrar`, `FirebaseInitProvider`, `versionCode=10`, `minSdk=23`, and `targetSdk=36`.
 * 2. Collapses `@id/playerTxt` watermarks (and `@id/message_card` promo bars when enabled) in layout XMLs.
 * 3. Deletes `libnative-lib.so` across all ABIs (and `libtoolChecker.so` only when the root bypass
 *    is enabled, since `RootBeerNative.<clinit>` loads it), leaving Media3's `libffmpegJNI.so`
 *    and `libdav1dJNI.so` untouched. `libdatastore_shared_counter.so` is kept (unused by app code).
 */
internal val manifestAndNativeDebloatPatch = resourcePatch {
    execute {
        val removePush = removePushNotificationsOption.value == true
        val bypassEnv = bypassEnvironmentChecksOption.value == true
        val bypassUpdate = bypassUpdateGateOption.value == true
        val hideMarquee = hidePromoMarqueeOption.value == true
        val stripBloat = stripNativeAndTelemetryBloatOption.value == true

        // 1. Clean AndroidManifest.xml while strictly preserving RemoteConfig + Installations + SDK/version metadata.
        document("AndroidManifest.xml").use { manifest ->
            val removablePermissions = buildSet {
                add("com.google.android.gms.permission.AD_ID")
                add("android.permission.ACCESS_ADSERVICES_ATTRIBUTION")
                add("android.permission.ACCESS_ADSERVICES_AD_ID")
                add("com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
                if (removePush) {
                    add("android.permission.POST_NOTIFICATIONS")
                    add("com.google.android.c2dm.permission.RECEIVE")
                }
                if (bypassUpdate) {
                    add("android.permission.REQUEST_INSTALL_PACKAGES")
                }
            }

            // `SupportActivity` deliberately stays declared: the 10-second sponsor gate is
            // bypassed in bytecode, and removing the activity could crash any other menu or
            // deeplink entry that still starts it.
            val removableComponents = buildSet {
                if (removePush) {
                    add("com.pro.cricztv.firebase.PushService")
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

            // Note: AbtRegistrar is intentionally kept because RemoteConfigRegistrar declares a
            // mandatory DI dependency on ha.a (AbtComponent), whereas AnalyticsConnector is optional.
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

        // 2. Neutralize player watermark TextViews in XML so even transient visibility toggles render nothing,
        // and collapse promo marquee cards in XML when `hidePromoMarquee` is enabled.
        listOf(
            "res/layout/activity_player.xml",
            "res/layout/layout_floating_player.xml",
        ).forEach { layoutPath ->
            document(layoutPath).use { doc ->
                doc.findElementsByAndroidId("playerTxt").forEach { el ->
                    el.setAndroidAttr("text", "")
                    el.setAndroidAttr("alpha", "0.0")
                    el.setAndroidAttr("visibility", "gone")
                }
                if (hideMarquee && layoutPath.endsWith("activity_player.xml")) {
                    doc.findElementsByAndroidId("message_card").forEach { el ->
                        el.setAndroidAttr("visibility", "gone")
                    }
                }
            }
        }

        if (hideMarquee) {
            document("res/layout/layout_event_home.xml").use { doc ->
                doc.findElementsByAndroidId("message_card").forEach { el ->
                    el.setAndroidAttr("visibility", "gone")
                }
            }
        }

        // 3. Delete unneeded native `.so` binaries across all ABIs (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`),
        // keeping only Media3's `libffmpegJNI.so` and `libdav1dJNI.so`.
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

private fun Document.findElementsByAndroidId(idName: String): List<Element> {
    val result = ArrayList<Element>()
    val all = getElementsByTagName("*")
    val suffixes = setOf("@id/$idName", "@+id/$idName")
    for (i in 0 until all.length) {
        val el = all.item(i) as? Element ?: continue
        if (el.androidId() in suffixes) {
            result.add(el)
        }
    }
    return result
}
