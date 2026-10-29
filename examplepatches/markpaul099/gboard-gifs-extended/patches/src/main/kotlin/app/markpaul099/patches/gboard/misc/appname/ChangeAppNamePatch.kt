package app.markpaul099.patches.gboard.misc.appname

import app.markpaul099.patches.shared.Constants.ANDROID_NAMESPACE
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val DEFAULT_APP_NAME = "Gboard GIFs"

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Changes the name shown in the launcher and the keyboard list.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        values = mapOf("Default" to DEFAULT_APP_NAME),
        title = "App name",
        description = "The name shown in the launcher and the keyboard list.",
        required = true
    ) { !it.isNullOrBlank() }

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            // The launcher and the keyboard list both fall back to the application label.
            application.setAttributeNS(ANDROID_NAMESPACE, "android:label", appNameOption.value!!)
        }
    }
}
