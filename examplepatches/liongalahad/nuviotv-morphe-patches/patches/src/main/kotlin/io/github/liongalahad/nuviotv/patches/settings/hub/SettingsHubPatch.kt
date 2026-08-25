package io.github.liongalahad.nuviotv.patches.settings.hub

import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element
import java.util.Properties

private const val PROVIDER_CLASS =
    "io.github.liongalahad.nuviotv.extension.settings.MorpheInitProvider"

private object SettingsHubMetadata

private val displayVersion: String by lazy {
    val properties = Properties()
    val stream = checkNotNull(
        SettingsHubMetadata::class.java.classLoader.getResourceAsStream("morphe-build.properties")
    ) { "Morphe build metadata is missing" }
    stream.use(properties::load)
    checkNotNull(properties.getProperty("version")) { "Morphe build version is missing" }
        .trim()
        .replace(Regex("-dev\\.(\\d+)$"), "-dev$1")
}

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
        }

        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (index in 0 until strings.length) {
                val element = strings.item(index) as? Element ?: continue
                when (element.getAttribute("name")) {
                    "settings_experience" -> element.textContent = "Morphe"
                    "settings_experience_subtitle" ->
                        element.textContent = "Patch settings  •  $displayVersion"
                }
            }
        }
    }
}
