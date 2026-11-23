package app.zonghome.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import java.util.Map;
import java.util.WeakHashMap;

/** Manual visibility: does not react to list touch or scroll callbacks. */
final class BundleControls {
    private static final WeakHashMap<View, State> STATES = new WeakHashMap<>();
    private static State state(View root) {
        View window = root.getRootView();
        State result = STATES.get(window);
        if (result == null) {
            result = new State(window.getContext().getApplicationContext());
            STATES.put(window, result);
        }
        return result;
    }
    static boolean hidden(View root) { return state(root).hidden; }
    static void toggle(View root) {
        State state = state(root);
        state.hidden = !state.hidden;
        state.preferences.edit().putBoolean("bundleControlsHidden", state.hidden).apply();
        apply(root);
    }
    static boolean apply(View root) {
        State state = state(root);
        if (!state.hidden) {
            boolean changed = false;
            for (Map.Entry<View, Integer> entry : state.original.entrySet()) {
                View view = entry.getKey();
                if (view != null && view.getVisibility() != entry.getValue()) {
                    view.setVisibility(entry.getValue());
                    changed = true;
                }
            }
            state.original.clear();
            return changed;
        }
        boolean changed = state.hide(ViewNames.find(root, "cardViewBundleMain"));
        View pages = ViewNames.find(root, "viewPager2");
        if (pages != null) changed |= hidePageControls(pages, state);
        return changed;
    }
    private static boolean hidePageControls(View node, State state) {
        String name = ViewNames.name(node);
        if (name.equals("view_validity") || name.equals("filterView")) return state.hide(node);
        if (name.equals("mainLayout")) {
            boolean changed = state.hide(ViewNames.find(node, "view_validity"));
            return state.hide(ViewNames.find(node, "filterView")) | changed;
        }
        // Stop before offer rows: only the small pager/page hierarchy is inspected.
        if (name.equals("recyclerBundle")) return false;
        boolean changed = false;
        if (node instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)node;
            for (int i = 0; i < group.getChildCount(); i++)
                changed |= hidePageControls(group.getChildAt(i), state);
        }
        return changed;
    }
    private static final class State {
        final SharedPreferences preferences;
        final WeakHashMap<View, Integer> original = new WeakHashMap<>();
        boolean hidden;
        State(Context context) {
            preferences = context.getSharedPreferences("zonghome_ui", Context.MODE_PRIVATE);
            hidden = preferences.getBoolean("bundleControlsHidden", false);
        }
        boolean hide(View view) {
            if (view == null || view.getVisibility() == View.GONE) return false;
            if (!original.containsKey(view)) original.put(view, view.getVisibility());
            view.setVisibility(View.GONE);
            return true;
        }
    }
}
