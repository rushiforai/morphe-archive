package app.morphe.patches.bongobdandroidtv.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.bongobdandroidtv.shared.morphe.saas.ott.smarttv.MainApplication
import app.morphe.patches.bongobdandroidtv.shared.morphe.saas.ott.smarttv.ui.splash.view.SplashActivity

internal val bongobdandroidtvActivityOnCreateHook =
    activityOnCreateExtensionHook(SplashActivity.toString(), true)

internal val bongobdandroidtvApplicationOnCreateHook =
    activityOnCreateExtensionHook(MainApplication.toString(), false)
