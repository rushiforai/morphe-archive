package app.morphe.patches.hoichoi.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.hoichoi.extension.hooks.hoichoiActivityOnCreateHook
import app.morphe.patches.hoichoi.extension.hooks.hoichoiApplicationOnCreateHook
import app.morphe.patches.hoichoi.extension.hooks.hoichoitvActivityOnCreateHook
import app.morphe.patches.hoichoi.extension.hooks.hoichoitvApplicationOnCreateHook

val sharedExtensionPatch =
    sharedExtensionPatch(
        listOf("hoichoi"),
        hoichoiActivityOnCreateHook,
        hoichoiApplicationOnCreateHook,
    )

val sharedExtensionPatchTv =
    sharedExtensionPatch(
        listOf("hoichoi"),
        hoichoitvActivityOnCreateHook,
        hoichoitvApplicationOnCreateHook,
    )
