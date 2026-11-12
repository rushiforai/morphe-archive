package app.mitrosoft.patches.bergfex

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX
import org.w3c.dom.Element

private const val FIREBASE_COLLECTION_FLAG = "firebase_analytics_collection_deactivated"

@Suppress("unused")
val disableFirebaseCollectionPatch = resourcePatch(
    name = "Disable Firebase Analytics collection",
    description = "Sets firebase_analytics_collection_deactivated in AndroidManifest.xml so Firebase Analytics " +
        "stops automatic data collection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val metaElements = manifest.getElementsByTagName("meta-data")
            val existing = (0 until metaElements.length)
                .map { metaElements.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == FIREBASE_COLLECTION_FLAG }

            (existing ?: manifest.createElement("meta-data").also { application.appendChild(it) }).apply {
                setAttribute("android:name", FIREBASE_COLLECTION_FLAG)
                setAttribute("android:value", "true")
            }
        }
    }
}
