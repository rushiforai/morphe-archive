package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.patch.resourcePatch

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val PROVIDER_NAME = "net.gtvbox.videoplayer.ProgressJournalProvider"
private const val PROVIDER_AUTHORITY = "net.gtvbox.videoplayer.tikka.progress"

/**
 * Declares the read-only progress journal provider in Vimu, so Stremio can read the last position
 * even after Vimu died. Exported without a permission attribute: the provider itself answers
 * only com.stremio.one. Adds no uses-permission. Runs with External player result (Vimu).
 */
val vimuProgressManifestPatch = resourcePatch(
    name = "Progress journal provider (Vimu)",
    description = "Declares the progress journal provider. Runs with External player result (Vimu).",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.documentElement.getElementsByTagName("application").item(0)
                ?: return@execute

            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                if (providers.item(i).attributes?.getNamedItem("android:name")?.nodeValue == PROVIDER_NAME) {
                    return@execute
                }
            }

            val provider = doc.createElement("provider")
            provider.setAttributeNS(ANDROID_NS, "android:name", PROVIDER_NAME)
            provider.setAttributeNS(ANDROID_NS, "android:authorities", PROVIDER_AUTHORITY)
            provider.setAttributeNS(ANDROID_NS, "android:exported", "true")
            application.appendChild(provider)
        }
    }
}
