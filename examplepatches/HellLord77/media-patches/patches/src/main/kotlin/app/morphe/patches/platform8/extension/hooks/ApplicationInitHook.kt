package app.morphe.patches.platform8.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val platform8ActivityOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Lcom/digivive/nexgtv/activities/SplashActivity;",
        targetBundleMethod = true,
    )

internal val platform8ApplicationOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Lcom/digivive/nexgtv/application/NexgTvApplication;",
    )
