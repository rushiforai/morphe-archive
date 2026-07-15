package app.utsavrajput.extension

import android.content.Context

/**
 * Plain-framework system bar height lookup (no androidx WindowInsetsCompat
 * dependency — keeps this module dependency-light and avoids any risk of
 * class-loading surprises against MX Player's host classloader).
 *
 * Used to pad our custom screens' title bar (status bar) and bottom nav
 * (navigation bar / gesture area) so they sit exactly where MX Player's
 * own edge-to-edge screens do, instead of a fixed guess that drifts on
 * devices with different system bar sizes (3-button nav vs gesture nav,
 * notch/punch-hole status bars, etc).
 */
object Insets {

    @JvmStatic
    fun statusBarHeight(context: Context): Int {
        val id = context.resources.getIdentifier("status_bar_height", "dimen", "android")
        return if (id > 0) context.resources.getDimensionPixelSize(id) else 0
    }

    @JvmStatic
    fun navigationBarHeight(context: Context): Int {
        val id = context.resources.getIdentifier("navigation_bar_height", "dimen", "android")
        return if (id > 0) context.resources.getDimensionPixelSize(id) else 0
    }
}
