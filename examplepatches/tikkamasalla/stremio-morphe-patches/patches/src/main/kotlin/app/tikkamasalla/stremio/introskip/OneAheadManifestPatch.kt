package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.patch.resourcePatch

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SERVICE_NAME = "app.tikkamasalla.stremio.oneahead.OneAheadWorkerService"

/**
 * Declares the worker service of the background skip detection in a process of its own, so a
 * native decoder crash there leaves the player alone. Runs with Intro Skip.
 */
val oneAheadManifestPatch = resourcePatch(
    description = "Declares the background skip detection worker for Intro Skip.",
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.documentElement.getElementsByTagName("application").item(0)
                ?: return@execute
            val services = doc.getElementsByTagName("service")
            for (i in 0 until services.length) {
                if (services.item(i).attributes?.getNamedItem("android:name")?.nodeValue == SERVICE_NAME) {
                    return@execute
                }
            }
            val service = doc.createElement("service")
            service.setAttributeNS(ANDROID_NS, "android:name", SERVICE_NAME)
            service.setAttributeNS(ANDROID_NS, "android:exported", "false")
            service.setAttributeNS(ANDROID_NS, "android:process", ":oneahead")
            application.appendChild(service)
        }
    }
}
