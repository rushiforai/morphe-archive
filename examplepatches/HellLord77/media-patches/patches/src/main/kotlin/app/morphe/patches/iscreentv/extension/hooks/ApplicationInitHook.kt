package app.morphe.patches.iscreentv.extension.hooks

import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val iscreentvActivityOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/rockstreamer/iscreentv/activity/SplashActivity;",
    targetBundleMethod = true,
)

internal val iscreentvApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/rockstreamer/iscreentv/utils/App;",
    targetBundleMethod = false,
)
