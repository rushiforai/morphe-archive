package app.saketh.extension.navigation;

import android.app.Activity;
import android.view.View;
import app.saketh.extension.controls.PatchSettings;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

public final class NavigationHooks {
    private static final WeakHashMap<Activity, WeakReference<State>> STATES = new WeakHashMap<>();

    private NavigationHooks() {}

    public static List<String> order() {
        String saved;
        try { saved = PatchSettings.preferences().getString(NavigationPolicy.ORDER, null); }
        catch (ClassCastException malformed) { saved = null; }
        return NavigationPolicy.order(saved);
    }

    public static Set<String> hidden() {
        Set<String> saved;
        try { saved = PatchSettings.preferences().getStringSet(NavigationPolicy.HIDDEN, null); }
        catch (ClassCastException malformed) { saved = null; }
        return NavigationPolicy.hidden(saved);
    }

    /** Restore only our own hides before WebNovel recomputes language/server availability. */
    public static void beforeNative(Activity activity) {
        State state = state(activity);
        if (state != null) state.restoreHides();
    }

    public static void afterNative(Activity activity) {
        State state = state(activity);
        if (state != null) {
            state.captureNative();
            state.apply();
        }
    }

    public static void resume(Activity activity) {
        State state = state(activity);
        if (state != null) state.apply();
    }

    public static int startTab(int nativeScreen) {
        return NavigationPolicy.startTab(nativeScreen, hidden());
    }

    private static State state(Activity activity) {
        PatchSettings.initialize(activity);
        WeakReference<State> saved = STATES.get(activity);
        State state = saved == null ? null : saved.get();
        if (state != null) return state;
        View bottom = find(activity, "llBottomNav"), promotion = find(activity, "bottomActivityImage");
        if (bottom == null || promotion == null || bottom.getParent() != promotion.getParent()) return null;
        List<String> stock = NavigationPolicy.order(null);
        View[] tabs = new View[stock.size()];
        for (int i = 0; i < tabs.length; i++) {
            tabs[i] = find(activity, stock.get(i));
            if (tabs[i] == null || tabs[i].getParent() != bottom) return null;
        }
        state = new State(bottom, promotion, tabs, stock);
        STATES.put(activity, new WeakReference<>(state));
        return state;
    }

    private static View find(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    // MainNavigationPatch replaces this declaration with verified DEX field access, not JNI/reflection.
    private static native void link(View tab, int previous, int next);

    private static final class State implements View.OnLayoutChangeListener {
        final View bottom, promotion;
        final View[] tabs;
        final List<String> stock;
        final int[] nativeVisibility;
        final boolean[] hiddenByPatch;
        final float promotionTranslation;
        List<String> appliedOrder;
        Set<String> appliedHidden;
        int promotionVisibility = -1;
        boolean nativeChanged = true;

        State(View bottom, View promotion, View[] tabs, List<String> stock) {
            this.bottom = bottom;
            this.promotion = promotion;
            this.tabs = tabs;
            this.stock = stock;
            nativeVisibility = new int[tabs.length];
            hiddenByPatch = new boolean[tabs.length];
            appliedOrder = stock;
            promotionTranslation = promotion.getTranslationX();
            captureNative();
            // Listeners retain state with its views; static references and Activity keys stay weak.
            tabs[2].addOnLayoutChangeListener(this);
            bottom.addOnLayoutChangeListener(this);
            promotion.addOnLayoutChangeListener(this);
        }

        void restoreHides() {
            for (int i = 0; i < tabs.length; i++) {
                if (hiddenByPatch[i]) tabs[i].setVisibility(nativeVisibility[i]);
                hiddenByPatch[i] = false;
            }
        }

        void captureNative() {
            for (int i = 0; i < tabs.length; i++) nativeVisibility[i] = tabs[i].getVisibility();
            nativeChanged = true;
        }

        void apply() {
            List<String> order = order();
            Set<String> hidden = hidden();
            boolean reordered = !order.equals(appliedOrder);
            if (!reordered && hidden.equals(appliedHidden) && !nativeChanged
                    && promotionVisibility == promotion.getVisibility()) {
                alignPromotion();
                return;
            }
            List<View> accessible = new ArrayList<>(tabs.length);
            for (int position = 0; position < order.size(); position++) {
                String key = order.get(position);
                int index = stock.indexOf(key);
                View tab = tabs[index];
                int visibility = NavigationPolicy.visibility(key, nativeVisibility[index], hidden);
                hiddenByPatch[index] = visibility != nativeVisibility[index];
                if (tab.getVisibility() != visibility) tab.setVisibility(visibility);
                if (reordered) {
                    int previous = position == 0 ? 0 : tabs[stock.indexOf(order.get(position - 1))].getId();
                    int next = position == order.size() - 1 ? 0 : tabs[stock.indexOf(order.get(position + 1))].getId();
                    link(tab, previous, next);
                }
                tab.setAccessibilityTraversalBefore(View.NO_ID);
                tab.setAccessibilityTraversalAfter(View.NO_ID);
                tab.setNextFocusForwardId(View.NO_ID);
                if (visibility == View.VISIBLE) accessible.add(tab);
                else if (index == 2 && visibility == View.INVISIBLE && promotion.getVisibility() == View.VISIBLE) {
                    accessible.add(promotion);
                }
            }
            promotion.setAccessibilityTraversalBefore(View.NO_ID);
            promotion.setAccessibilityTraversalAfter(View.NO_ID);
            promotion.setNextFocusForwardId(View.NO_ID);
            for (int i = 0; i < accessible.size(); i++) {
                View view = accessible.get(i);
                if (i > 0) view.setAccessibilityTraversalAfter(accessible.get(i - 1).getId());
                if (i + 1 < accessible.size()) {
                    int next = accessible.get(i + 1).getId();
                    view.setAccessibilityTraversalBefore(next);
                    view.setNextFocusForwardId(next);
                }
            }
            appliedOrder = order;
            appliedHidden = hidden;
            promotionVisibility = promotion.getVisibility();
            nativeChanged = false;
            alignPromotion();
        }

        private void alignPromotion() {
            float translation = promotionTranslation;
            if (nativeVisibility[2] == View.INVISIBLE && bottom.getWidth() > 0 && promotion.getWidth() > 0) {
                // Native overlay is a sibling of llBottomNav, originally centered over invisible Writing.
                translation += bottom.getX() + tabs[2].getX() + tabs[2].getWidth() / 2f
                        - promotion.getLeft() - promotion.getWidth() / 2f;
            }
            if (promotion.getTranslationX() != translation) promotion.setTranslationX(translation);
        }

        @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                int oldLeft, int oldTop, int oldRight, int oldBottom) {
            alignPromotion();
        }
    }
}
