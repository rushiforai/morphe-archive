package app.apppatches.patches.devolutions

import app.apppatches.patches.shared.Constants.RDM_COMPATIBILITY
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document

private const val ANDROID_MANIFEST = "AndroidManifest.xml"
private const val ANDROID_NAME = "android:name"
private const val FIREBASE_COMPONENT_PREFIX = "com.google.firebase.components:"

/**
 * Firebase's ComponentDiscoveryService initializes every registrar listed in the
 * manifest before the first activity is created. The analytics connector is
 * marked eagerInDefaultApp, so it starts AppMeasurement, binds the Google Play
 * services measurement service and fetches the advertising ID on every launch,
 * even though the collection flags are already disabled by the analytics patch.
 * Crashlytics only consumes the connector through an optional Deferred, and the
 * sessions subscriber is optional too, so dropping both leaves crash reporting
 * and push notifications intact without the analytics startup work. The KTX
 * registrar only adds Kotlin extension functions and is unused by this C# app.
 */
private val RDM_SKIPPED_FIREBASE_COMPONENTS = setOf(
    "com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar",
    "com.google.firebase.sessions.FirebaseSessionsRegistrar",
    "com.google.firebase.crashlytics.FirebaseCrashlyticsKtxRegistrar"
)

/**
 * EmojiCompat loads the emoji font and installs a lifecycle observer while the
 * splash screen is still visible. The app renders its UI with Avalonia/Skia, so
 * the AndroidX emoji initializer has nothing to prepare.
 */
private val RDM_SKIPPED_STARTUP_INITIALIZERS = setOf(
    "androidx.emoji2.text.EmojiCompatInitializer"
)

private fun Document.removeMetaData(names: Set<String>) {
    val metaData = getElementsByTagName("meta-data")
    for (index in metaData.length - 1 downTo 0) {
        val element = metaData.item(index)
        val name = element.attributes?.getNamedItem(ANDROID_NAME)?.nodeValue ?: continue
        val isSkippedFirebaseComponent = name.startsWith(FIREBASE_COMPONENT_PREFIX) &&
            name.removePrefix(FIREBASE_COMPONENT_PREFIX) in RDM_SKIPPED_FIREBASE_COMPONENTS

        if (name in names || isSkippedFirebaseComponent) {
            element.parentNode.removeChild(element)
        }
    }
}

@Suppress("unused")
val rdmFasterStartupPatch = resourcePatch(
    name = "Faster Startup",
    description = "Skips the Firebase Analytics connector, Crashlytics session tracking and the " +
        "emoji-compat initializer that run on every launch. Crash reporting, push notifications " +
        "and background jobs keep working; analytics and app-quality session data are not collected.",
    default = true
) {
    compatibleWith(RDM_COMPATIBILITY)

    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.removeMetaData(RDM_SKIPPED_STARTUP_INITIALIZERS)
        }
    }
}
