package io.github.henr1klmb.patches.netmirror

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import java.io.File

@Suppress("unused")
val customIconPatch = patch(
    name = "Custom icon",
    description = "Changes the app name and optionally replaces the launcher icon.",
) {
    compatibleWith(NETMIRROR_COMPATIBILITY)

    val customAppName by stringOption(
        key = "customAppName",
        default = "NetMirror",
        title = "App name",
        description = "Custom name displayed on the home screen.",
    )

    val customIconPath by stringOption(
        key = "customIconPath",
        default = "",
        title = "Custom icon PNG path (optional)",
        description = "Absolute path to a square PNG file to replace all launcher icons.",
    )

    execute {
        customAppName?.let { name ->
            resourceXml("res/values/strings.xml").use { strings ->
                strings.resourceOrNull("app_name")?.text = name
            }
        }

        val iconPath = customIconPath?.trim().orEmpty()
        if (iconPath.isNotEmpty()) {
            val sourceIcon = File(iconPath)
            require(sourceIcon.exists() && sourceIcon.isFile) {
                "Custom icon file not found at: $iconPath"
            }

            val densities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")
            val iconFiles = listOf(
                "ic_launcher.png",
                "ic_launcher_foreground.png",
                "ic_launcher_round.png",
            )

            for (density in densities) {
                for (iconFile in iconFiles) {
                    val target = resourceFile("res/mipmap-$density/$iconFile")
                    if (target.exists()) {
                        sourceIcon.copyTo(target, overwrite = true)
                    }
                }
            }
        }
    }
}
