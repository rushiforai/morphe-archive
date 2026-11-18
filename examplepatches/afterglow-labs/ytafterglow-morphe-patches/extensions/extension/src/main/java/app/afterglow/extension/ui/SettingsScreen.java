package app.afterglow.extension.ui;

import android.view.View;
import android.widget.LinearLayout;

/** One screen on the settings navigation stack hosted by {@link AfterglowActivity}. */
abstract class SettingsScreen {
    /** Scroll position remembered while another screen is on top (restored on back). */
    int scrollY;

    abstract String title();

    /** Optional view pinned above the scrolling content (the search field). */
    View pinnedHeader() {
        return null;
    }

    /** Fills the scrolling content. Called on push, back, and every preference change. */
    abstract void build(LinearLayout content);

    /** Called after the screen has been rendered on top of the stack. */
    void onShown() {}

    /** Return true when the screen handles back itself, e.g. an unsaved editor draft. */
    boolean onBack() { return false; }

    /** True for screens that iOS builds as UIKit inset-grouped tables (search, tab editor). */
    boolean grouped() {
        return false;
    }

    /** True while the user is mid-gesture; refreshes wait until it ends (tab editor drag). */
    boolean isBusy() {
        return false;
    }
}
