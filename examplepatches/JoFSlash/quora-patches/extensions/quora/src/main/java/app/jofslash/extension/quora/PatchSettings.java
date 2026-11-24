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
        boolean on = prefs == null || prefs.getBoolean(key, true);
        // Selectors downloaded by Filter updates for this patch, if any.
        if (on) FilterUpdates.apply(webView, key);
        return on;
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
            FilterUpdates.check(home.getContext());
            UpdateCheck.check(home.getContext());
            AuthorLists.check(home.getContext(), false);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to attach the patch settings", ex);
        }
    }

    // A key made new at every start. The page scripts get it through bridgeScript(), which runs in
    // the page's own frame only; frames from other sites inside a page (videos, embeds) can see the
    // interface too, but can't use it without the key.
    private static final String KEY = newKey();

    private static String newKey() {
        byte[] bytes = new byte[18];
        new java.security.SecureRandom().nextBytes(bytes);
        StringBuilder key = new StringBuilder();
        for (byte b : bytes) key.append(String.format(java.util.Locale.ROOT, "%02x", b));
        return key.toString();
    }

    private static boolean allowed(String key) {
        return KEY.equals(key);
    }

    /**
     * window.JoFSlashPatches for the page scripts: the bridge's methods with the key filled in.
     * Put it at the start of every script that uses the bridge.
     */
    static String bridgeScript() {
        if (bridgeScript == null) bridgeScript = makeBridgeScript();
        return bridgeScript;
    }

    private static String bridgeScript;

    private static String makeBridgeScript() {
        StringBuilder names = new StringBuilder();
        for (java.lang.reflect.Method m : Bridge.class.getDeclaredMethods()) {
            if (!m.isAnnotationPresent(android.webkit.JavascriptInterface.class)) continue;
            if (names.length() > 0) names.append(',');
            names.append('\'').append(m.getName()).append('\'');
        }
        // The bridge is looked up at each call: a page can run our scripts before it is there.
        return "(function(k){if(window.JoFSlashPatches)return;var o={};"
                + "[" + names + "].forEach(function(n){o[n]=function(){var B=window.JoFSlashBridge;"
                + "if(!B||!B[n])throw new Error('JoFSlashBridge not ready');"
                + "return B[n].apply(B,[k].concat([].slice.call(arguments)));};});"
                + "o.ready=function(){return !!window.JoFSlashBridge;};"
                + "Object.defineProperty(window,'JoFSlashPatches',{value:Object.freeze(o)});})('" + KEY + "');";
    }

    /**
     * Injection point: start of QWebViewController.initWebView. Lets the "Quora patches" entry on
     * Quora's settings page open this dialog. Pages can also use it for Copy and Share answer text,
     * Sort answers, Reading history, Bookmarks and Hide dismissed questions. Every call needs the key
     * (see bridgeScript), so only our own scripts in Quora's page can use it.
     */
    public static void bind(WebView webView) {
        if (webView == null) return;
        try {
            webView.addJavascriptInterface(new Bridge(webView), "JoFSlashBridge");
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
        public void openSettings(String key) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view != null) view.post(() -> show(view.getContext()));
        }

        /** For Copy answer text: puts the answer's text on the clipboard. */
        @android.webkit.JavascriptInterface
        public void copyText(String key, String text) {
            if (!allowed(key)) return;
            copy(text, Texts.t("Answer copied"), Toast.LENGTH_SHORT);
        }

        /** For Copy answer text: the feed only has the start of a long answer. */
        @android.webkit.JavascriptInterface
        public void copyPreview(String key, String text) {
            if (!allowed(key)) return;
            copy(text, Texts.t("Copied the preview. Open it to copy all of it."), Toast.LENGTH_LONG);
        }

        private void copy(String text, String message, int length) {
            WebView view = webView.get();
            if (view == null || text == null) return;
            view.post(() -> {
                try {
                    Context context = view.getContext();
                    android.content.ClipboardManager clipboard = (android.content.ClipboardManager)
                            context.getSystemService(Context.CLIPBOARD_SERVICE);
                    clipboard.setPrimaryClip(android.content.ClipData.newPlainText("Quora answer", text));
                    Toast.makeText(context, message, length).show();
                } catch (Exception ex) {
                    Log.e(TAG, "Failed to copy the answer", ex);
                }
            });
        }

        /** For Share answer text: opens the share sheet with the answer's text. */
        @android.webkit.JavascriptInterface
        public void shareText(String key, String text) {
            if (!allowed(key)) return;
            share(text, null);
        }

        /** For Share answer text: the feed only has the start of a long answer. */
        @android.webkit.JavascriptInterface
        public void sharePreview(String key, String text) {
            if (!allowed(key)) return;
            share(text, Texts.t("Sharing the preview. Open it to share all of it."));
        }

        private void share(String text, String message) {
            WebView view = webView.get();
            if (view == null || text == null || text.trim().isEmpty()) return;
            view.post(() -> {
                try {
                    if (message != null) Toast.makeText(view.getContext(), message, Toast.LENGTH_LONG).show();
                    android.content.Intent send = new android.content.Intent(android.content.Intent.ACTION_SEND);
                    send.setType("text/plain");
                    send.putExtra(android.content.Intent.EXTRA_TEXT, text.trim());
                    android.content.Intent chooser = android.content.Intent.createChooser(send, "Share answer text");
                    Context context = view.getContext();
                    if (!(context instanceof android.app.Activity)) {
                        chooser.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                    }
                    context.startActivity(chooser);
                } catch (Exception ex) {
                    Log.e(TAG, "Failed to share the answer", ex);
                }
            });
        }

        /**
         * For Translate button: shows the text translated on Google Translate's site, in a page
         * inside the app, into the phone's language.
         */
        @android.webkit.JavascriptInterface
        public void translateText(String key, String text) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view == null || text == null || text.trim().isEmpty()) return;
            String value = text.trim();
            view.post(() -> TranslatePage.show(view.getContext(), value));
        }

        /** For Sort answers: the next sort menu the page opens picks this order instead of showing. */
        @android.webkit.JavascriptInterface
        public void sortNext(String key, String order) {
            if (!allowed(key)) return;
            ReadingPatch.requestSort(order);
        }

        /** For Reading history: remembers an answer, post or question you opened. Only quora.com links. */
        @android.webkit.JavascriptInterface
        public void addHistory(String key, String url, String title, String author) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view == null) return;
            ReadingHistory.HISTORY.add(view.getContext().getApplicationContext(), url, title, author);
        }

        /** For Hide dismissed questions: you marked this question "Not interested in this question". */
        @android.webkit.JavascriptInterface
        public void dismissQuestion(String key, String title) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view == null || title == null || title.trim().isEmpty()) return;
            String clean = title.trim().replaceAll("\\s+", " ");
            ReadingHistory.DISMISSED.add(view.getContext().getApplicationContext(),
                    ReadingHistory.questionSearchUrl(clean), clean, "");
        }

        /** For Hide dismissed questions: you tapped Undo. */
        @android.webkit.JavascriptInterface
        public void undismissQuestion(String key, String title) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view == null || title == null) return;
            ReadingHistory.DISMISSED.remove(view.getContext().getApplicationContext(),
                    ReadingHistory.questionSearchUrl(title));
        }

        /** For Hide dismissed questions: the titles to hide, in lower case, as a JSON array. */
        @android.webkit.JavascriptInterface
        public String dismissedQuestions(String key) {
            if (!allowed(key)) return "[]";
            WebView view = webView.get();
            org.json.JSONArray titles = new org.json.JSONArray();
            if (view == null) return titles.toString();
            for (ReadingHistory.Item item : ReadingHistory.DISMISSED.load(view.getContext().getApplicationContext())) {
                titles.put(item.title.toLowerCase(java.util.Locale.ROOT));
            }
            return titles.toString();
        }

        /** For Bookmarks: whether this answer or post is saved. Only says yes or no for one quora.com link. */
        @android.webkit.JavascriptInterface
        public boolean isBookmarked(String key, String url) {
            if (!allowed(key)) return false;
            WebView view = webView.get();
            if (view == null || !ReadingHistory.isQuoraUrl(url)) return false;
            return ReadingHistory.BOOKMARKS.contains(view.getContext().getApplicationContext(), url);
        }

        /** For Bookmarks: saves or removes this answer or post. Returns whether it is saved now. */
        @android.webkit.JavascriptInterface
        public boolean toggleBookmark(String key, String url, String title, String author) {
            if (!allowed(key)) return false;
            WebView view = webView.get();
            if (view == null || !ReadingHistory.isQuoraUrl(url)) return false;
            Context context = view.getContext().getApplicationContext();
            boolean adding = !ReadingHistory.BOOKMARKS.contains(context, url);
            boolean saved = adding && ReadingHistory.BOOKMARKS.add(context, url, title, author);
            if (!adding) ReadingHistory.BOOKMARKS.remove(context, url);
            String message = saved ? Texts.t("Saved to Bookmarks")
                    : !adding ? Texts.t("Removed from Bookmarks")
                    : Texts.t("Bookmarks are full. Remove some in Patch settings first.");
            view.post(() -> Toast.makeText(view.getContext(), message,
                    saved || !adding ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG).show());
            return saved;
        }

        /**
         * For Bookmarks: keeps the text of a bookmarked answer or post, to read it offline. Only for
         * pages that are bookmarked, so a page can't fill the storage. Returns whether it was saved.
         */
        @android.webkit.JavascriptInterface
        public boolean saveOffline(String key, String url, String title, String author, String text) {
            if (!allowed(key)) return false;
            WebView view = webView.get();
            if (view == null) return false;
            Context context = view.getContext().getApplicationContext();
            if (!ReadingHistory.BOOKMARKS.contains(context, url)) return false;
            return OfflineCopies.save(context, url, title, author, text);
        }

        /** For Bookmarks: the pictures of a bookmarked page, kept with its offline copy. */
        @android.webkit.JavascriptInterface
        public void saveOfflineImages(String key, String url, String json) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view != null) OfflineCopies.saveImages(view.getContext(), url, json);
        }

        /**
         * For Read aloud: reads the text out loud, or stops. Returns whether it is reading now.
         *
         * @param preview Whether the text is the start of a shortened answer in the feed.
         * @param stop    Whether the tap was on the button that is reading (then it only stops).
         */
        @android.webkit.JavascriptInterface
        public boolean readAloud(String key, String text, boolean preview, boolean stop) {
            if (!allowed(key)) return false;
            WebView view = webView.get();
            if (view == null) return false;
            return ReadAloud.toggle(view, text,
                    preview ? Texts.t("Reading the preview. Open it to hear all of it.") : null, stop);
        }

        /** For Block authors and Spaces: you long-pressed this name; asks whether to hide everything by them. */
        @android.webkit.JavascriptInterface
        public void blockAuthor(String key, String name) {
            if (!allowed(key) || name == null) return;
            String clean = name.replaceAll("[,\\s]+", " ").trim();
            WebView view = webView.get();
            if (view == null || clean.isEmpty() || clean.length() > 80) return;
            view.post(() -> askBlockAuthor(view, clean));
        }

        /** For the hidden counts in Patch settings: what this page hid since it last said, as {"ads":2,…}. */
        @android.webkit.JavascriptInterface
        public void countHidden(String key, String json) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view != null) HiddenStats.add(view.getContext(), json);
        }

        /**
         * For Hide what you pick: the page marked a box; asks whether to hide it and every box with
         * the same class. An empty class means nothing at the tapped spot can be hidden this way.
         */
        @android.webkit.JavascriptInterface
        public void pickHide(String key, String className, int count, int level, int total) {
            if (!allowed(key)) return;
            WebView view = webView.get();
            if (view != null) view.post(() -> Picker.ask(view, className, count, level, total));
        }

        /** For Reader view: shows this answer or post as plain text with its pictures, in the app's own page. */
        @android.webkit.JavascriptInterface
        public void openReader(String key, String title, String author, String text, String images, boolean preview) {
            if (!allowed(key) || text == null || text.trim().isEmpty()) return;
            WebView view = webView.get();
            if (view == null) return;
            view.post(() -> SettingsPage.reader(view.getContext(), title, author, text, images, preview));
        }

        /** For Read aloud: whether it is still reading, so the page can reset its button. */
        @android.webkit.JavascriptInterface
        public boolean isReadingAloud(String key) {
            return allowed(key) && ReadAloud.isSpeaking();
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
        webView.evaluateJavascript(bridgeScript() + "(function(){"
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

    /**
     * The first start after patching offers the presets once, which also says where the settings
     * are: long-pressing Home is hard to discover. Apps that already showed the old hint skip it, so
     * an update never changes switches someone set.
     */
    private static void showHintOnce(View home) {
        // The app's context: the activity may be replaced while the app starts, which cancels its toasts.
        Context context = home.getContext().getApplicationContext();
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (prefs.getBoolean("hint_shown", false)) return;
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
            if (prefs.getBoolean("hint_shown", false)) return;
            Activity activity = activity(home.getContext());
            boolean asked = false;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed() && home.isAttachedToWindow()) {
                try {
                    Presets.ask(activity, prefs, true);
                    asked = true;
                } catch (Exception ex) {
                    Log.e(TAG, "Failed to offer the presets", ex);
                }
            }
            if (!asked) {
                Toast.makeText(context, Texts.t("Quora patches: change them in Settings > Morphe, or long-press the Home tab."),
                        Toast.LENGTH_LONG).show();
            }
            prefs.edit().putBoolean("hint_shown", true).apply();
        }, 6000);
    }

    /**
     * Asks whether to hide everything by a name you long-pressed, and adds it to the Authors and
     * Spaces filter. The page hides their items at once; other pages do on their next load.
     */
    private static void askBlockAuthor(WebView view, String name) {
        Activity activity = activity(view.getContext());
        SharedPreferences prefs = prefs(view);
        if (activity == null || prefs == null || activity.isFinishing()) return;
        boolean dark = (activity.getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        try {
            new android.app.AlertDialog.Builder(activity, dark
                    ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                    : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                    .setTitle(Texts.t("Hide everything by ") + name + "?")
                    .setMessage(Texts.t("Their answers and posts won't show in the feed or on question pages. You can remove the name again in Patch settings > More > Filters."))
                    .setPositiveButton(Texts.t("Hide"), (d, w) -> {
                        addAuthor(prefs, name);
                        view.evaluateJavascript("window.__jofslashAuthorsAdd&&window.__jofslashAuthorsAdd("
                                + org.json.JSONObject.quote(name) + ")", null);
                        Toast.makeText(activity, name + ": " + Texts.t("hidden."), Toast.LENGTH_SHORT).show();
                    })
                    .setNegativeButton(Texts.t("Cancel"), null)
                    .show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to ask about blocking an author", ex);
        }
    }

    /** Adds a name to the Authors and Spaces filter, unless it is there already. */
    static void addAuthor(SharedPreferences prefs, String name) {
        String[] text;
        synchronized (TEXTS) {
            text = TEXTS.get("authors");
        }
        String current = prefs.getString("authors", text == null ? "" : text[1]);
        for (String part : current.split(",")) {
            if (part.trim().equalsIgnoreCase(name)) return;
        }
        String joined = current.trim().isEmpty() ? name : current.trim().replaceAll(",\\s*$", "") + ", " + name;
        prefs.edit().putString("authors", joined).putBoolean("blockAuthors", true).apply();
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
            for (int i = 0; i < values.length; i++) if (chosen.contains(values[i])) picked.add(Texts.t(labels[i]));
            return picked.isEmpty() ? (multi ? Texts.t("None") : value) : android.text.TextUtils.join(", ", picked);
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

    /** The app's WebViews that are still there. */
    static List<WebView> webViews() {
        synchronized (WEB_VIEWS) {
            return new ArrayList<>(WEB_VIEWS.keySet());
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

    static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
