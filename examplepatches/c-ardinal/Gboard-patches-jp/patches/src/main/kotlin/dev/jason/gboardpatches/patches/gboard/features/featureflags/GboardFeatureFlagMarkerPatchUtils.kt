package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.ResourcePatchContext
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import org.w3c.dom.Element

context(context: ResourcePatchContext)
internal fun applyFeatureMarker(markerName: String) = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val application = manifest.childElements("application").firstOrNull()
            ?: error("Could not find application element in AndroidManifest.xml")

        val metaData = application.childElements("meta-data").firstOrNull {
            it.androidAttribute("name") == markerName
        } ?: document.createElement("meta-data").also { createdMetaData ->
            application.appendChild(createdMetaData)
        }

        metaData.setAndroidAttribute("name", markerName)
        metaData.setAndroidAttribute("value", "true")
    }
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}
