package app.bugg4.patches.oplmonitor.misc

import app.bugg4.patches.oplmonitor.Constants.COMPATIBILITY_OPL_MONITOR
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val spoofAppVersionPatch = resourcePatch(
    name = "Spoof app version",
    description = "Changes the version name the app reports to itself. " +
        "Reporting a version higher than any published release can prevent the in-app update prompt. " +
        "The spoofed version will also be shown in the app's about screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_OPL_MONITOR)

    val spoofedVersionOption = stringOption(
        key = "version",
        default = "9.9.9",
        title = "Spoofed version",
        description = "Version name to report. Must be higher than the latest released app version.",
        required = true,
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("android:versionName", spoofedVersionOption.value!!)
        }
    }
}
