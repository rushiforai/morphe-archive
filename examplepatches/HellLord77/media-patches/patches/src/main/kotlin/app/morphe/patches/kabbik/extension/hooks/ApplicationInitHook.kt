package app.morphe.patches.kabbik.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val kabbikActivityOnCreateHook = activityOnCreateExtensionHook()

internal val kabbikApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/kabbik/app/KabbikApplication;"
)
