package app.morphe.patches.kabbik.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.kabbik.shared.morphe.com.kabbik.app.KabbikApplication

internal val kabbikActivityOnCreateHook = activityOnCreateExtensionHook()

internal val kabbikApplicationOnCreateHook =
    activityOnCreateExtensionHook(activityClassType = KabbikApplication.toString())
