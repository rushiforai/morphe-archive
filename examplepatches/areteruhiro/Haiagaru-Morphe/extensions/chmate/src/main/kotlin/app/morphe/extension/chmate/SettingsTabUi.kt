package app.morphe.extension.chmate

import android.app.Activity
import android.app.Application
import android.content.SharedPreferences
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Surface
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.AbstractComposeView
import androidx.compose.ui.platform.AndroidUiDispatcher
import androidx.compose.ui.unit.dp
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import androidx.lifecycle.findViewTreeLifecycleOwner
import androidx.lifecycle.setViewTreeLifecycleOwner
import androidx.savedstate.SavedStateRegistryController
import androidx.savedstate.SavedStateRegistryOwner
import androidx.savedstate.setViewTreeSavedStateRegistryOwner
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

/** The tab and standalone screen share settingsRows/BoundSettingRow and their real bindings. */
object SettingsTabUi {
    @JvmStatic fun prepareBindings(root: ViewGroup) = prepareSettingsBindings(root)
    @JvmStatic fun context(activity: Activity): android.content.Context = HaiagaruComposeActivity.dialogContext(activity)

    internal fun composeView(activity: Activity, content: @Composable () -> Unit): View = EmbeddedView(activity, content)

    @JvmStatic
    fun category(activity: Activity, source: String): View = composeView(activity) {
                val model = remember(activity, source) {
                    Haiagaru.settingsCategory(activity, source).also(::prepareSettingsBindings)
                }
                var revision by remember { mutableIntStateOf(0) }
                DisposableEffect(activity) {
                    val preferences = listOf(WacchoiSearchOptions.PREFS, "haiagaru_response_actions", ToolbarIcons.PREFS)
                        .map { activity.getSharedPreferences(it, 0) } +
                        android.preference.PreferenceManager.getDefaultSharedPreferences(activity)
                    val listener = SharedPreferences.OnSharedPreferenceChangeListener { _, _ -> revision++ }
                    preferences.forEach { it.registerOnSharedPreferenceChangeListener(listener) }
                    onDispose { preferences.forEach { it.unregisterOnSharedPreferenceChangeListener(listener) } }
                }
                @Suppress("UNUSED_VARIABLE") val invalidation = revision
                val rows = settingsRows(model)
                Surface(Modifier.fillMaxSize()) {
                    LazyColumn(Modifier.fillMaxSize().imePadding(), contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)) {
                        items(rows, key = { System.identityHashCode(it.control) }) { option ->
                            HaiagaruUi.Group { BoundSettingRow(option) { revision++ } }
                        }
                    }
                }
    }

    @JvmStatic
    fun clear(host: ViewGroup) {
        for (index in 0 until host.childCount) {
            val view = host.getChildAt(index)
            (view as? EmbeddedView)?.release()
        }
        host.removeAllViews()
    }

    /** A private recomposer must not look for isolated owners on ChMate's window root. */
    private class EmbeddedView(private val activity: Activity, private val page: @Composable () -> Unit) :
        AbstractComposeView(context(activity)) {
        private var owner: TabOwner? = null
        private var scope: CoroutineScope? = null
        private var recomposer: Recomposer? = null
        override val shouldCreateCompositionOnAttachedToWindow: Boolean get() = true
        @Composable override fun Content() { HaiagaruUi.Theme { page() } }
        override fun onAttachedToWindow() {
            val localOwner = TabOwner(activity)
            owner = localOwner
            setViewTreeLifecycleOwner(localOwner)
            setViewTreeSavedStateRegistryOwner(localOwner)
            localOwner.onViewAttachedToWindow(this)
            val localScope = CoroutineScope(AndroidUiDispatcher.Main + SupervisorJob())
            val localRecomposer = Recomposer(localScope.coroutineContext)
            scope = localScope; recomposer = localRecomposer
            setParentCompositionContext(localRecomposer)
            localScope.launch { localRecomposer.runRecomposeAndApplyChanges() }
            super.onAttachedToWindow()
        }
        override fun onDetachedFromWindow() { super.onDetachedFromWindow(); release() }
        fun release() {
            disposeComposition()
            recomposer?.cancel(); recomposer = null
            scope?.cancel(); scope = null
            owner?.close(); owner = null
            setParentCompositionContext(null)
        }
    }

    private class TabOwner(private val activity: Activity) : LifecycleOwner, SavedStateRegistryOwner,
        View.OnAttachStateChangeListener, Application.ActivityLifecycleCallbacks {
        private val registry = LifecycleRegistry(this)
        private val controller = SavedStateRegistryController.create(this)
        private var registered = false
        override val lifecycle: Lifecycle get() = registry
        override val savedStateRegistry get() = controller.savedStateRegistry
        init {
            controller.performAttach()
            controller.performRestore(null)
            registry.currentState = Lifecycle.State.CREATED
        }
        override fun onViewAttachedToWindow(view: View) {
            if (registry.currentState == Lifecycle.State.DESTROYED) return
            if (!registered) { activity.application.registerActivityLifecycleCallbacks(this); registered = true }
            registry.currentState = Lifecycle.State.RESUMED
        }
        override fun onViewDetachedFromWindow(view: View) {
            if (registry.currentState != Lifecycle.State.DESTROYED) registry.currentState = Lifecycle.State.CREATED
            unregister()
        }
        private fun unregister() {
            if (registered) { activity.application.unregisterActivityLifecycleCallbacks(this); registered = false }
        }
        fun close() { registry.currentState = Lifecycle.State.DESTROYED; unregister() }
        override fun onActivityCreated(a: Activity, state: Bundle?) = Unit
        override fun onActivityStarted(a: Activity) { if (a === activity) registry.currentState = Lifecycle.State.STARTED }
        override fun onActivityResumed(a: Activity) { if (a === activity) registry.currentState = Lifecycle.State.RESUMED }
        override fun onActivityPaused(a: Activity) { if (a === activity) registry.currentState = Lifecycle.State.STARTED }
        override fun onActivityStopped(a: Activity) { if (a === activity) registry.currentState = Lifecycle.State.CREATED }
        override fun onActivitySaveInstanceState(a: Activity, state: Bundle) = Unit
        override fun onActivityDestroyed(a: Activity) { if (a === activity) close() }
    }
}
