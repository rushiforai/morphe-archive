package patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val FIREBASE_OFF_FLAGS = listOf(
    "firebase_analytics_collection_enabled",
    "google_analytics_automatic_screen_reporting_enabled",
    "google_analytics_adid_collection_enabled",
    "google_analytics_default_allow_analytics_storage",
    "google_analytics_default_allow_ad_storage",
    "google_analytics_default_allow_ad_user_data",
    "google_analytics_default_allow_ad_personalization_signals",
    "firebase_crashlytics_collection_enabled",
    "firebase_sessions_enabled",
)

/**
 * Disables Google measurement, Firebase Analytics and Crashlytics/Sessions upload, and removes
 * advertising and install-referrer permissions from a game manifest. Existing flags are
 * overwritten, missing flags are created; measurement receiver/services are disabled in place.
 * Returns the number of removed advertising/attribution permission elements.
 */
internal fun disableMeasurementAndAttribution(manifest: Document): Int {
    val application = manifest.getElementsByTagName("application").item(0) as Element

    fun flag(name: String, value: Boolean) {
        val nodes = manifest.getElementsByTagName("meta-data")
        val existing = (0 until nodes.length).map { nodes.item(it) as Element }
            .filter { it.getAttributeNS(ANDROID, "name") == name }
        check(existing.size <= 1) { "Duplicate manifest flag: $name" }
        (existing.singleOrNull() ?: manifest.createElement("meta-data").also {
            it.setAttributeNS(ANDROID, "android:name", name)
            application.appendChild(it)
        }).setAttributeNS(ANDROID, "android:value", value.toString())
    }

    // Hard deactivation wins over any runtime consent callback that re-enables collection.
    flag("firebase_analytics_collection_deactivated", true)
    FIREBASE_OFF_FLAGS.forEach { flag(it, false) }

    var disabled = 0
    for (tag in listOf("receiver", "service")) {
        val nodes = application.getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            val component = nodes.item(i) as Element
            if (component.getAttributeNS(ANDROID, "name")
                    .startsWith("com.google.android.gms.measurement.")
            ) {
                component.setAttributeNS(ANDROID, "android:enabled", "false")
                disabled++
            }
        }
    }
    check(disabled >= 2) { "Expected Google measurement receiver and services, found $disabled" }

    val permissions = manifest.getElementsByTagName("uses-permission")
    val removed = (0 until permissions.length).map { permissions.item(it) as Element }.filter {
        it.getAttributeNS(ANDROID, "name") in setOf(
            "com.google.android.gms.permission.AD_ID",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        )
    }
    check(removed.isNotEmpty()) { "No advertising or install-referrer permission found" }
    removed.forEach { it.parentNode.removeChild(it) }
    return removed.size
}

/** Removes a single application-level meta-data element by name; fails when it is absent. */
internal fun removeMetaData(manifest: Document, name: String) {
    val nodes = manifest.getElementsByTagName("meta-data")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttributeNS(ANDROID, "name") == name }
    check(matches.size == 1) { "Expected exactly one meta-data $name, found ${matches.size}" }
    matches.single().parentNode.removeChild(matches.single())
}

/** Disables application-level receiver/service/provider components by exact name. */
internal fun disableComponents(manifest: Document, vararg names: String) {
    val remaining = names.toMutableSet()
    for (tag in listOf("receiver", "service", "provider")) {
        val nodes = manifest.getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            val component = nodes.item(i) as Element
            val componentName = component.getAttributeNS(ANDROID, "name")
            if (componentName in remaining) {
                component.setAttributeNS(ANDROID, "android:enabled", "false")
                remaining.remove(componentName)
            }
        }
    }
    check(remaining.isEmpty()) { "Manifest components not found: $remaining" }
}

/** Sets an application-level meta-data string value, creating the element when absent. */
internal fun setMetaData(manifest: Document, name: String, value: String) {
    val application = manifest.getElementsByTagName("application").item(0) as Element
    val nodes = manifest.getElementsByTagName("meta-data")
    val existing = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttributeNS(ANDROID, "name") == name }
    check(existing.size <= 1) { "Duplicate meta-data flag: $name" }
    (existing.singleOrNull() ?: manifest.createElement("meta-data").also {
        it.setAttributeNS(ANDROID, "android:name", name)
        application.appendChild(it)
    }).setAttributeNS(ANDROID, "android:value", value)
}

/** Removes the named uses-permission elements; fails when none of them was declared. */
internal fun removePermissions(manifest: Document, vararg names: String): Int {
    val wanted = names.toSet()
    val nodes = manifest.getElementsByTagName("uses-permission")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttributeNS(ANDROID, "name") in wanted }
    check(matches.isNotEmpty()) { "None of the expected permissions found: $wanted" }
    matches.forEach { it.parentNode.removeChild(it) }
    return matches.size
}

/**
 * Removes the Privacy Sandbox advertising-services permissions when the app declares them. Games
 * that ship a recent Play Billing stack ask for these so an ad SDK can read topics, attribution and
 * a privacy-preserving ad identifier; a patched game has no use for any of them. Returns the number
 * removed, so apps without the declarations are not treated as a changed input.
 */
internal fun removeAdServicesPermissions(manifest: Document): Int {
    val adServices = setOf(
        "android.permission.ACCESS_ADSERVICES_AD_ID",
        "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
        "android.permission.ACCESS_ADSERVICES_TOPICS",
        "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    )
    val nodes = manifest.getElementsByTagName("uses-permission")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttributeNS(ANDROID, "name") in adServices }
    matches.forEach { it.parentNode.removeChild(it) }
    return matches.size
}
