package app.consumerclarity.patches.talabat

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun ResourcePatchContext.editManifest(action: (Element, Element) -> Unit) {
    decode("AndroidManifest.xml")
    document("AndroidManifest.xml").use { manifest ->
        val root = manifest.getElementsByTagName("manifest").item(0) as Element
        val application = manifest.getElementsByTagName("application").item(0) as Element
        action(root, application)
    }
}

private fun ResourcePatchContext.removePermission(permission: String) = editManifest { root, _ ->
    val nodes = root.getElementsByTagName("uses-permission")
    val matches = mutableListOf<Element>()
    for (index in 0 until nodes.length) {
        val node = nodes.item(index) as Element
        if (node.getAttributeNS(ANDROID_NS, "name") == permission) matches += node
    }
    matches.forEach { root.removeChild(it) }
}

private fun ResourcePatchContext.disableComponents(vararg classNames: String) = editManifest { _, application ->
    val children = application.childNodes
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (child.getAttributeNS(ANDROID_NS, "name") in classNames) {
            child.setAttributeNS(ANDROID_NS, "android:enabled", "false")
        }
    }
}

private fun ResourcePatchContext.removeMetadata(vararg names: String) = editManifest { _, application ->
    val children = application.childNodes
    val matches = mutableListOf<Element>()
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (child.nodeName == "meta-data" && child.getAttributeNS(ANDROID_NS, "name") in names) matches += child
    }
    matches.forEach { application.removeChild(it) }
}

@Suppress("unused")
val removeAdIdPermissionPatch = consumerResourcePatch(
    "Remove advertising ID permission",
    "Removes Android's advertising-identifier permission. Talabat can no longer request the Google advertising ID.",
    "Privacy",
) { removePermission("com.google.android.gms.permission.AD_ID") }

@Suppress("unused")
val removeAdAttributionPermissionPatch = consumerResourcePatch(
    "Remove ad attribution access",
    "Removes access to Android Privacy Sandbox attribution reporting.",
    "Privacy",
) { removePermission("android.permission.ACCESS_ADSERVICES_ATTRIBUTION") }

@Suppress("unused")
val removeAdServicesIdPermissionPatch = consumerResourcePatch(
    "Remove ad services identifier access",
    "Removes access to Android Privacy Sandbox advertising identifiers.",
    "Privacy",
) { removePermission("android.permission.ACCESS_ADSERVICES_AD_ID") }

@Suppress("unused")
val disableInstallReferrerPatch = consumerResourcePatch(
    "Disable Adjust install referrer",
    "Disables Adjust's install-referrer receiver without changing normal deep links.",
    "Privacy",
) { disableComponents("com.adjust.sdk.AdjustReferrerReceiver") }

@Suppress("unused")
val disableGoogleTagManagerPatch = consumerResourcePatch(
    "Disable Google Tag Manager",
    "Disables the Tag Manager background service used for marketing measurement.",
    "Privacy",
) { disableComponents("com.google.android.gms.tagmanager.TagManagerService") }

@Suppress("unused")
val disableFirebaseSessionsPatch = consumerResourcePatch(
    "Disable Firebase session reporting",
    "Disables Firebase's session lifecycle reporting service. Crash and analytics controls remain separate.",
    "Privacy",
) { disableComponents("com.google.firebase.sessions.SessionLifecycleService") }

@Suppress("unused")
val disableAnalyticsUploadServicePatch = consumerResourcePatch(
    "Disable Analytics upload services",
    "Disables Google Analytics measurement upload services and its receiver.",
    "Privacy",
) {
    disableComponents(
        "com.google.android.gms.measurement.AppMeasurementService",
        "com.google.android.gms.measurement.AppMeasurementJobService",
        "com.google.android.gms.measurement.AppMeasurementReceiver",
    )
}

@Suppress("unused")
val disableGoogleDataTransportPatch = consumerResourcePatch(
    "Disable Google telemetry transport",
    "Disables Google's background telemetry upload scheduler and alarm receivers.",
    "Privacy",
) {
    disableComponents(
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
    )
}

@Suppress("unused")
val disableHuaweiAdsIdentifierPatch = consumerResourcePatch(
    "Disable Huawei ads identifier",
    "Removes Huawei's advertising-identifier service declaration while leaving Huawei login and maps intact.",
    "Privacy",
) { removeMetadata("com.huawei.hms.client.service.name:ads-identifier") }

@Suppress("unused")
val disableBackgroundLocationPatch = consumerResourcePatch(
    "Disable background location",
    "Removes background-location access. Foreground delivery addresses and order tracking can still work.",
    "Device privacy",
) { removePermission("android.permission.ACCESS_BACKGROUND_LOCATION") }

@Suppress("unused")
val disableCountryGeofencePatch = consumerResourcePatch(
    "Disable country geofence notifications",
    "Disables the receiver that reacts to country-boundary location changes.",
    "Device privacy",
) { disableComponents("flutter.plugins.country_geofence_notifications.CountryGeofenceBroadcastReceiver") }

@Suppress("unused")
val disableHighRateSensorsPatch = consumerResourcePatch(
    "Disable high-rate sensors",
    "Removes access to high-sampling-rate motion sensors used by diagnostics and gesture detection.",
    "Device privacy",
) { removePermission("android.permission.HIGH_SAMPLING_RATE_SENSORS") }

@Suppress("unused")
val disableBluetoothPatch = consumerResourcePatch(
    "Disable Bluetooth access",
    "Removes Bluetooth scan, connect, advertise, and legacy Bluetooth permissions.",
    "Device privacy",
) {
    listOf(
        "android.permission.BLUETOOTH",
        "android.permission.BLUETOOTH_ADMIN",
        "android.permission.BLUETOOTH_SCAN",
        "android.permission.BLUETOOTH_CONNECT",
        "android.permission.BLUETOOTH_ADVERTISE",
    ).forEach(::removePermission)
}

@Suppress("unused")
val disableNfcPatch = consumerResourcePatch(
    "Disable NFC access",
    "Removes NFC access from Talabat.",
    "Device privacy",
) { removePermission("android.permission.NFC") }

@Suppress("unused")
val disableScreenCaptureDetectionPatch = consumerResourcePatch(
    "Disable screenshot detection",
    "Removes Android's screen-capture detection permission. This does not prevent Android screenshots.",
    "Device privacy",
) { removePermission("android.permission.DETECT_SCREEN_CAPTURE") }

@Suppress("unused")
val disableSystemOverlayPatch = consumerResourcePatch(
    "Disable system overlays",
    "Removes Talabat's ability to draw over other apps.",
    "Device privacy",
) { removePermission("android.permission.SYSTEM_ALERT_WINDOW") }

@Suppress("unused")
val disableCameraAccessPatch = consumerResourcePatch(
    "Disable camera access",
    "Removes camera permission. QR scanning, document capture, and profile-photo capture will be unavailable.",
    "Device privacy",
) { removePermission("android.permission.CAMERA") }

@Suppress("unused")
val disableMicrophoneAccessPatch = consumerResourcePatch(
    "Disable microphone access",
    "Removes microphone permission and prevents in-app audio recording.",
    "Device privacy",
) { removePermission("android.permission.RECORD_AUDIO") }

@Suppress("unused")
val disableLegacyStoragePatch = consumerResourcePatch(
    "Disable legacy external storage",
    "Removes legacy broad external-storage read and write permissions. App-owned media sharing remains separate.",
    "Device privacy",
) {
    removePermission("android.permission.READ_EXTERNAL_STORAGE")
    removePermission("android.permission.WRITE_EXTERNAL_STORAGE")
}

@Suppress("unused")
val disableBrazeContentCardsPatch = consumerResourcePatch(
    "Hide Braze content cards",
    "Disables Braze's promotional content-card activity.",
    "Promotions",
) { disableComponents("com.braze.ui.activities.ContentCardsActivity") }

@Suppress("unused")
val disableBrazePushPatch = consumerResourcePatch(
    "Disable Braze promotional push",
    "Disables Braze's push receiver. Talabat's separate Firebase order-messaging service is unchanged.",
    "Promotions",
) {
    disableComponents(
        "com.braze.push.BrazePushReceiver",
        "com.braze.BrazeFlushPushDeliveryReceiver",
    )
}

@Suppress("unused")
val disableShakeRecordingServicePatch = consumerResourcePatch(
    "Disable Shake Bugs screen recording",
    "Disables Shake Bugs' foreground screen-recording service.",
    "Diagnostics",
) { disableComponents("com.shakebugs.shake.internal.shake.recording.ScreenRecordingService") }

@Suppress("unused")
val disableSentryPerformanceProviderPatch = consumerResourcePatch(
    "Disable Sentry startup performance",
    "Disables Sentry's automatic startup performance provider.",
    "Diagnostics",
) { disableComponents("io.sentry.android.core.SentryPerformanceProvider") }

@Suppress("unused")
val disableSentryNdkPreloadPatch = consumerResourcePatch(
    "Disable Sentry native crash preload",
    "Disables Sentry's native crash-handler preload provider.",
    "Diagnostics",
) { disableComponents("io.sentry.ndk.SentryNdkPreloadProvider") }
