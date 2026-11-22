package patapon888.morphe.patches.bejeweled.branding

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import org.w3c.dom.Element

@Suppress("unused")
val appNamePatch = resourcePatch(
    name = "Change app name",
    description = "Renames the app from \"Classic\" in the launcher."
) {
    compatibleWith(BEJEWELED_3)

    val appName by stringOption(
        key = "appName",
        default = "Bejeweled",
        values = mapOf("Bejeweled" to "Bejeweled"),
        title = "App name",
        description = "The name shown under the app icon.",
        required = true,
    )

    execute {
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            val appNameString = (0 until strings.length).map { strings.item(it) as Element }
                .firstOrNull { it.getAttribute("name") == "app_name" }
                ?: throw PatchException("app_name string not found")
            appNameString.textContent = appName!!
        }
    }
}
