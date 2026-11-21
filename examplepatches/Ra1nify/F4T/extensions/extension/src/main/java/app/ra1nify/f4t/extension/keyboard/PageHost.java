package app.ra1nify.f4t.extension.keyboard;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
import android.view.View;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Shows the F4T entries inside the stock settings page itself.
 *
 * The stock settings fragment keeps owning the app bar, the COUI RecyclerView, the adapter and the
 * item decoration; this host only swaps the preference screen contents and restores them on back.
 */
public final class PageHost {
    private static final String TAG = "F4T";

    private static Object screen;
    private static Context context;
    private static Object adapter;
    private static List<Object> stockPreferences = new ArrayList<>();
    private static CharSequence stockTitle;
    private static View.OnClickListener stockBackListener;
    private static boolean active;

    private PageHost() {
    }

    /** Captures the stock screen created by the stock settings fragment. */
    static void onScreenCreated(Object fragment, Context fragmentContext, Object preferenceScreen) {
        if (preferenceScreen == null) return;
        screen = preferenceScreen;
        context = fragmentContext;
        adapter = null;
        try {
            Object listView = fragment.getClass().getMethod("getListView").invoke(fragment);
            if (listView != null) {
                adapter = listView.getClass().getMethod("getAdapter").invoke(listView);
            }
        } catch (Throwable error) {
            Log.w(TAG, "could not capture stock adapter", error);
        }
        Log.i(TAG, "stock screen captured");
    }

    /** Called from the injected settings row; toggles between the F4T page and the stock page. */
    public static void toggle(Context anyContext, String page) {
        Activity activity = activityOf(anyContext);
        if (screen == null) {
            Log.w(TAG, "stock screen not captured yet");
            return;
        }
        if (active) {
            restore(activity);
        } else {
            show(activity, page);
        }
    }

    /** Hook target: kept as a no-op, the stock activity already handles resume. */
    public static void onResume(Activity activity) {
    }

    /** Hook target: kept as a no-op. */
    public static void onNewIntent(Activity activity, android.content.Intent intent) {
    }

    /** Hook target: kept as a no-op, the stock activity handles back itself. */
    public static boolean handleKeyEvent(Activity activity, android.view.KeyEvent event) {
        return false;
    }

    private static void show(Activity activity, String page) {
        try {
            stockPreferences = currentPreferences();
            if (activity != null) {
                View toolbar = findToolbar(activity);
                if (toolbar != null) {
                    stockTitle = (CharSequence) toolbar.getClass().getMethod("getTitle").invoke(toolbar);
                }
                View back = findBack(activity);
                if (back != null) stockBackListener = (View.OnClickListener) back.getTag(-1);
            }
            removeAll();
            SettingsHost.fill(context, screen, page);
            refresh();
            active = true;
            if (activity != null) {
                applyTitle(activity, SettingsHost.title(page));
                View back = findBack(activity);
                if (back != null) back.setOnClickListener(view -> restore(activity));
            }
            Log.i(TAG, "F4T page shown in stock settings: " + page);
        } catch (Throwable error) {
            Log.e(TAG, "could not show F4T page", error);
        }
    }

    private static void restore(Activity activity) {
        try {
            removeAll();
            for (Object preference : stockPreferences) {
                invokeAdd(preference);
            }
            refresh();
            active = false;
            if (activity != null) {
                if (stockTitle != null) applyTitle(activity, stockTitle.toString());
                View back = findBack(activity);
                if (back != null && stockBackListener != null) back.setOnClickListener(stockBackListener);
            }
            Log.i(TAG, "stock settings page restored");
        } catch (Throwable error) {
            Log.e(TAG, "could not restore stock page", error);
        }
    }

    private static List<Object> currentPreferences() throws Exception {
        List<Object> preferences = new ArrayList<>();
        int count = (Integer) screen.getClass().getMethod("getPreferenceCount").invoke(screen);
        Method getPreference = screen.getClass().getMethod("getPreference", int.class);
        for (int i = 0; i < count; i++) {
            Object preference = getPreference.invoke(screen, i);
            if (preference != null) preferences.add(preference);
        }
        return preferences;
    }

    private static void removeAll() throws Exception {
        screen.getClass().getMethod("removeAll").invoke(screen);
    }

    private static void invokeAdd(Object preference) throws Exception {
        for (Method method : screen.getClass().getMethods()) {
            if (method.getName().equals("addPreference") && method.getParameterTypes().length == 1) {
                method.invoke(screen, preference);
                return;
            }
        }
    }

    private static void refresh() {
        try {
            if (adapter != null) {
                adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
            }
        } catch (Throwable error) {
            Log.w(TAG, "could not refresh adapter", error);
        }
    }

    private static Activity activityOf(Context anyContext) {
        Context current = anyContext;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            current = ((ContextWrapper) current).getBaseContext();
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static View findToolbar(Activity activity) {
        int id = activity.getResources().getIdentifier("toolbar", "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    private static View findBack(Activity activity) {
        int id = activity.getResources()
                .getIdentifier("coui_toolbar_back_view", "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    private static void applyTitle(Activity activity, String title) {
        View toolbar = findToolbar(activity);
        if (toolbar == null) return;
        try {
            toolbar.getClass().getMethod("setTitle", CharSequence.class).invoke(toolbar, title);
        } catch (Throwable error) {
            Log.w(TAG, "could not set title", error);
        }
    }
}
