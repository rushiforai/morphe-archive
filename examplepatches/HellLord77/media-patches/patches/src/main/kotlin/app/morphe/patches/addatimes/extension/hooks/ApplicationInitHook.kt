package app.morphe.patches.addatimes.extension.hooks

import app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes.AddaTimesApp
import app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes.Hilt_AddatimesTvApp
import app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes.base.BaseActivity
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal val addatimesActivityOnCreateHook =
    activityOnCreateExtensionHook(BaseActivity.toString(), true)
internal val addatimesApplicationOnCreateHook =
    activityOnCreateExtensionHook(AddaTimesApp.toString(), false)

internal val addatimesTvActivityOnCreateHook =
    activityOnCreateExtensionHook(BaseActivity.toString(), true)
internal val addatimesTvApplicationOnCreateHook =
    activityOnCreateExtensionHook(Hilt_AddatimesTvApp.toString(), false)
