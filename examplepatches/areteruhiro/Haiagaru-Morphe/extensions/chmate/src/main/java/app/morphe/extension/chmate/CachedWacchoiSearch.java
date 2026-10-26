package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** A non-overlay control inside the native cached-log search screen. */
public final class CachedWacchoiSearch {
    private static final String KEY = "cachedWacchoiSuffixOnly";
    private static final String PREFS = "haiagaru.cached-wacchoi-search";
    private static final int REFRESH_TAG = 0x48690b55;
    private CachedWacchoiSearch() { }

    public static View wrap(Object fragment, View nativeView) {
        if (nativeView == null) return null;
        try {
            Context context = nativeView.getContext();
            LinearLayout root = new LinearLayout(context); root.setOrientation(LinearLayout.VERTICAL);
            int[] colors = HaiagaruUi.toolTabHeaderColors(context);
            root.setBackgroundColor(colors[0]);
            if (!fragment.getClass().getName().equals("jp.syoboi.a2chMate.fragment.SearchFragment")) {
                // Modern native search is edge-to-edge. Reserve the bars for the
                // wrapper control, then pass reduced insets to the Compose child.
                root.setOnApplyWindowInsetsListener((v, insets) -> {
                    if (android.os.Build.VERSION.SDK_INT >= 30) {
                        android.graphics.Insets safe = insets.getInsets(android.view.WindowInsets.Type.systemBars()
                                | android.view.WindowInsets.Type.displayCutout());
                        root.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                        return insets.inset(safe.left, safe.top, safe.right, safe.bottom);
                    }
                    root.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                            insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
                    return insets.replaceSystemWindowInsets(0, 0, 0, 0);
                });
                root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    public void onViewAttachedToWindow(View v) { v.requestApplyInsets(); }
                    public void onViewDetachedFromWindow(View v) { }
                });
            }
            CheckBox toggle = new CheckBox(context); toggle.setText("ワッチョイを下4桁で検索");
            toggle.setTextColor(colors[1]); toggle.setBackgroundColor(colors[0]);
            toggle.setTag("haiagaru.cachedWacchoiSuffixOnly");
            int pad = Math.round(12 * context.getResources().getDisplayMetrics().density);
            toggle.setPadding(pad / 2, 0, pad / 2, 0);
            toggle.setContentDescription("ワッチョイを下4桁で検索");
            toggle.setMinWidth(0); toggle.setMinimumWidth(0);
            toggle.setMinHeight(0); toggle.setMinimumHeight(0);
            toggle.setTextSize(14);
            toggle.setVisibility(View.GONE);
            FrameLayout page = new FrameLayout(context);
            page.addView(nativeView, new FrameLayout.LayoutParams(-1, -1));
            root.addView(page, new LinearLayout.LayoutParams(-1, 0, 1));
            // Keep a real, measured fallback row until the native condition
            // anchor becomes available. Never make the only entry disappear.
            root.addView(toggle,new LinearLayout.LayoutParams(-1,Math.round(48*context.getResources().getDisplayMetrics().density)));
            toggle.setVisibility(View.VISIBLE);
            root.post(() -> bind(fragment, nativeView, page, toggle));
            return root;
        } catch (Exception error) { Log.w("Haiagaru", "Cached search toggle", error); return nativeView; }
    }

    private static void bind(Object fragment, View nativeView, FrameLayout page, CheckBox toggle) {
        try {
            Query query;
            if (fragment.getClass().getName().equals("o.setUtf8okio")) {
                Object model = call(field(fragment, "e"), "e"), handle = field(model, "j");
                query = new Query() {
                    private Object state() throws Exception { return invoke(field(handle, "a"), "d", new Class<?>[]{String.class}, "formState"); }
                    public String get() throws Exception { return (String) field(state(), "b"); }
                    public void set(String value) throws Exception {
                        Object state = state(); Method copy = null;
                        for (Method m : state.getClass().getDeclaredMethods())
                            if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && m.getReturnType() == state.getClass()
                                    && m.getParameterTypes().length == 12 && m.getParameterTypes()[1] == String.class) copy = m;
                        if (copy == null) throw new NoSuchMethodException("Native search state copy");
                        Object[] args = new Object[12]; args[0] = state; args[1] = value;
                        for (int i = 4; i < 11; i++) args[i] = false;
                        args[11] = 1022; copy.setAccessible(true);
                        invoke(handle, "e", new Class<?>[]{String.class, Object.class}, "formState", copy.invoke(null, args));
                    }
                };
            } else if (fragment.getClass().getName().equals("o.GNk49")) {
                Object lazy = field(fragment, "b"), model = call(lazy, "getValue");
                query = new Query() {
                    public String get() throws Exception { return (String) field(call(field(model, "c"), "d"), "a"); }
                    public void set(String value) throws Exception { call(model, "e", String.class, value); }
                };
            } else {
                EditText input = findInput(nativeView);
                if (input == null) throw new IllegalStateException("Native query input missing");
                query = new Query() {
                    public String get() { return input.getText().toString(); }
                    public void set(String value) { input.setText(value); input.setSelection(input.length()); }
                };
            }
            SharedPreferences prefs = toggle.getContext().getSharedPreferences(PREFS, 0);
            final String[] original = {query.get()}, applied = {null};
            Bundle currentArgs = (Bundle) call(fragment, "getArguments");
            if (currentArgs == null) {
                // SearchActivity-owned modern fragments can have no arguments.
                // Give this fragment its own restoration state instead of sharing
                // the Activity Intent across multiple tablet search panes.
                currentArgs = new Bundle(); call(fragment, "setArguments", Bundle.class, currentArgs);
            }
            final Bundle args = currentArgs;
            String saved = args == null ? null : args.getString("haiagaru.cachedWacchoiOriginal");
            String savedSuffix = CachedWacchoiQuery.suffix(saved);
            boolean restored = savedSuffix != null && savedSuffix.equals(original[0]);
            if (restored) { applied[0] = original[0]; original[0] = saved; toggle.setChecked(true); }
            final boolean[] changing = {false};
            boolean available = CachedWacchoiQuery.suffix(original[0]) != null;
            toggle.setEnabled(available);
            if (!available) toggle.setContentDescription("ワッチョイを下4桁で検索：検索欄に完全なワッチョイがある場合に利用できます");
            toggle.setOnCheckedChangeListener((button, on) -> {
                if (changing[0]) return;
                try {
                    String current = query.get();
                    if (on) {
                        String suffix = CachedWacchoiQuery.suffix(current);
                        if (suffix == null) throw new IllegalArgumentException("ワッチョイの下4桁を読み取れません");
                        original[0] = current; applied[0] = suffix; query.set(suffix);
                        if (args != null) args.putString("haiagaru.cachedWacchoiOriginal", original[0]);
                    } else {
                        query.set(CachedWacchoiQuery.restore(current, applied[0], original[0]));
                        if (args != null) args.remove("haiagaru.cachedWacchoiOriginal");
                    }
                    prefs.edit().putBoolean(KEY, on).apply();
                    if (!fragment.getClass().getName().equals("jp.syoboi.a2chMate.fragment.SearchFragment"))
                        refreshComposeForm(nativeView);
                } catch (Exception error) {
                    Log.w("Haiagaru", "Cached search query switch", error);
                    // Do not persist a failed selection, and restore the actual toggle state.
                    changing[0] = true; button.setChecked(!on); changing[0] = false;
                    Toast.makeText(toggle.getContext(), "検索条件を切り替えられませんでした", Toast.LENGTH_SHORT).show();
                }
            });
            keepBesideSearchOptions(page, nativeView, toggle,query);
            if (available && !restored && prefs.getBoolean(KEY, false)) toggle.setChecked(true);
        } catch (Exception error) { toggle.setEnabled(false); toggle.setVisibility(View.VISIBLE); Log.w("Haiagaru", "Cached search form unavailable", error); }
    }

    private static void keepBesideSearchOptions(FrameLayout page, View nativeView, CheckBox toggle,Query query) {
        final LinearLayout wrapper=(LinearLayout)page.getParent();
        final Runnable[] pulse = new Runnable[1];
        pulse[0] = () -> {
            if (!page.isAttachedToWindow()) return;
            try{toggle.setEnabled(toggle.isChecked()||CachedWacchoiQuery.suffix(query.get())!=null);}
            catch(Exception error){toggle.setEnabled(false);}
            Rect body = findTextBounds(nativeView, "本文");
            boolean bodyAnchor = body != null;
            if (body == null) body = findTextBounds(nativeView, "ヘッダー");
            boolean placed = false;
            if (body != null && page.getWidth() > 0 && page.getHeight() > 0) {
                if (!"下4桁".contentEquals(toggle.getText())) toggle.setText("下4桁");
                int[] pageLocation = new int[2]; page.getLocationOnScreen(pageLocation);
                Rect visible = new Rect(); page.getGlobalVisibleRect(visible);
                toggle.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                int width = Math.max(Math.round(64 * page.getResources().getDisplayMetrics().density), toggle.getMeasuredWidth());
                int height = Math.round(48 * page.getResources().getDisplayMetrics().density);
                int margin = Math.round(6 * page.getResources().getDisplayMetrics().density);
                int left = bodyAnchor ? body.right - pageLocation[0] + margin
                        : page.getWidth() - width - margin;
                int top = body.centerY() - pageLocation[1] - height / 2;
                int screenLeft = pageLocation[0] + left;
                int screenTop = pageLocation[1] + top;
                Rect target = new Rect(screenLeft, screenTop, screenLeft + width, screenTop + height);
                if (visible.contains(target) && left + width <= page.getWidth() - margin
                        && top >= 0 && top + height <= page.getHeight()) {
                    ViewGroup parent = (ViewGroup) toggle.getParent();
                    if (parent != page) {
                        if (parent != null) parent.removeView(toggle);
                        page.addView(toggle, new FrameLayout.LayoutParams(width, height,
                                android.view.Gravity.TOP | android.view.Gravity.LEFT));
                    }
                    FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) toggle.getLayoutParams();
                    if (params.leftMargin != left || params.topMargin != top) {
                        params.leftMargin = left; params.topMargin = top; toggle.setLayoutParams(params);
                    }
                    toggle.setBackgroundColor(android.graphics.Color.TRANSPARENT);
                    toggle.setVisibility(View.VISIBLE);
                    placed = true;
                }
            }
            if (!placed) {
                if (!"ワッチョイを下4桁で検索".contentEquals(toggle.getText()))
                    toggle.setText("ワッチョイを下4桁で検索");
                ViewGroup parent=(ViewGroup)toggle.getParent();
                if(parent!=wrapper){
                    if(parent!=null)parent.removeView(toggle);
                    wrapper.addView(toggle,new LinearLayout.LayoutParams(-1,Math.round(48*page.getResources().getDisplayMetrics().density)));
                }
                toggle.setBackgroundColor(HaiagaruUi.toolTabHeaderColors(toggle.getContext())[0]);
                toggle.setVisibility(View.VISIBLE);
            }
            page.postDelayed(pulse[0], 500L);
        };
        page.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View view) { view.post(pulse[0]); }
            public void onViewDetachedFromWindow(View view) { view.removeCallbacks(pulse[0]); }
        });
        page.post(pulse[0]);
    }

    private static Rect findTextBounds(View view, String wanted) {
        if (view == null || view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof android.widget.TextView) {
            CharSequence text = ((android.widget.TextView) view).getText();
            if (text != null && wanted.contentEquals(text)) {
                Rect bounds = new Rect();
                return view.getGlobalVisibleRect(bounds) && !bounds.isEmpty() ? bounds : null;
            }
        }
        AccessibilityNodeProvider provider = view.getAccessibilityNodeProvider();
        if (provider != null) {
            Rect bounds = findTextBounds(provider, wanted);
            if (bounds != null) return bounds;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Rect bounds = findTextBounds(group.getChildAt(i), wanted);
                if (bounds != null) return bounds;
            }
        }
        return null;
    }

    private static Rect findTextBounds(AccessibilityNodeProvider provider, String wanted) {
        AccessibilityNodeInfo root = null;
        try { root = provider.createAccessibilityNodeInfo(AccessibilityNodeProvider.HOST_VIEW_ID); }
        catch (RuntimeException ignored) { }
        if (root == null) return null;
        java.util.ArrayDeque<AccessibilityNodeInfo> pending = new java.util.ArrayDeque<>();
        pending.add(root);
        int visited = 0;
        try {
            while (!pending.isEmpty() && visited++ < 4096) {
                AccessibilityNodeInfo node = pending.removeFirst();
                CharSequence text = node.getText();
                if (text != null && normalize(text).contains(normalize(wanted))) {
                    Rect bounds = new Rect(); node.getBoundsInScreen(bounds);
                    node.recycle();
                    while (!pending.isEmpty()) pending.removeFirst().recycle();
                    return bounds.isEmpty() ? null : bounds;
                }
                for (int i = 0; i < node.getChildCount(); i++) {
                    AccessibilityNodeInfo child = node.getChild(i);
                    if (child != null) pending.addLast(child);
                }
                node.recycle();
            }
        } catch (RuntimeException ignored) {
        } finally {
            while (!pending.isEmpty()) pending.removeFirst().recycle();
        }
        return null;
    }
    private static String normalize(CharSequence text) {
        return text == null ? "" : text.toString().replaceAll("\\s+", "").trim();
    }
    private interface Query { String get() throws Exception; void set(String value) throws Exception; }
    private static boolean refreshComposeForm(View view) {
        try {
            Method redraw = view.getClass().getMethod("haiagaruRefreshCachedSearchForm");
            Object previous = view.getTag(REFRESH_TAG);
            if (previous instanceof Runnable) view.removeCallbacks((Runnable) previous);
            Runnable refresh = () -> {
                view.setTag(REFRESH_TAG, null);
                if (!view.isAttachedToWindow()) return;
                try { redraw.invoke(view); }
                catch (Exception error) { Log.w("Haiagaru", "Cached search field redraw", error); }
            };
            // Native Compose text fields retain their own editing buffer. Recreate
            // only this child composition after updating native form state; never
            // recreate the Activity, replace callbacks, or overlap pending redraws.
            view.setTag(REFRESH_TAG, refresh); view.post(refresh); return true;
        } catch (NoSuchMethodException ignored) { }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (refreshComposeForm(group.getChildAt(i))) return true;
        }
        return false;
    }
    private static EditText findInput(View v) {
        if (v instanceof EditText) return (EditText) v;
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v; for (int i = 0; i < g.getChildCount(); i++) { EditText found = findInput(g.getChildAt(i)); if (found != null) return found; } }
        return null;
    }
    private static Object field(Object o, String name) throws Exception {
        for (Class<?> c = o.getClass(); c != null; c = c.getSuperclass()) try { Field f = c.getDeclaredField(name); f.setAccessible(true); return f.get(o); } catch (NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(name);
    }
    private static Object call(Object o, String name) throws Exception { Method m = o.getClass().getMethod(name); m.setAccessible(true); return m.invoke(o); }
    private static Object invoke(Object o, String name, Class<?>[] types, Object... args) throws Exception { Method m = o.getClass().getMethod(name, types); m.setAccessible(true); return m.invoke(o, args); }
    private static void call(Object o, String name, Class<?> type, Object value) throws Exception { Method m = o.getClass().getMethod(name, type); m.setAccessible(true); m.invoke(o, value); }
}
