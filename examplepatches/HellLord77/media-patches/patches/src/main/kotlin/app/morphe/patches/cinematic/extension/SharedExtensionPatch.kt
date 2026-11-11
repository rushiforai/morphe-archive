package app.morphe.patches.cinematic.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.cinematic.extension.hooks.cinematicActivityOnCreateHook
import app.morphe.patches.cinematic.extension.hooks.cinematicApplicationOnCreateHook

val sharedExtensionPatch =
    sharedExtensionPatch(
        listOf("cinematic"),
        cinematicActivityOnCreateHook,
        cinematicApplicationOnCreateHook,
    )
