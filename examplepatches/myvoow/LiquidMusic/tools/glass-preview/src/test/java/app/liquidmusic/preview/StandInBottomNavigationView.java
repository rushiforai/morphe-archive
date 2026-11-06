/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.preview;

import android.content.Context;
import android.view.Menu;
import android.widget.FrameLayout;
import android.widget.PopupMenu;

/**
 * Stand-in for Apple Music's BottomNavigationView: the three public methods the liquid tab bar
 * calls (they keep these names in the obfuscated app, see docs/apple-music-7.0.0-beta.md).
 */
public class StandInBottomNavigationView extends FrameLayout {
    private final Menu menu;
    private int selectedItemId;
    /** Ids passed to setSelectedItemId, in order. */
    public final java.util.List<Integer> selections = new java.util.ArrayList<>();

    public StandInBottomNavigationView(Context context) {
        super(context);
        menu = new PopupMenu(context, this).getMenu();
    }

    public Menu getMenu() {
        return menu;
    }

    public int getSelectedItemId() {
        return selectedItemId;
    }

    public void setSelectedItemId(int itemId) {
        selections.add(itemId);
        selectedItemId = itemId;
    }
}
