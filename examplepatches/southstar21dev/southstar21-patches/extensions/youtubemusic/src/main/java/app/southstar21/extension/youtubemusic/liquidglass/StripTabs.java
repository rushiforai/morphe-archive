package app.southstar21.extension.youtubemusic.liquidglass;

import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;

/**
 * YouTube Music's tabs: the bar ({@code pivot_bar}) is a Material TabLayout, whose only child is
 * the strip holding one real view per tab. TabLayout marks the selected tab with
 * {@link View#setSelected} and a click on a tab selects it, which is all the lens needs.
 * <p>
 * The lens measures tabs in the bar's coordinates. The strip fills the bar from its left edge
 * and the tabs don't scroll (fixed mode), so the tabs' own bounds are already that, as long as
 * the bar itself has no horizontal padding: the controller insets the strip instead.
 */
final class StripTabs implements Tabs {
    private final ViewGroup bar;
    private final ArrayList<View> tabs = new ArrayList<>();
    private final ArrayList<View> transformed = new ArrayList<>();

    StripTabs(ViewGroup bar) {
        this.bar = bar;
    }

    /** The strip the tabs sit in, or null before TabLayout has made it. */
    ViewGroup strip() {
        View child = bar.getChildCount() > 0 ? bar.getChildAt(0) : null;
        return child instanceof ViewGroup ? (ViewGroup) child : null;
    }

    @Override
    public List<View> views() {
        return tabs;
    }

    @Override
    public List<View> transformed() {
        return transformed;
    }

    @Override
    public void update() {
        ViewGroup strip = strip();
        int n = strip == null ? 0 : strip.getChildCount();
        // No Material ripple on the tabs: the glass lens is the press feedback. TabLayout sets
        // the ripple whenever it (re)builds a tab, so keep taking it off.
        for (int i = 0; i < n; i++) {
            View tab = strip.getChildAt(i);
            if (tab.getBackground() != null) tab.setBackground(null);
            if (tab instanceof ViewGroup && ((ViewGroup) tab).getChildCount() > 0) {
                View content = ((ViewGroup) tab).getChildAt(0);
                if (content.getBackground() instanceof android.graphics.drawable.RippleDrawable) {
                    content.setBackground(null);
                }
            }
        }
        boolean same = tabs.size() == n;
        for (int i = 0; same && i < n; i++) same = tabs.get(i) == strip.getChildAt(i);
        if (same) return;
        tabs.clear();
        for (int i = 0; i < n; i++) tabs.add(strip.getChildAt(i));
        transformed.clear();
        if (strip != null) transformed.add(strip);
    }
}
