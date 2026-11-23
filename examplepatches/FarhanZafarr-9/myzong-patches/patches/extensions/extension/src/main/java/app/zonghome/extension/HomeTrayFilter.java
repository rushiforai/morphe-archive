package app.zonghome.extension;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

/** Filters only the rendered tray list; never modifies server data or the database. */
public final class HomeTrayFilter {
    private HomeTrayFilter() {}
    private static final WeakHashMap<View, Sizing> ROOTS = new WeakHashMap<>();
    private static volatile int itemCount = -1;

    /** Replaced by the patch with the selected normalized list. An empty string keeps none. */
    public static String selectedKeys() { return "rewards|rs100shop"; }

    static String normalize(String value) {
        if (value == null) return "";
        String lower = value.toLowerCase(Locale.ROOT);
        StringBuilder result = new StringBuilder(lower.length());
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (Character.isLetterOrDigit(c)) result.append(c);
        }
        String key = result.toString();
        if (key.equals("freembs") || key.equals("freemb") || key.equals("freemegabytes")) return "rewards";
        return key;
    }

    public static List<?> filter(List<?> input) { return filterWithKeys(input, selectedKeys()); }

    // Separate pure entry point for the pending selection/order/no-mutation test cases.
    static List<?> filterWithKeys(List<?> input, String keys) {
        if (input == null) return null; // Leave the app's existing null check unchanged.
        Set<String> keep = new HashSet<>();
        if (keys != null && !keys.isEmpty()) {
            for (String value : keys.split("\\|")) keep.add(normalize(value));
        }
        List<Object> output = new ArrayList<>();
        Method nameGetter = null;
        Class<?> itemType = null;
        try {
            for (Object item : input) {
                if (item == null) continue;
                if (item.getClass() != itemType) {
                    itemType = item.getClass();
                    nameGetter = itemType.getMethod("getName");
                }
                Object value = nameGetter.invoke(item);
                String name = value instanceof String ? (String) value : "";
                if (keep.contains(normalize(name))) output.add(item);
            }
        } catch (ReflectiveOperationException | SecurityException incompatibleModel) {
            // The patch validates getName on .112; don't crash the app if the model changes.
            itemCount = input.size();
            return input;
        }
        itemCount = output.size();
        return output;
    }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", "com.zong.customercare");
        return id == 0 ? null : root.findViewById(id);
    }

    /** Compact one/two-row results rather than leaving the original fixed-height empty area. */
    public static void attach(View root) {
        if (root == null || ROOTS.containsKey(root)) return;
        Sizing state = new Sizing(root);
        ROOTS.put(root, state);
        root.addOnAttachStateChangeListener(state);
        if (root.isAttachedToWindow()) state.onViewAttachedToWindow(root);
    }

    private static final class Sizing implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        private final WeakReference<View> root;
        private ViewTreeObserver observer;
        private boolean compact;
        private int oldHeight, oldMinimumHeight, oldMoreVisibility;

        Sizing(View value) { root = new WeakReference<>(value); }

        @Override public boolean onPreDraw() {
            View value = root.get();
            if (value == null || itemCount < 0) return true;
            View card = find(value, "cardTray"), grid = find(value, "rvHomeTray");
            View more = find(value, "viewMoreBtn");
            View backdrop = more != null && more.getParent() instanceof View ? (View) more.getParent() : more;
            if (card == null || grid == null || card.getLayoutParams() == null) return true;
            ViewGroup.LayoutParams params = card.getLayoutParams();
            if (itemCount > 8) {
                if (!compact) return true;
                params.height = oldHeight; card.setMinimumHeight(oldMinimumHeight); card.setLayoutParams(params);
                if (backdrop != null) backdrop.setVisibility(oldMoreVisibility);
                compact = false;
                return false;
            }
            if (itemCount > 0 && grid.getMeasuredHeight() <= 0) return true;
            if (!compact) {
                oldHeight = params.height; oldMinimumHeight = card.getMinimumHeight();
                oldMoreVisibility = backdrop == null ? View.VISIBLE : backdrop.getVisibility();
                compact = true;
            }
            int height = itemCount == 0 ? 0 : grid.getMeasuredHeight();
            if (height > 0 && grid.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) grid.getLayoutParams();
                height += margins.topMargin + margins.bottomMargin;
            }
            if (height > 0) height += card.getPaddingTop() + card.getPaddingBottom();
            boolean changed = false;
            if (card.getMinimumHeight() != 0) { card.setMinimumHeight(0); changed = true; }
            if (params.height != height) { params.height = height; card.setLayoutParams(params); changed = true; }
            if (backdrop != null && backdrop.getVisibility() != View.GONE) {
                backdrop.setVisibility(View.GONE); changed = true;
            }
            return !changed;
        }

        @Override public void onViewAttachedToWindow(View value) {
            detach(); observer = value.getViewTreeObserver();
            if (observer.isAlive()) observer.addOnPreDrawListener(this);
        }
        @Override public void onViewDetachedFromWindow(View value) { detach(); }
        private void detach() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }
    }
}
