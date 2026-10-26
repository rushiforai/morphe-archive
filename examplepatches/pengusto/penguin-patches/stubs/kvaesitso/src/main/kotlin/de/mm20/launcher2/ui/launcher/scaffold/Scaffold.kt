@file:Suppress("UNUSED_PARAMETER")

package de.mm20.launcher2.ui.launcher.scaffold

import de.mm20.launcher2.ui.launcher.scaffold.components.ScaffoldComponent

// Compile-only signatures from Kvaesitso v1.41.0 (GPL-3.0-or-later).
enum class Gesture { SwipeUp, SwipeDown, SwipeLeft, SwipeRight, DoubleTap, LongPress, TapSearchBar, HomeButton }

class ScaffoldGesture {
    val component: ScaffoldComponent get() = error("compile-only stub")
}

class ScaffoldConfiguration {
    val homeComponent: ScaffoldComponent get() = error("compile-only stub")
    val swipeUp: ScaffoldGesture? get() = error("compile-only stub")
    val swipeDown: ScaffoldGesture? get() = error("compile-only stub")
    val swipeLeft: ScaffoldGesture? get() = error("compile-only stub")
    val swipeRight: ScaffoldGesture? get() = error("compile-only stub")
    val doubleTap: ScaffoldGesture? get() = error("compile-only stub")
    val longPress: ScaffoldGesture? get() = error("compile-only stub")
    val searchBarTap: ScaffoldGesture get() = error("compile-only stub")
    val homeButton: ScaffoldGesture? get() = error("compile-only stub")
}

class LauncherScaffoldState {
    val penguinConfig: ScaffoldConfiguration get() = error("compile-only stub")
    val isSettledOnSecondaryPage: Boolean get() = error("compile-only stub")
    val currentComponent: ScaffoldComponent? get() = error("compile-only stub")
    val currentGesture: Gesture? get() = error("compile-only stub")
    var isSearchBarFocused: Boolean
        get() = error("compile-only stub")
        set(value) { error("compile-only stub") }
    suspend fun navigateBack(fast: Boolean): Unit = error("compile-only stub")
    suspend fun navigateToPage(gesture: Gesture): Unit = error("compile-only stub")
    suspend fun performTapGesture(gesture: Gesture): Unit = error("compile-only stub")
    suspend fun lock(hideSearchBar: Boolean): Unit = error("compile-only stub")
}
