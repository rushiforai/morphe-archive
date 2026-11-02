package app.morphe.patches.all.manifest.appicon

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val showAppIcon =
    resourcePatch(
        name = "Show app icon",
        description = "Shows the app icon in the Android launcher.",
        default = false,
    ) {
        val showInLauncherOption =
            booleanOption(
                key = "showInLauncher",
                default = true,
                title = "Show in phone launcher",
                description = "Should be displayed in the top-level launcher.",
            )
        val showInLeanbackLauncherOption =
            booleanOption(
                key = "showInLeanbackLauncher",
                default = true,
                title = "Show in TV launcher",
                description = "Should be displayed in the Leanback launcher.",
            )

        dependsOn(
            showAppIconPatch(
                showInLauncherOption.value!!,
                showInLeanbackLauncherOption.value!!,
            ),
        )
    }
