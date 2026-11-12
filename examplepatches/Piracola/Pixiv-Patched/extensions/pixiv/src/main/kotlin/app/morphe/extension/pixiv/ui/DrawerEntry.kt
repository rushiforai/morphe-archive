package app.morphe.extension.pixiv.ui

import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewParent
import java.lang.ref.WeakReference

/**
 * Adds the Pixiv-Patched item to the app's home drawer.
 *
 * The drawer is a Material NavigationView, so its menu can be extended at runtime; the click is
 * picked up in the presenter, because the app's own selection listener is devirtualised into a
 * concrete lambda class and cannot be wrapped.
 */
object DrawerEntry {

    private const val ITEM_ID = 0x50565850

    /** Pixiv's screens slide in from the right while the drawer is still closing; ours overlaps the same way. */
    private const val DRAWER_CLOSE_MILLIS = 120L

    private var host: WeakReference<View>? = null

    @JvmStatic
    fun install(navigationView: Any?) {
        try {
            val view = navigationView as? View ?: return
            val menu = view.javaClass.getMethod("getMenu").invoke(view) as? Menu ?: return
            host = WeakReference(view)
            if (contains(menu, ITEM_ID)) return

            // Pixiv splits its drawer into collapsible groups and the last one holds the entries
            // that have nothing to do with the account - mute settings, language, and so on. An
            // item added to the root would sit outside every group and lose the indentation, the
            // divider behaviour and the collapse animation the grouped rows get for free.
            val target = lastGroup(menu) ?: menu
            target.add(Menu.NONE, ITEM_ID, Menu.NONE, Strings.pageTitle)
                .setIcon(Icons.patchedFeatures())
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onItemClicked(item: MenuItem?) {
        if (item == null || item.itemId != ITEM_ID) return
        val view = host?.get()
        closeDrawer(view)
        if (view == null) {
            PatchedSettings.show(null)
        } else {
            view.postDelayed({ PatchedSettings.show(view) }, DRAWER_CLOSE_MILLIS)
        }
    }

    private fun contains(menu: Menu, itemId: Int): Boolean {
        if (menu.findItem(itemId) != null) return true
        for (index in 0 until menu.size()) {
            val subMenu = menu.getItem(index).subMenu ?: continue
            if (contains(subMenu, itemId)) return true
        }
        return false
    }

    private fun lastGroup(menu: Menu): Menu? {
        var group: Menu? = null
        for (index in 0 until menu.size()) {
            val subMenu = menu.getItem(index).subMenu ?: continue
            if (subMenu.size() >= 2) group = subMenu
        }
        return group
    }

    /**
     * Native rows close the drawer before the next screen appears; without this the patched page
     * would open on top of an open drawer and show a different animation than every other row.
     */
    private fun closeDrawer(view: View?) {
        var parent: ViewParent? = view?.parent
        while (parent != null) {
            if (parent.javaClass.name.endsWith("DrawerLayout")) {
                try {
                    parent.javaClass.getMethod("closeDrawers").invoke(parent)
                } catch (_: Throwable) {
                }
                return
            }
            parent = parent.parent
        }
    }
}
