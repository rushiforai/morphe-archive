package app.morphe.patches.tv360

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * TV360 Bitel 1.6 (versionCode 161, Huawei-distributed APK).
 *
 * This is a manifest-only adaptation. It deliberately does not reuse 3.5
 * bytecode fingerprints or alter the 3.5 patch definitions.
 *
 * Runtime behavior and installed-app compatibility remain unverified.
 */
private fun tv360Huawei16SetApplicationMetaData(
    manifest: Document,
    application: Element,
    key: String,
    value: Boolean,
) {
    val matching = (0 until application.childNodes.length)
        .mapNotNull { application.childNodes.item(it) as? Element }
        .filter { it.tagName == "meta-data" && it.getAttribute("android:name") == key }
    if (matching.size > 1) {
        throw PatchException("TV360 1.6 privacy: duplicate meta-data entry for $key")
    }
    val item = matching.singleOrNull() ?: manifest.createElement("meta-data").also {
        it.setAttribute("android:name", key)
        application.appendChild(it)
    }
    if (item.hasAttribute("android:resource")) {
        throw PatchException("TV360 1.6 privacy: $key is resource-bound; refusing to replace")
    }
    item.setAttribute("android:value", value.toString())
}

private fun tv360Huawei16Application(manifest: Document): Element {
    val applications = manifest.getElementsByTagName("application")
    if (applications.length != 1) {
        throw PatchException("TV360 1.6 privacy: expected exactly one application")
    }
    return applications.item(0) as? Element
        ?: throw PatchException("TV360 1.6 privacy: invalid application node")
}

@Suppress("unused")
val tv360Huawei16OptionalAnalyticsPrivacyPatch = resourcePatch(
    name = "TV360 Bitel 1.6 - Optional Analytics Privacy",
    description = "Sets optional Firebase Analytics and Facebook automatic event collection opt-outs.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = tv360Huawei16Application(manifest)
            val settings = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false,
                "com.facebook.sdk.AutoLogMetaDataEnabled" to false,
            )
            for ((key, value) in settings) {
                tv360Huawei16SetApplicationMetaData(manifest, application, key, value)
            }
        }
    }
}

@Suppress("unused")
val tv360Huawei16OptionalCrashReportsPrivacyPatch = resourcePatch(
    name = "TV360 Bitel 1.6 - Optional Crash Reports Privacy",
    description = "Disables automatic Firebase Crashlytics collection via manifest metadata.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        document("AndroidManifest.xml").use { manifest ->
            tv360Huawei16SetApplicationMetaData(
                manifest,
                tv360Huawei16Application(manifest),
                "firebase_crashlytics_collection_enabled",
                false,
            )
        }
    }
}
