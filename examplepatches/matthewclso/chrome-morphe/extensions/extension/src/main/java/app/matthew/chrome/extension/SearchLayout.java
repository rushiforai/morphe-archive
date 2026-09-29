package app.matthew.chrome.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;

/** Keep the Hub's active tab search above the IME, with its results above the field. */
public final class SearchLayout {
    private SearchLayout() {}
    public static void watch(Activity activity) {
        if (!activity.getClass().getName().equals("org.chromium.chrome.browser.searchwidget.SearchActivity")) return;
        View root = activity.getWindow().getDecorView();
        root.getViewTreeObserver().addOnGlobalLayoutListener(() -> arrange(root));
    }
    private static View find(View root, String name) {
        return root.findViewById(root.getResources().getIdentifier(name, "id", root.getContext().getPackageName()));
    }
    private static void arrange(View root) {
        if (!PatchSettings.trueBottom()) return;
        View toolbar = find(root, "toolbar");
        if (toolbar == null || toolbar.getHeight() == 0 || !(toolbar.getParent() instanceof View)) return;
        View parent = (View) toolbar.getParent();
        Rect visible = new Rect();
        root.getWindowVisibleDisplayFrame(visible);
        int[] position = new int[2];
        parent.getLocationInWindow(position);
        int bottom = Math.min(parent.getHeight(), visible.bottom - position[1]);
        int top = Math.max(0, visible.top - position[1]);
        int barTop = Math.max(top, bottom - toolbar.getHeight());
        // Keep wrap-content measurement at the native origin. A portrait top margin can
        // consume the entire landscape height, measuring the field to zero on rotation.
        float translation = barTop - toolbar.getTop();
        if (toolbar.getTranslationY() != translation) toolbar.setTranslationY(translation);
        View results = find(root, "search_activity_suggestions_container");
        if (results == null) results = find(root, "search_activity_suggestions_container_stub");
        if (results == null) return;
        // Native CoordinatorLayout anchoring otherwise puts the result list below the moved field.
        NativeBridge.unanchorSearchResults(results);
        ViewGroup.MarginLayoutParams list = (ViewGroup.MarginLayoutParams) results.getLayoutParams();
        int height = Math.max(0, barTop - top);
        if (list.topMargin != top || list.height != height) {
            list.topMargin = top; list.height = height; results.setLayoutParams(list);
        }
    }
}
