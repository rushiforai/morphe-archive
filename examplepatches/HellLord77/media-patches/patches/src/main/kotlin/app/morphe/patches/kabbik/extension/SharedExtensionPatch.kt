package app.morphe.patches.kabbik.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.kabbik.extension.hooks.kabbikActivityOnCreateHook
import app.morphe.patches.kabbik.extension.hooks.kabbikApplicationOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("kabbik"),
    kabbikActivityOnCreateHook,
    kabbikApplicationOnCreateHook,
)