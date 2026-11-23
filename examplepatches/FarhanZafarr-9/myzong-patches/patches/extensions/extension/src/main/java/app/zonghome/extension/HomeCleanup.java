package app.zonghome.extension;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Visual-only home cleanup. Never accesses credentials, storage, or network. */
public final class HomeCleanup {
    private HomeCleanup() {}
    private static final WeakHashMap<View, State> STATES = new WeakHashMap<>();
    private static final String[][] GROUPS = {
        {"cardSports"},
        {"cardRamadan"},
        {"cardFamilyBundle", "cardViewMy5Banner"},
        {"streakView", "layout7DaysStreak"},
        {"fragmentBanners", "fragmentBannersNew", "fragmentEntertainmentMenuTray",
         "layoutAdaptiveParentAd", "tvBanner", "cardViewFlashSale", "ribbon",
         "tvFlashSale", "timeRemaining", "tvTime", "tvRemaining", "fragmentHotOffers"},
        {"layout5g"}
    };

    public static void hideMatch(View root) { install(root, 1); }
    public static void hidePrayers(View root) { install(root, 2); }
    public static void hideFamily(View root) { install(root, 4); }
    public static void hideStreaks(View root) { install(root, 8); }
    public static void hidePromotions(View root) { install(root, 16); }
    public static void hide5g(View root) { install(root, 32); }

    private static void install(View root, int group) {
        if (root == null) return;
        State state = STATES.get(root);
        if (state == null) {
            state = new State(root);
            STATES.put(root, state);
            root.addOnAttachStateChangeListener(state);
            if (root.isAttachedToWindow()) state.onViewAttachedToWindow(root);
        }
        state.addGroup(root, group);
        state.hide(root);
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        private final WeakReference<View> root;
        private final ArrayList<Integer> ids = new ArrayList<>();
        private int mask;
        private ViewTreeObserver observer;

        State(View view) { root = new WeakReference<>(view); }

        void addGroup(View view, int group) {
            if ((mask & group) != 0) return;
            mask |= group;
            for (int i = 0; i < GROUPS.length; i++) {
                if ((group & (1 << i)) == 0) continue;
                for (String name : GROUPS[i]) {
                    int id = view.getResources().getIdentifier(name, "id", "com.zong.customercare");
                    if (id != 0 && !ids.contains(id)) ids.add(id);
                }
            }
        }

        boolean hide(View view) {
            boolean changed = false;
            for (int id : ids) {
                View target = view.findViewById(id);
                if (target != null && target.getVisibility() != View.GONE) {
                    target.setVisibility(View.GONE);
                    changed = true;
                }
            }
            return changed;
        }

        @Override public boolean onPreDraw() {
            View view = root.get();
            // When GONE changes geometry, wait for the next layout before drawing.
            return view == null || !hide(view);
        }

        @Override public void onViewAttachedToWindow(View view) {
            detachObserver();
            observer = view.getViewTreeObserver();
            if (observer.isAlive()) observer.addOnPreDrawListener(this);
            hide(view);
        }

        @Override public void onViewDetachedFromWindow(View view) { detachObserver(); }

        private void detachObserver() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }
    }
}
