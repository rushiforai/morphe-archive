package app.bugg4.patches.oplmonitor.misc

import app.bugg4.patches.oplmonitor.Constants.COMPATIBILITY_OPL_MONITOR
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val spoofAppVersionPatch = resourcePatch(
    name = "Spoof app version",
    description = "Reports a high app version (default 9.9.9) to prevent the in-app update prompt. " +
        "Also changes the version shown in the app's about screen.",
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
