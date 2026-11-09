package app.wordfeudwordfinder.patches.ads

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Ad SDK components that Android starts at every app launch, before any app code runs. With "Remove ads" the ad
 * SDKs are never initialised (they start only after the ad consent flow, which AdBlock skips), so starting
 * these components only costs time, memory and network.
 * (tag, android:name). Elements inside them are removed with them.
 */
private val REMOVED_COMPONENTS = listOf(
    "provider" to "com.facebook.ads.AudienceNetworkContentProvider", // loads the Facebook Audience Network code
    "provider" to "com.vungle.ads.VungleProvider",                   // Vungle activity tracking
)

/** androidx.startup initializers (meta-data inside androidx.startup.InitializationProvider). */
private val REMOVED_INITIALIZERS = listOf(
    "com.unity3d.services.core.configuration.AdsSdkInitializer",     // starts the Unity Ads SDK (network)
)

/** Advertising ID and Privacy Sandbox (ad measurement) permissions. */
private val REMOVED_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

/**
 * What push notifications need (Firebase Cloud Messaging and its Flutter plugin). The patch never touches these;
 * it checks afterwards that every one that was present still is, so a later edit of the lists above cannot
 * silently break notifications. (tag, android:name)
 */
private val NOTIFICATION_COMPONENTS = listOf(
    "uses-permission" to "android.permission.POST_NOTIFICATIONS",
    "uses-permission" to "com.google.android.c2dm.permission.RECEIVE",
    "uses-permission" to "android.permission.WAKE_LOCK",
    "uses-permission" to "android.permission.INTERNET",
    "provider" to "com.google.firebase.provider.FirebaseInitProvider",
    "provider" to "io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingInitProvider",
    "service" to "com.google.firebase.components.ComponentDiscoveryService",
    "service" to "com.google.firebase.messaging.FirebaseMessagingService",
    "service" to "io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingService",
    "service" to "io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService",
    "receiver" to "com.google.firebase.iid.FirebaseInstanceIdReceiver",
    "receiver" to "io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingReceiver",
)

// Internal patch (no name): the manifest part of "Remove ads" (removeAdsPatch depends on it, which also supplies
// compatibleWith). A resource patch, because it edits AndroidManifest.xml; the bytecode part is in RemoveAdsPatch.kt.
internal val adManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            fun elements(tag: String): List<Element> {
                val list = doc.getElementsByTagName(tag)
                return (0 until list.length).map { list.item(it) as Element }
            }
            fun Element.androidName(): String = getAttribute("android:name")
            fun names(tag: String) = elements(tag).map { it.androidName() }.toSet()

            val notificationsBefore = NOTIFICATION_COMPONENTS.filter { (tag, name) -> name in names(tag) }

            // 1. Ad SDK start-up. Elements that a Wordfeud version does not have are simply skipped.
            for ((tag, name) in REMOVED_COMPONENTS) {
                elements(tag).filter { it.androidName() == name }.forEach { it.parentNode.removeChild(it) }
            }
            elements("meta-data")
                .filter { it.androidName() in REMOVED_INITIALIZERS }
                .forEach { it.parentNode.removeChild(it) }

            // 2. Firebase Analytics off (documented switch; Analytics then collects and sends nothing). Push
            // notifications do not use Analytics: Firebase Messaging only logs to it when it is on.
            val application = elements("application").single()
            elements("meta-data")
                .filter { it.androidName().startsWith("firebase_analytics_collection_") }
                .forEach { it.parentNode.removeChild(it) }
            application.appendChild(doc.createElement("meta-data").apply {
                setAttribute("android:name", "firebase_analytics_collection_deactivated")
                setAttribute("android:value", "true")
            })

            // 3. Advertising ID and Privacy Sandbox permissions.
            elements("uses-permission")
                .filter { it.androidName() in REMOVED_PERMISSIONS }
                .forEach { it.parentNode.removeChild(it) }

            // Safety net for notifications (see NOTIFICATION_COMPONENTS).
            val missing = notificationsBefore.filter { (tag, name) -> name !in names(tag) }
            if (missing.isNotEmpty()) {
                error("Remove ads would remove what notifications need: $missing")
            }
        }
    }
}
