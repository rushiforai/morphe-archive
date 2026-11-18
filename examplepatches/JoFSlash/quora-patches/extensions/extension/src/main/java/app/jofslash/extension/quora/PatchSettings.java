package app.jofslash.extension.quora;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Turns the page patches on and off while the app runs, and edits the filter lists.
 * Opened by long-pressing the Home tab. Privacy patches can't be switched off here.
 */
@SuppressWarnings("unused")
public final class PatchSettings {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** Page patches that ran at least once, by key, with their names, in the order they first ran. */
    private static final Map<String, String> PATCHES = new LinkedHashMap<>();

    /** Text options that ran at least once: key to {name, value baked in when patching}. */
    private static final Map<String, String[]> TEXTS = new LinkedHashMap<>();

    private static WeakReference<WebView> lastWebView = new WeakReference<>(null);

    private PatchSettings() {
    }

    /**
     * Called by each page patch before it runs.
     *
     * @return Whether the patch is switched on (the default).
     */
    public static boolean active(WebView webView, String key, String name) {
        if (webView != null) lastWebView = new WeakReference<>(webView);
        synchronized (PATCHES) {
            if (!PATCHES.containsKey(key)) PATCHES.put(key, name);
        }
        SharedPreferences prefs = prefs(webView);
        return prefs == null || prefs.getBoolean(key, true);
    }

    /**
     * Called when the tab bar is set up, once for each native patch that can be switched at run time,
     * so the dialog lists it before the patch first acts.
     */
    public static void register(String key, String name) {
        synchronized (PATCHES) {
            if (!PATCHES.containsKey(key)) PATCHES.put(key, name);
        }
    }

    /**
     * For native patches: whether the patch is switched on (the default).
     */
    public static boolean on(String key) {
        return isOn(key);
    }

    /**
     * Called by patches with a text option, such as the keyword filter.
     *
     * @return The value set in the settings, or the value chosen when patching.
     */
    public static String text(WebView webView, String key, String name, String patched) {
        synchronized (TEXTS) {
            if (!TEXTS.containsKey(key)) TEXTS.put(key, new String[]{name, patched == null ? "" : patched});
        }
        SharedPreferences prefs = prefs(webView);
        return prefs == null ? patched : prefs.getString(key, patched);
    }

    /**
     * Injection point: QTabBar.setupTabs, after the tabs are created.
     *
     * @param tabLayout The bottom bar's TabLayout.
     */
    public static void attach(View tabLayout) {
        if (!(tabLayout instanceof ViewGroup)) return;
        try {
            ViewGroup strip = (ViewGroup) ((ViewGroup) tabLayout).getChildAt(0);
            View home = strip == null ? null : strip.getChildAt(0);
            if (home == null) return;
            home.setOnLongClickListener((v) -> {
                show(v.getContext());
                return true;
            });
        } catch (Exception ex) {
            Log.e(TAG, "Failed to attach the patch settings", ex);
        }
    }

    private static void show(Context context) {
        Activity activity = activity(context);
        if (activity == null) return;
        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

        final List<String> keys;
        final String[] names;
        final boolean[] checked;
        synchronized (PATCHES) {
            keys = new ArrayList<>(PATCHES.keySet());
            names = new String[keys.size()];
            checked = new boolean[keys.size()];
            for (int i = 0; i < keys.size(); i++) {
                names[i] = PATCHES.get(keys.get(i));
                checked[i] = prefs.getBoolean(keys.get(i), true);
            }
        }
        if (keys.isEmpty() && TEXTS.isEmpty()) {
            Toast.makeText(activity, "Open a page first, then long-press Home again.", Toast.LENGTH_SHORT).show();
            return;
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle("Quora patches")
                .setMultiChoiceItems(names, checked, (dialog, which, isChecked) -> checked[which] = isChecked)
                .setPositiveButton("Save", (dialog, which) -> {
                    SharedPreferences.Editor editor = prefs.edit();
                    for (int i = 0; i < keys.size(); i++) editor.putBoolean(keys.get(i), checked[i]);
                    editor.apply();
                    reload();
                    Toast.makeText(activity, "Saved. Changes to tabs, gestures and text size apply after restarting the app.",
                            Toast.LENGTH_LONG).show();
                })
                .setNegativeButton("Cancel", null);
        if (!TEXTS.isEmpty()) builder.setNeutralButton("Filters", (dialog, which) -> showTexts(activity, prefs));
        builder.show();
    }

    private static void showTexts(Activity activity, SharedPreferences prefs) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (20 * activity.getResources().getDisplayMetrics().density);
        layout.setPadding(pad, pad / 2, pad, 0);

        final Map<String, EditText> fields = new LinkedHashMap<>();
        synchronized (TEXTS) {
            for (Map.Entry<String, String[]> entry : TEXTS.entrySet()) {
                EditText field = new EditText(activity);
                field.setHint(entry.getValue()[0] + " (separate with commas)");
                field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
                field.setText(prefs.getString(entry.getKey(), entry.getValue()[1]));
                layout.addView(field);
                fields.put(entry.getKey(), field);
            }
        }

        new AlertDialog.Builder(activity)
                .setTitle("Filters")
                .setView(layout)
                .setPositiveButton("Save", (dialog, which) -> {
                    SharedPreferences.Editor editor = prefs.edit();
                    for (Map.Entry<String, EditText> f : fields.entrySet()) {
                        editor.putString(f.getKey(), f.getValue().getText().toString().trim());
                    }
                    editor.apply();
                    reload();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /** Page patches are added when a page loads, so a reload applies the new settings. */
    private static void reload() {
        WebView webView = lastWebView.get();
        if (webView == null) return;
        try {
            webView.reload();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to reload", ex);
        }
    }

    /**
     * For checks without a WebView at hand, such as request blocking.
     *
     * @return Whether the patch is switched on (the default, also before any page has loaded).
     */
    public static boolean isOn(String key) {
        Context context = appContext;
        if (context == null) context = appContext = currentApplication();
        if (context == null) return true;
        try {
            return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(key, true);
        } catch (Exception ex) {
            return true;
        }
    }

    private static volatile Context appContext;

    /** The app's context before any view exists, for example in the push notification service. */
    private static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable ex) {
            return null;
        }
    }

    private static SharedPreferences prefs(View view) {
        try {
            Context context = view == null ? null : view.getContext();
            if (context == null) return null;
            appContext = context.getApplicationContext();
            return appContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            return null;
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
