package app.morphe.extension.chmate

import android.app.Activity
import android.view.View

object ToolScreenUi {
    @JvmStatic fun archive(activity: Activity, model: android.widget.LinearLayout, back: Runnable): View =
        SettingsTabUi.composeView(activity) { ArchiveSearchScreen(activity, model) { back.run() } }
    @JvmStatic fun model(activity: Activity, title: String, model: View, back: Runnable): View =
        model(activity, title, model, back, true)
    @JvmStatic fun model(activity: Activity, title: String, model: View, back: Runnable,
                         showTopBar: Boolean): View =
        SettingsTabUi.composeView(activity) { ModelScreen(activity, title, model, { back.run() }, showTopBar) }
}
