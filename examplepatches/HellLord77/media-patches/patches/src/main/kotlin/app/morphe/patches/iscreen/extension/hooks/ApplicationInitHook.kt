package app.morphe.patches.iscreen.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val iscreenActivityOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/rockstreamer/iscreen/activities/SplashScreen;",
    targetBundleMethod = true,
)

internal val iscreenApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/rockstreamer/iscreen/App;",
    targetBundleMethod = false,
)
