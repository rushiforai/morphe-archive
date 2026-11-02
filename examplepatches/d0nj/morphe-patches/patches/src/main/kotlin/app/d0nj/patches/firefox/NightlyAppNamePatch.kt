package app.d0nj.patches.firefox

import app.d0nj.patches.firefox.Constants.COMPATIBILITY_FIREFOX
import app.d0nj.patches.shared.elementByName
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption

private const val NIGHTLY_APP_NAME = "Firefox Nightly"

@Suppress("unused")
val nightlyAppNamePatch = resourcePatch(
    name = "Firefox Nightly app name",
    description = "Renames the app to Firefox Nightly, or to a name of your own.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    val appNameOption = stringOption(
        key = "appName",
        default = NIGHTLY_APP_NAME,
        title = "App name",
        description = "Name shown under the icon.",
        required = true,
    )

    execute {
        document("res/values/strings.xml").use { strings ->
            strings.elementByName("app_name").textContent = appNameOption.value!!
        }
    }
}
