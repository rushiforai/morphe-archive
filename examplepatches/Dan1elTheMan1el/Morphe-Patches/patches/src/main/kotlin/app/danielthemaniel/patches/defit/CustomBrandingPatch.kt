package app.danielthemaniel.patches.defit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom Branding",
    description = "Changes DeFit's app name, header title, and displayed version.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)

    val appNameOption = stringOption(
        key = "appName",
        title = "App name",
        description = "Launcher/app display name.",
        required = true,
        default = "DeFit++",
    )

    val headerOption = stringOption(
        key = "topBarText",
        title = "Top bar text",
        description = "Text shown in DeFit's top action bar.",
        required = true,
        default = "DeFit++ - Unlimited Debugging",
    )

    val versionOption = stringOption(
        key = "version",
        title = "Version",
        description = "Version text shown at the bottom of the main screen.",
        required = true,
        default = "0.8.2a-patched",
    )

    execute {
        val appName = appNameOption.value ?: "DeFit++"
        val header = headerOption.value ?: "DeFit++ - Unlimited Debugging"
        val version = versionOption.value ?: "0.8.2a-patched"

        // MainActivity uses app_name_full for the action-bar title.
        // The launcher/application label uses app_name in the stock APK.
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")

            for (i in 0 until strings.length) {
                val string = strings.item(i) as? Element ?: continue

                when (string.getAttribute("name")) {
                    "app_name",
                    "app_name_debug",
                    "app_name_release" -> string.textContent = appName

                    "app_name_full" -> string.textContent = header
                }
            }
        }

        /*
         * MainActivity hardcodes:
         *     findViewById(R.id.version).setText("0.8.2a")
         *
         * Keep that original view present but hidden, then put a cloned visible
         * version label beside it. This avoids bytecode changes and still lets
         * this remain one resource patch with three settings.
         */
        document("res/layout/activity_main.xml").use { document ->
            val nodes = document.getElementsByTagName("*")
            var stockVersion: Element? = null

            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as? Element ?: continue
                val id = element.getAttribute("android:id")

                if (id == "@+id/version" || id == "@id/version") {
                    stockVersion = element
                    break
                }
            }

            stockVersion?.let { original ->
                val patched = original.cloneNode(true) as Element

                // MainActivity continues writing its stock version to the
                // original hidden view.
                original.setAttribute("android:visibility", "gone")
                original.setAttribute("android:layout_width", "0dp")
                original.setAttribute("android:layout_height", "0dp")

                patched.setAttribute(
                    "android:id",
                    "@+id/defit_patched_version_display"
                )
                patched.setAttribute("android:text", version)
                patched.setAttribute("android:visibility", "visible")

                original.parentNode.insertBefore(
                    patched,
                    original.nextSibling
                )
            }
        }
    }
}
