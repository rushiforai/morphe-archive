package de.mm20.launcher2.ui.launcher.scaffold.components

import androidx.compose.runtime.MutableState

open class ScaffoldComponent

class WidgetsComponent : ScaffoldComponent() {
    val penguinEditRequest: MutableState<Boolean> get() = error("compile-only stub")
}

class ClockAndWidgetsHomeComponent : ScaffoldComponent() {
    fun setEditMode(editMode: Boolean): Unit = error("compile-only stub")
}
