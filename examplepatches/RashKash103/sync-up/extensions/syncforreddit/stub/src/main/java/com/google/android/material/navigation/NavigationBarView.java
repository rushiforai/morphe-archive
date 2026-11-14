package com.google.android.material.navigation;

import android.content.Context;
import android.view.Menu;
import android.widget.FrameLayout;

import com.google.android.material.badge.BadgeDrawable;

/**
 * The base of both of Sync's navigation bars — the bottom bar and the tablet rail. Material
 * keeps its package and class name, since the layouts name the subclasses, but not its members:
 * {@code getMenu()} is {@code g()} in the app.
 *
 * <p>Declared {@code public abstract} to match the app, where it is the same, so that a call
 * reaching it is the virtual call the dex expects rather than an interface one.
 *
 * <p>Compile only.
 */
public abstract class NavigationBarView extends FrameLayout {
    public NavigationBarView(Context context) {
        super(context);
    }

    /** {@code getMenu()}. The items are what the bar draws, one button each. */
    public Menu g() {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * {@code getMaxItemCount()}. Five on the bottom bar, seven on the rail, and the count
     * includes the items the bar is not drawing: what is checked when one is added is
     * {@code menu.size()}, so taking an item off does not make room for another.
     */
    public int f() {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * {@code getOrCreateBadge(int)}. Answers for an item the bar is not drawing as readily as
     * for one it is — the badge is simply attached to nothing — so it never has to be guarded
     * on whether the item is there.
     */
    public BadgeDrawable k(int itemId) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code removeBadge(int)}. Does nothing where there is no badge. */
    public void o(int itemId) {
        throw new UnsupportedOperationException("Stub");
    }
}
