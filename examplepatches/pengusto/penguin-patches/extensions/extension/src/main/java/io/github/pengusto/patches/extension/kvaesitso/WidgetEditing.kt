/*
 * GPL-3.0-or-later. Navigation and menu behavior derived from Kvaesitso
 * v1.41.0 by MM2-0 and contributors. See NOTICE and docs/KVAESITSO.md.
 */
package io.github.pengusto.patches.extension.kvaesitso

import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3ExpressiveApi
import androidx.compose.material3.Icon
import androidx.compose.material3.MenuDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import de.mm20.launcher2.preferences.ui.UiSettings
import de.mm20.launcher2.ui.R
import de.mm20.launcher2.ui.launcher.scaffold.Gesture
import de.mm20.launcher2.ui.launcher.scaffold.LauncherScaffoldState
import de.mm20.launcher2.ui.launcher.scaffold.components.ClockAndWidgetsHomeComponent
import de.mm20.launcher2.ui.launcher.scaffold.components.ScaffoldComponent
import de.mm20.launcher2.ui.launcher.scaffold.components.WidgetsComponent
import java.lang.ref.WeakReference
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3ExpressiveApi::class)
object WidgetEditing {
    private var state = WeakReference<LauncherScaffoldState>(null)
    private var scope = WeakReference<CoroutineScope>(null)
    private val editButton = mutableStateOf<Boolean?>(null)
    private var settingsJob: Job? = null
    private val settingsScope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)

    @JvmStatic
    fun newEditRequest(): MutableState<Boolean> = mutableStateOf(false)

    @JvmStatic
    fun bind(scaffold: LauncherScaffoldState, compositionScope: CoroutineScope) {
        state = WeakReference(scaffold)
        scope = WeakReference(compositionScope)
    }

    @JvmStatic
    fun observeSettings(settings: UiSettings) {
        settingsJob?.cancel()
        editButton.value = null
        settingsJob = settingsScope.launch {
            settings.widgetEditButton.collect { editButton.value = it }
        }
    }

    private fun ScaffoldComponent.isWidgetPage() =
        this is WidgetsComponent || this is ClockAndWidgetsHomeComponent

    private fun target(scaffold: LauncherScaffoldState): Pair<ScaffoldComponent, Gesture?>? {
        if (scaffold.isSettledOnSecondaryPage) {
            scaffold.currentComponent?.takeIf { it.isWidgetPage() }?.let {
                return it to scaffold.currentGesture
            }
        }
        val config = scaffold.penguinConfig
        if (config.homeComponent.isWidgetPage()) return config.homeComponent to null
        val destinations = arrayOf(
            Gesture.SwipeUp to config.swipeUp, Gesture.SwipeDown to config.swipeDown,
            Gesture.SwipeLeft to config.swipeLeft, Gesture.SwipeRight to config.swipeRight,
            Gesture.DoubleTap to config.doubleTap, Gesture.LongPress to config.longPress,
            Gesture.HomeButton to config.homeButton,
        )
        return destinations.firstNotNullOfOrNull { (gesture, destination) ->
            destination?.component?.takeIf { it.isWidgetPage() }?.let { it to gesture }
        }
    }

    private fun canEdit(): Boolean = editButton.value == false &&
        scope.get() != null && state.get()?.let { target(it) != null } == true

    @JvmStatic
    @Composable
    fun MenuItem(showMenu: MutableState<Boolean>) {
        if (canEdit()) {
            DropdownMenuItem(
                shape = MenuDefaults.leadingItemShape,
                onClick = {
                    showMenu.value = false
                    val scaffold = state.get()
                    val compositionScope = scope.get()
                    if (scaffold != null && compositionScope != null) {
                        compositionScope.launch { edit(scaffold) }
                    }
                },
                text = { Text(stringResource(R.string.menu_edit_widgets)) },
                leadingIcon = { Icon(painterResource(R.drawable.edit_20px), null) },
            )
        }
    }

    @JvmStatic
    @Composable
    fun WallpaperShape(): Shape =
        if (canEdit()) MenuDefaults.middleItemShape else MenuDefaults.leadingItemShape

    private suspend fun edit(scaffold: LauncherScaffoldState) {
        val (component, gesture) = target(scaffold) ?: return
        scaffold.isSearchBarFocused = false
        if (gesture == null) {
            scaffold.navigateBack(false)
        } else if (!scaffold.isSettledOnSecondaryPage || scaffold.currentGesture != gesture) {
            scaffold.navigateBack(false)
            when (gesture) {
                Gesture.DoubleTap, Gesture.LongPress, Gesture.HomeButton -> scaffold.performTapGesture(gesture)
                else -> scaffold.navigateToPage(gesture)
            }
        }
        when (component) {
            is WidgetsComponent -> component.penguinEditRequest.value = true
            is ClockAndWidgetsHomeComponent -> component.setEditMode(true)
        }
        scaffold.lock(true)
    }

    @JvmStatic
    @Composable
    fun ObserveEditRequest(component: WidgetsComponent, editMode: MutableState<Boolean>) {
        val request = component.penguinEditRequest
        LaunchedEffect(request.value) {
            if (request.value) {
                editMode.value = true
                request.value = false
            }
        }
    }
}
