package app.morphe.extension.pixiv.ui

import android.view.Menu
import android.view.MenuItem
import android.view.View
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

    private var host: WeakReference<View>? = null

    @JvmStatic
    fun install(navigationView: Any?) {
        try {
            val view = navigationView as? View ?: return
            val menu = view.javaClass.getMethod("getMenu").invoke(view) as? Menu ?: return
            host = WeakReference(view)
            if (menu.findItem(ITEM_ID) == null) {
                menu.add(Menu.NONE, ITEM_ID, 0, Strings.pageTitle)
                    .setIcon(android.R.drawable.ic_menu_manage)
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onItemClicked(item: MenuItem?) {
        if (item == null || item.itemId != ITEM_ID) return
        PatchedSettings.show(host?.get())
    }
}
