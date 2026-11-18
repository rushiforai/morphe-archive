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
import android.widget.TextView;
import android.widget.Toast;

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

    private static final Map<WebView, Boolean> WEB_VIEWS = new java.util.WeakHashMap<>();

    private PatchSettings() {
    }

    /**
     * Called by each page patch before it runs.
     *
     * @return Whether the patch is switched on (the default).
     */
    public static boolean active(WebView webView, String key, String name) {
        if (webView != null) {
            synchronized (WEB_VIEWS) {
                WEB_VIEWS.put(webView, Boolean.TRUE);
            }
        }
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

    /** Whether a native patch registered this key, that is, whether it was included when patching. */
    public static boolean isRegistered(String key) {
        synchronized (PATCHES) {
            return PATCHES.containsKey(key);
        }
    }

    /** The app's context, also before any page has loaded. */
    public static Context context() {
        Context context = appContext;
        if (context == null) context = appContext = currentApplication();
        return context;
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
            showHintOnce(home);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to attach the patch settings", ex);
        }
    }

    /**
     * Injection point: start of QWebViewController.initWebView. Lets the "Quora patches" entry on
     * Quora's settings page open this dialog. The only thing a page can do with it is open the dialog.
     */
    public static void bind(WebView webView) {
        if (webView == null) return;
        try {
            webView.addJavascriptInterface(new Bridge(webView), "JoFSlashPatches");
        } catch (Exception ex) {
            Log.e(TAG, "Failed to add the settings bridge", ex);
        }
    }

    private static final class Bridge {
        private final java.lang.ref.WeakReference<WebView> webView;

        Bridge(WebView webView) {
            this.webView = new java.lang.ref.WeakReference<>(webView);
        }

        @android.webkit.JavascriptInterface
        public void openSettings() {
            WebView view = webView.get();
            if (view != null) view.post(() -> show(view.getContext()));
        }

        /** For Copy answer text: puts the answer's text on the clipboard. */
        @android.webkit.JavascriptInterface
        public void copyText(String text) {
            WebView view = webView.get();
            if (view == null || text == null) return;
            view.post(() -> {
                try {
                    Context context = view.getContext();
                    android.content.ClipboardManager clipboard = (android.content.ClipboardManager)
                            context.getSystemService(Context.CLIPBOARD_SERVICE);
                    clipboard.setPrimaryClip(android.content.ClipData.newPlainText("Quora answer", text));
                    Toast.makeText(context, "Answer copied", Toast.LENGTH_SHORT).show();
                } catch (Exception ex) {
                    Log.e(TAG, "Failed to copy the answer", ex);
                }
            });
        }
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a "Morphe" section with a
     * "Quora patches" entry to Quora's settings page, made from a copy of one of its own sections.
     */
    public static void settingsEntry(WebView webView) {
        if (webView == null) return;
        String url = webView.getUrl();
        if (url == null || !url.matches("https://www\\.quora\\.com/settings/?(\\?.*)?")) return;
        webView.evaluateJavascript("(function(){"
                + "if(window.__jofslashEntry)return;window.__jofslashEntry=1;"
                + "function leaf(t){var l=document.querySelectorAll('.q-text');for(var i=0;i<l.length;i++)"
                + "if(!l[i].children.length&&l[i].textContent.trim()===t)return l[i];return null;}"
                + "function add(){if(document.getElementById('jofslash-entry'))return;"
                // The "Quora+ & Space Subscriptions" section: a header and one row.
                + "var row=leaf('Subscriptions & Billing');if(!row)return;"
                + "var section=row.closest('.qu-gutterBottom');if(!section||!section.parentElement)return;"
                + "var copy=section.cloneNode(true);copy.id='jofslash-entry';"
                + "var texts=copy.querySelectorAll('.q-text');var header=null,item=null;"
                + "for(var i=0;i<texts.length;i++){var t=texts[i].textContent.trim();"
                + "if(t==='Quora+ & Space Subscriptions')header=texts[i];if(t==='Subscriptions & Billing')item=texts[i];}"
                + "if(!header||!item)return;header.textContent='Morphe';item.textContent='Quora patches';"
                + "copy.querySelector('[role=\"listitem\"]').addEventListener('click',function(ev){"
                + "ev.preventDefault();ev.stopPropagation();"
                + "if(window.JoFSlashPatches)window.JoFSlashPatches.openSettings();},true);"
                + "section.parentElement.insertBefore(copy,section.nextSibling);}"
                + "add();new MutationObserver(add).observe(document.documentElement,{childList:true,subtree:true});"
                + "})();", null);
    }

    /** Long-pressing Home is hard to discover, so the first start after patching says so once. */
    private static void showHintOnce(View home) {
        // The app's context: the activity may be replaced while the app starts, which cancels its toasts.
        Context context = home.getContext().getApplicationContext();
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (prefs.getBoolean("hint_shown", false)) return;
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
            Toast.makeText(context, "Quora patches: change them in Settings > Morphe, or long-press the Home tab.",
                    Toast.LENGTH_LONG).show();
            prefs.edit().putBoolean("hint_shown", true).apply();
        }, 6000);
    }

    private static void show(Context context) {
        Activity activity = activity(context);
        if (activity == null) return;
        SettingsPage.open(activity, activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE));
    }

    /** Options that can be changed in the settings: key to {@link Choice}. */
    private static final Map<String, Choice> CHOICES = new LinkedHashMap<>();

    /** One option of a patch, such as the text size, with the values it can take. */
    static final class Choice {
        final String parent, key, name, patched;
        final String[] labels, values;
        final boolean multi;

        Choice(String parent, String key, String name, String patched, String[] labels, String[] values, boolean multi) {
            this.parent = parent;
            this.key = key;
            this.name = name;
            this.patched = patched;
            this.labels = labels;
            this.values = values;
            this.multi = multi;
        }

        /** The labels of the values picked, for the row in the settings. */
        String summary(String value) {
            List<String> picked = new ArrayList<>();
            List<String> chosen = java.util.Arrays.asList((value == null ? "" : value).split(","));
            for (int i = 0; i < values.length; i++) if (chosen.contains(values[i])) picked.add(labels[i]);
            return picked.isEmpty() ? (multi ? "None" : value) : android.text.TextUtils.join(", ", picked);
        }
    }

    /**
     * Called by patches with an option that can also be changed in the settings.
     *
     * @param parent  The key of the patch's switch; the option shows under it.
     * @param patched The value chosen when patching, used until one is picked in the settings.
     * @param multi   Whether several values can be picked; they are kept separated by commas.
     * @return The value picked in the settings, or the one chosen when patching.
     */
    static String choice(String parent, String key, String name, String patched,
                         String[] labels, String[] values, boolean multi) {
        synchronized (CHOICES) {
            if (!CHOICES.containsKey(key)) {
                CHOICES.put(key, new Choice(parent, key, name, patched == null ? "" : patched, labels, values, multi));
            }
        }
        Context context = context();
        if (context == null) return patched;
        try {
            return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString("opt_" + key, patched);
        } catch (Exception ex) {
            return patched;
        }
    }

    static Map<String, Choice> choices() {
        synchronized (CHOICES) {
            return new LinkedHashMap<>(CHOICES);
        }
    }

    /** The switches that can be changed, key to name, in the order they first ran. */
    static Map<String, String> switches() {
        synchronized (PATCHES) {
            return new LinkedHashMap<>(PATCHES);
        }
    }

    /** The filter fields: key to {name, value baked in when patching}. */
    static Map<String, String[]> texts() {
        synchronized (TEXTS) {
            return new LinkedHashMap<>(TEXTS);
        }
    }

    /** Page patches are added when a page loads, so reloading the app's pages applies the new settings. */
    static void reload() {
        List<WebView> webViews;
        synchronized (WEB_VIEWS) {
            webViews = new ArrayList<>(WEB_VIEWS.keySet());
        }
        for (WebView webView : webViews) {
            try {
                webView.reload();
            } catch (Exception ex) {
                Log.e(TAG, "Failed to reload", ex);
            }
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
