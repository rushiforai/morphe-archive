package app.morphe.patches.all.misc.ui

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val addToHomeScreen = resourcePatch(
    name = "Add to Home screen",
    description = "Adds the app to the home screen, allowing to launch main activity.",
    default = false
) {
    val launcher = booleanOption(key = "launcher", default = true, title = "Phone")
    val leanbackLauncher = booleanOption(key = "leanbackLauncher", default = true, title = "TV")

    dependsOn(addToHomeScreenPatch(launcher.value!!, leanbackLauncher.value!!))
}