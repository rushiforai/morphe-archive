package app.morphe.patches.bongobd.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val bongobdActivityOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Lcom/bongo/ottandroidbuildvariant/splash/view/SplashActivity;",
        targetBundleMethod = true,
    )

internal val bongobdApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/bongo/ottandroidbuildvariant/MainApplication;",
    targetBundleMethod = false,
)
