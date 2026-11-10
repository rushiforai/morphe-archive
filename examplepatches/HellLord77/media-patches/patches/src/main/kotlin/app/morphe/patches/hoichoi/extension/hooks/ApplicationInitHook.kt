package app.morphe.patches.hoichoi.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.hoichoi.shared.morphe.com.viewlift.hoichoi.App
import app.morphe.patches.hoichoi.shared.morphe.com.viewlift.hoichoi.HoichoiApplication
import app.morphe.patches.hoichoi.shared.morphe.com.viewlift.hoichoi.HoichoiDashboardActivity
import app.morphe.patches.hoichoi.shared.morphe.com.viewlift.hoichoi.ui.splash.MainActivity

internal val hoichoiActivityOnCreateHook =
    activityOnCreateExtensionHook(HoichoiDashboardActivity.toString(), true)
internal val hoichoiApplicationOnCreateHook =
    activityOnCreateExtensionHook(HoichoiApplication.toString(), false)

internal val hoichoitvActivityOnCreateHook =
    activityOnCreateExtensionHook(MainActivity.toString(), true)
internal val hoichoitvApplicationOnCreateHook = activityOnCreateExtensionHook(App.toString(), false)
