package app.morphe.extension.chmate

import android.app.Activity
import android.view.View

object ToolScreenUi {
    @JvmStatic fun archive(activity: Activity, model: android.widget.LinearLayout, back: Runnable): View =
        archive(activity, model, back, true, false)
    @JvmStatic fun archive(activity: Activity, model: android.widget.LinearLayout, back: Runnable,
                           showTopBar: Boolean, embedded: Boolean): View =
        SettingsTabUi.composeView(activity) { ArchiveSearchScreen(activity, model, { back.run() }, showTopBar, embedded) }
    @JvmStatic fun model(activity: Activity, title: String, model: View, back: Runnable): View =
        model(activity, title, model, back, true)
    @JvmStatic fun model(activity: Activity, title: String, model: View, back: Runnable,
                         showTopBar: Boolean): View =
        model(activity, title, model, back, showTopBar, false)
    @JvmStatic fun model(activity: Activity, title: String, model: View, back: Runnable,
                         showTopBar: Boolean, embedded: Boolean): View =
        SettingsTabUi.composeView(activity) { ModelScreen(activity, title, model, { back.run() }, showTopBar, embedded) }
}
