package io.github.liongalahad.nuviotv.patches.settings.hub

import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val PROVIDER_CLASS =
    "io.github.liongalahad.nuviotv.extension.settings.MorpheInitProvider"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.category.subtitles"

/** Shared internal dependency for configurable NuvioTV patches. */
internal val settingsHubPatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val providers = document.getElementsByTagName("provider")
            val providerExists = (0 until providers.length).any {
                (providers.item(it) as? Element)?.getAttribute("android:name") == PROVIDER_CLASS
            }
            if (!providerExists) {
                application.appendChild(document.createElement("provider").apply {
                    setAttribute("android:name", PROVIDER_CLASS)
                    setAttribute("android:authorities", "com.nuvio.tv.morphe-init")
                    setAttribute("android:exported", "false")
                    setAttribute("android:initOrder", "100")
                })
            }
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", "true")
            })
        }

        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (index in 0 until strings.length) {
                val element = strings.item(index) as? Element ?: continue
                when (element.getAttribute("name")) {
                    "settings_experience" -> element.textContent = "Morphe"
                    "settings_experience_subtitle" -> element.textContent = "Subtitle patch settings"
                    "experience_mode_group_title" -> element.textContent = "Subtitles"
                    "experience_mode_switch_to_advanced",
                    "experience_mode_switch_to_essential" ->
                        element.textContent = "Subtitles"
                    "experience_mode_switch_to_advanced_subtitle",
                    "experience_mode_switch_to_essential_subtitle" ->
                        element.textContent = "Configure subtitle patch settings"
                    "experience_mode_confirm_advanced_title" ->
                        element.textContent = "Remove SDH Annotations"
                    "experience_mode_confirm_advanced_subtitle" ->
                        element.textContent =
                            "Remove sound descriptions, speaker labels, and other SDH text"
                }
            }
        }
    }
}
