package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Embeds MonkeyScript in Chrome's actual Chromium app-menu view.
 *
 * Chrome 150 renders its overflow menu from a Chromium ModelList inside the view whose resource
 * entry name is app_menu_list. It is not an android.view.Menu. The earlier Menu reflection bridge
 * therefore could never find it. This implementation only modifies a visible root containing the
 * exact app_menu_list resource and explicitly rejects roots containing context_menu_list_view.
 */
final class ChromeAppMenuIntegrator implements Runnable {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Activity, ChromeAppMenuIntegrator> ACTIVE = new WeakHashMap<>();

    private static final String APP_MENU_LIST = "app_menu_list";
    private static final String CONTEXT_MENU_LIST = "context_menu_list_view";
    private static final String FOOTER_TAG =
            "dev.alastorkaneki.monkeyscript.CHROME_APP_MENU_FOOTER";
    private static final String MANAGER_TAG =
            "dev.alastorkaneki.monkeyscript.CHROME_APP_MENU_MANAGER";
    private static final String INSTALL_TAG =
            "dev.alastorkaneki.monkeyscript.CHROME_APP_MENU_INSTALL";

    // Resource IDs observed in the supplied Chrome 150.0.7871.186 APK. They are used only after
    // validating the resource entry name, so a different Chrome build cannot be modified by ID
    // collision alone.
    private static final int CHROME_150_APP_MENU_LIST_ID = 0x7f01011a;
    private static final int CHROME_150_CONTEXT_MENU_LIST_ID = 0x7f010318;

    private final Activity activity;

    private ChromeAppMenuIntegrator(Activity activity) {
        this.activity = activity;
    }

    static void start(Activity activity) {
        stop(activity);
        ChromeAppMenuIntegrator integrator = new ChromeAppMenuIntegrator(activity);
        synchronized (ACTIVE) {
            ACTIVE.put(activity, integrator);
        }
        MAIN.post(integrator);
    }

    static void stop(Activity activity) {
        ChromeAppMenuIntegrator integrator;
        synchronized (ACTIVE) {
            integrator = ACTIVE.remove(activity);
        }
        if (integrator != null) MAIN.removeCallbacks(integrator);
    }

    @Override public void run() {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        try {
            String url = MonkeyRuntime.url(activity);
            for (View root : windowRoots(activity)) {
                bindExactChromeMenu(root, url);
            }
        } catch (Throwable ignored) { }
        MAIN.postDelayed(this, 100);
    }

    private void bindExactChromeMenu(View root, String url) {
        if (root == null || !root.isShown()) return;

        // Chrome's long-press and page context menus use this different exact resource. Never
        // inspect or mutate such a window, even if its hierarchy happens to resemble the app menu.
        if (containsResource(root, CONTEXT_MENU_LIST, CHROME_150_CONTEXT_MENU_LIST_ID)) return;

        View appMenuList = findResource(root, APP_MENU_LIST, CHROME_150_APP_MENU_LIST_ID);
        if (!(appMenuList instanceof ViewGroup)
                || !appMenuList.isShown()
                || appMenuList.getWidth() <= 0
                || appMenuList.getHeight() <= 0) return;

        ViewParent parent = appMenuList.getParent();
        if (!(parent instanceof ViewGroup)) return;
        ViewGroup host = (ViewGroup) parent;
        if (host instanceof AdapterView) return;

        View existing = host.findViewWithTag(FOOTER_TAG);
        if (existing instanceof ViewGroup) {
            updateRows((ViewGroup) existing, url);
            return;
        }

        TextView exemplar = findNativeText((ViewGroup) appMenuList);
        View nativeRow = exemplar == null ? null : rowForList(exemplar, appMenuList);
        int rowHeight = nativeRowHeight(nativeRow);

        LinearLayout footer = new LinearLayout(activity);
        footer.setTag(FOOTER_TAG);
        footer.setOrientation(LinearLayout.VERTICAL);
        footer.setClipToPadding(false);
        footer.setClickable(false);
        footer.setFocusable(false);

        TextView manager = createRow(exemplar, nativeRow, "Userscripts", MANAGER_TAG, rowHeight);
        footer.addView(manager, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                rowHeight
        ));

        TextView install = createRow(
                exemplar,
                nativeRow,
                "Install userscript",
                INSTALL_TAG,
                rowHeight
        );
        footer.addView(install, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                rowHeight
        ));

        int insertionIndex = Math.min(host.indexOfChild(appMenuList) + 1, host.getChildCount());
        host.addView(
                footer,
                insertionIndex,
                new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                )
        );
        updateRows(footer, url);
        footer.requestLayout();
        host.requestLayout();
    }

    private void updateRows(ViewGroup footer, String url) {
        View manager = footer.findViewWithTag(MANAGER_TAG);
        if (manager != null) {
            manager.setVisibility(View.VISIBLE);
            manager.setEnabled(true);
            manager.setOnClickListener(view -> activity.startActivity(
                    new Intent(activity, UserscriptManagerActivity.class)
                            .putExtra("current_url", MonkeyRuntime.url(activity))
                            .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            ));
        }

        String current = url == null ? "" : url;
        String marked = ForkSiteSupport.installUrlFromMarker(current);
        String target = marked == null ? current : marked;
        boolean installable = ForkSiteSupport.isInstallablePage(target);
        View install = footer.findViewWithTag(INSTALL_TAG);
        if (install != null) {
            install.setVisibility(installable ? View.VISIBLE : View.GONE);
            install.setEnabled(installable);
            install.setOnClickListener(installable ? view ->
                    ForkSiteSupport.openInstallPreview(activity, target) : null);
        }
    }

    private TextView createRow(
            TextView exemplar,
            View nativeRow,
            String title,
            String tag,
            int rowHeight
    ) {
        TextView row = new TextView(activity);
        row.setTag(tag);
        row.setText(title);
        row.setContentDescription(title);
        row.setSingleLine(true);
        row.setEllipsize(TextUtils.TruncateAt.END);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        row.setFocusable(true);
        row.setMinHeight(rowHeight);

        if (exemplar != null) {
            row.setTextColor(exemplar.getTextColors());
            row.setTextSize(TypedValue.COMPLEX_UNIT_PX, exemplar.getTextSize());
            Typeface typeface = exemplar.getTypeface();
            if (typeface != null) row.setTypeface(typeface);
            row.setIncludeFontPadding(exemplar.getIncludeFontPadding());
            row.setLetterSpacing(exemplar.getLetterSpacing());
            row.setGravity(exemplar.getGravity());
            row.setCompoundDrawablePadding(exemplar.getCompoundDrawablePadding());
            int start = Math.max(relativeStart(exemplar, nativeRow), dp(20));
            int end = Math.max(exemplar.getPaddingEnd(), dp(20));
            row.setPaddingRelative(start, exemplar.getPaddingTop(), end, exemplar.getPaddingBottom());
        } else {
            row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            row.setTextColor(MonkeyUi.text(activity));
            row.setPaddingRelative(dp(20), 0, dp(20), 0);
        }

        Drawable background = cloneBackground(nativeRow);
        if (background != null) {
            row.setBackground(background);
        } else {
            TypedValue selectable = new TypedValue();
            if (activity.getTheme().resolveAttribute(
                    android.R.attr.selectableItemBackground,
                    selectable,
                    true
            ) && selectable.resourceId != 0) {
                row.setBackgroundResource(selectable.resourceId);
            }
        }
        return row;
    }

    private Drawable cloneBackground(View nativeRow) {
        if (nativeRow == null || nativeRow.getBackground() == null) return null;
        try {
            Drawable.ConstantState state = nativeRow.getBackground().getConstantState();
            if (state == null) return null;
            return state.newDrawable(activity.getResources(), activity.getTheme()).mutate();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private int relativeStart(TextView text, View row) {
        int start = text.getPaddingStart();
        View current = text;
        for (int depth = 0; depth < 8 && current != null && current != row; depth++) {
            start += current.getLeft();
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return start;
    }

    private int nativeRowHeight(View row) {
        if (row != null) {
            int height = row.getHeight();
            if (height >= dp(40) && height <= dp(96)) return height;
            int minimum = row.getMinimumHeight();
            if (minimum >= dp(40) && minimum <= dp(96)) return minimum;
            ViewGroup.LayoutParams params = row.getLayoutParams();
            if (params != null && params.height >= dp(40) && params.height <= dp(96)) {
                return params.height;
            }
        }
        return dp(48);
    }

    private TextView findNativeText(ViewGroup list) {
        for (int index = 0; index < list.getChildCount(); index++) {
            TextView found = findFirstText(list.getChildAt(index), 0);
            if (found != null && found.getText() != null
                    && !found.getText().toString().trim().isEmpty()) return found;
        }
        return null;
    }

    private TextView findFirstText(View view, int depth) {
        if (view == null || depth > 10) return null;
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            TextView found = findFirstText(group.getChildAt(index), depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    private View rowForList(TextView text, View list) {
        View current = text;
        View previous = text;
        for (int depth = 0; depth < 10 && current != null && current != list; depth++) {
            previous = current;
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return current == list ? previous : text;
    }

    private boolean containsResource(View root, String entryName, int exactId) {
        return findResource(root, entryName, exactId) != null;
    }

    private View findResource(View root, String entryName, int exactId) {
        int[] ids = {
                resourceId(entryName, activity.getPackageName()),
                resourceId(entryName, "com.android.chrome"),
                exactId
        };
        for (int id : ids) {
            if (id == 0) continue;
            View candidate = root.findViewById(id);
            if (candidate != null && hasEntryName(candidate, entryName)) return candidate;
        }
        return findResourceRecursively(root, entryName, 0);
    }

    private int resourceId(String entryName, String packageName) {
        try {
            return activity.getResources().getIdentifier(entryName, "id", packageName);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private View findResourceRecursively(View view, String entryName, int depth) {
        if (view == null || depth > 18) return null;
        if (hasEntryName(view, entryName)) return view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            View found = findResourceRecursively(group.getChildAt(index), entryName, depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    private boolean hasEntryName(View view, String expected) {
        int id = view.getId();
        if (id == View.NO_ID || id == 0) return false;
        try {
            return expected.equals(activity.getResources().getResourceEntryName(id));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static List<View> windowRoots(Activity activity) {
        List<View> roots = new ArrayList<>();
        IdentityHashMap<View, Boolean> seen = new IdentityHashMap<>();
        View decor = activity.getWindow().getDecorView();
        if (decor != null) {
            roots.add(decor);
            seen.put(decor, true);
        }
        try {
            Class<?> type = Class.forName("android.view.WindowManagerGlobal");
            Method getInstance = type.getDeclaredMethod("getInstance");
            getInstance.setAccessible(true);
            Object global = getInstance.invoke(null);
            try {
                Method getRootViews = type.getDeclaredMethod("getRootViews");
                getRootViews.setAccessible(true);
                Object value = getRootViews.invoke(global);
                if (value instanceof View[]) {
                    for (View root : (View[]) value) addRoot(roots, seen, root);
                } else if (value instanceof Iterable) {
                    for (Object item : (Iterable<?>) value) {
                        if (item instanceof View) addRoot(roots, seen, (View) item);
                    }
                }
            } catch (Throwable ignored) {
                Field field = type.getDeclaredField("mRoots");
                field.setAccessible(true);
                Object value = field.get(global);
                if (value instanceof Iterable) {
                    for (Object root : (Iterable<?>) value) {
                        if (root == null) continue;
                        try {
                            Method getView = root.getClass().getDeclaredMethod("getView");
                            getView.setAccessible(true);
                            Object view = getView.invoke(root);
                            if (view instanceof View) addRoot(roots, seen, (View) view);
                        } catch (Throwable ignoredRoot) { }
                    }
                }
            }
        } catch (Throwable ignored) { }
        return roots;
    }

    private static void addRoot(
            List<View> roots,
            IdentityHashMap<View, Boolean> seen,
            View root
    ) {
        if (root != null && seen.put(root, true) == null) roots.add(root);
    }
}
