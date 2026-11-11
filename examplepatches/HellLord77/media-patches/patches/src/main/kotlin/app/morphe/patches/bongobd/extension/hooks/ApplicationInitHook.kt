package app.morphe.patches.bongobd.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.bongobd.shared.moprhe.com.bongo.ottandroidbuildvariant.MainApplication
import app.morphe.patches.bongobd.shared.moprhe.com.bongo.ottandroidbuildvariant.splash.view.SplashActivity

internal val bongobdActivityOnCreateHook =
    activityOnCreateExtensionHook(SplashActivity.toString(), true)

internal val bongobdApplicationOnCreateHook =
    activityOnCreateExtensionHook(MainApplication.toString(), false)
