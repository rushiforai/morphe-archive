package app.d0nj.patches.firefox

import app.d0nj.patches.firefox.Constants.COMPATIBILITY_FIREFOX
import app.d0nj.patches.shared.copyBundledResources
import app.d0nj.patches.shared.elementByName
import app.morphe.patcher.patch.resourcePatch

private const val BUNDLED_RESOURCE_DIRECTORY = "firefox-nightly"
private const val NIGHTLY_LAUNCHER_BACKGROUND = "#220033"

private val launcherIconFiles = listOf(
    "drawable/ic_launcher_foreground.xml",
) + (0..11).map { "drawable/\$ic_launcher_foreground__$it.xml" }

@Suppress("unused")
val nightlyIconPatch = resourcePatch(
    name = "Firefox Nightly icon",
    description = "Swaps the launcher icon for the Nightly one.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        copyBundledResources(BUNDLED_RESOURCE_DIRECTORY, launcherIconFiles)

        document("res/values/colors.xml").use { colors ->
            colors.elementByName("ic_launcher_background").textContent =
                NIGHTLY_LAUNCHER_BACKGROUND
        }
    }
}
