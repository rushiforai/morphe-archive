package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

internal val gboardAdvancedVoiceFeatureMarkerPatch = resourcePatch(
    description = "標記 Advanced Voice Typing feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ADVANCED_VOICE_FEATURE_MARKER)
        ensurePackageQueries()
    }
}

context(context: ResourcePatchContext)
private fun ensurePackageQueries() = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val queries = manifest.childElements("queries").firstOrNull()
            ?: document.createElement("queries").also { createdQueries ->
                val application = manifest.childElements("application").firstOrNull()
                if (application == null) {
                    manifest.appendChild(createdQueries)
                } else {
                    manifest.insertBefore(createdQueries, application)
                }
            }

        ADVANCED_VOICE_PACKAGE_QUERIES.forEach { packageName ->
            val packageQuery = queries.childElements("package").firstOrNull {
                it.androidAttribute("name") == packageName
            } ?: document.createElement("package").also(queries::appendChild)
            packageQuery.setAndroidAttribute("name", packageName)
        }
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

internal const val ADVANCED_VOICE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.advanced_voice_typing"

private val ADVANCED_VOICE_PACKAGE_QUERIES = listOf(
    "com.google.android.tts",
    "com.google.audio.hearing.visualization.accessibility.scribe",
)
