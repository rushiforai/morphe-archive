package app.morphe.patches.bongobdandroidtv.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val bongobdandroidtvActivityOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Lsaas/ott/smarttv/ui/splash/view/SplashActivity;",
        targetBundleMethod = true,
    )

internal val bongobdandroidtvApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lsaas/ott/smarttv/MainApplication;",
    targetBundleMethod = false,
)
