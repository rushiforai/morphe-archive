package app.morphe.patches.platform8tv.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val platform8tvActivityOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Ldigivive/platform8/androidtv/home/Splash;",
        targetBundleMethod = true,
    )

internal val platform8tvApplicationOnCreateHook =
    activityOnCreateExtensionHook(
        activityClassType = "Ldigivive/platform8/androidtv/application/NexgTvApplication;",
    )
