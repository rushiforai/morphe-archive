package app.morphe.patches.cinematic.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.cinematic.shared.morphe.net.live.ent.cinematic.app.CinematicApp
import app.morphe.patches.cinematic.shared.morphe.net.live.ent.cinematic.features.HomeActivity

internal val cinematicActivityOnCreateHook =
    activityOnCreateExtensionHook(HomeActivity.toString(), true)

internal val cinematicApplicationOnCreateHook =
    activityOnCreateExtensionHook(CinematicApp.toString(), false)
