package app.hushfeed.verification;

import android.app.Application;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Reaches Hushfeed's own settings on a phone, for the device checks in Roadmap_Blocked.md.
 *
 * <p>Hushfeed hangs its settings screen off TikTok's ad personalisation activity, which is not
 * exported, so adb cannot start it and the row that leads to it sits inside TikTok's Settings and
 * privacy. On an account TikTok has asked to answer a content-reuse migration, that page cannot be
 * opened without answering, and that answer is the account owner's to give. This runs inside
 * TikTok's own process instead, where starting the activity and reading or writing a setting are
 * ordinary calls.
 *
 * <h2>Why the work does not happen in onCreate</h2>
 *
 * <p>The obvious shape, do the work in {@link #onCreate} and answer through {@code am instrument
 * -w}, does not run at all on this target. TikTok replaces the thread's Instrumentation with its
 * own: the clean 46.2.3 build reflects on {@code mInstrumentation} in eight places, among them
 * {@code SharedPreferencesManager.hookInstrumentation} and {@code BTMInstrumentationProxy.hook},
 * and its replacement does not pass onCreate on. So nothing after the swap is a reliable entry
 * point, and there is no result bundle to answer with either.
 *
 * <p>{@link #newApplication} is before the swap. The framework calls it while it is building the
 * Application, which is what runs the app's own attachBaseContext, so it is the last callback that
 * is certainly still this class. That starts a thread, the thread waits for Hushfeed to have a
 * context, and then it registers a receiver. Everything after that arrives as a broadcast and is
 * answered in the log, because the instrumentation has no way back to the shell by then.
 *
 * <p>Nothing here is part of the bundle. It is a test tool, it is signed with the same key as the
 * sideloaded build so the platform lets it in, and it should be uninstalled when the checks are
 * done.
 *
 * <pre>
 *   adb -s S shell am instrument app.hushfeed.verification/.Probe
 *   adb -s S shell am broadcast -a app.hushfeed.verification.PROBE -p com.zhiliaoapp.musically \
 *       -e action dump
 *       -e action labrule -e manager abmock -e key favorite_reverse -e type INT -e value 1
 *       -e action labclear
 *   adb -s S logcat -d | grep HushfeedProbe
 * </pre>
 */
public final class Probe extends Instrumentation {

    static final String TAG = "HushfeedProbe";
    private static final String ACTION = "app.hushfeed.verification.PROBE";
    private static final String SETTING = "app.morphe.extension.shared.settings.Setting";
    private static final String SETTINGS = "app.morphe.extension.tiktok.settings.Settings";
    private static final String UTILS = "app.morphe.extension.shared.Utils";
    private static final String SETTINGS_ACTIVITY =
            "com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization."
                    + "AdPersonalizationActivity";
    /** How long to let TikTok finish starting before giving up on it. */
    private static final long READY_TIMEOUT_MS = 120_000L;

    private static volatile boolean started;

    @Override
    public Application newApplication(ClassLoader loader, String className, Context context)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        Log.i(TAG, "newApplication " + className);
        Application application = super.newApplication(loader, className, context);
        listen(application);
        return application;
    }

    @Override
    public void onCreate(Bundle arguments) {
        // Reached only if the app leaves the thread's instrumentation alone, which this one does
        // not. Kept because it costs nothing and says in the log which path a build took.
        Log.i(TAG, "onCreate");
        super.onCreate(arguments);
        start();
    }

    @Override
    public void onStart() {
        Log.i(TAG, "onStart");
    }

    /** Waits for Hushfeed, then takes instructions by broadcast for as long as the app lives. */
    private static synchronized void listen(final Context context) {
        if (started) return;
        started = true;
        Thread worker = new Thread(new Runnable() {
            @Override public void run() {
                try {
                    ClassLoader loader = waitForHushfeed(context);
                    IntentFilter filter = new IntentFilter(ACTION);
                    BroadcastReceiver receiver = new Commands(context, loader);
                    // The sender is adb, which is another uid, so the receiver has to be
                    // exported. Exported to everything, any app on the phone could drive
                    // Hushfeed's settings for as long as the probe is loaded, so the sender is
                    // held to a permission only the shell and the platform can carry: DUMP is
                    // signature-or-privileged, the shell requests it for dumpsys, and no app
                    // from a store can be granted it. Root passes every permission check.
                    // Asking the broadcast who sent it does not work here: the public
                    // getSentFromUid answers -1 for the shell, whose package TikTok cannot see.
                    if (Build.VERSION.SDK_INT >= 33) {
                        context.registerReceiver(
                                receiver, filter, SENDER_PERMISSION, null, Context.RECEIVER_EXPORTED);
                    } else {
                        context.registerReceiver(receiver, filter, SENDER_PERMISSION, null);
                    }
                    Log.i(TAG, "ready");
                } catch (Throwable error) {
                    Log.e(TAG, "probe could not start", error);
                }
            }
        }, "hushfeed-probe");
        worker.setDaemon(true);
        worker.start();
    }

    /**
     * Blocks until Hushfeed has a context, and answers with the class loader that has it.
     *
     * <p>This runs while the application is still being built, so the extension's classes are
     * loadable well before any of them has been initialised. Waiting on the context is waiting on
     * the thing every setting read needs.
     */
    private static ClassLoader waitForHushfeed(Context context) throws Exception {
        ClassLoader loader = context.getClassLoader();
        Method getContext;
        try {
            getContext = loader.loadClass(UTILS).getMethod("getContext");
        } catch (ClassNotFoundException absent) {
            // The one message this method exists to produce, and it was unreachable: loadClass
            // throws before the wait ever starts, so an unpatched build got a raw stack trace.
            throw new IllegalStateException("no Hushfeed in this build; is it patched?", absent);
        }
        long deadline = System.currentTimeMillis() + READY_TIMEOUT_MS;
        while (System.currentTimeMillis() < deadline) {
            if (getContext.invoke(null) != null) return loader;
            Thread.sleep(250L);
        }
        throw new IllegalStateException("Hushfeed never took a context; is this build patched?");
    }

    /** The permission a sender has to hold: the shell has it, an app from a store cannot. */
    private static final String SENDER_PERMISSION = "android.permission.DUMP";

    /** One broadcast, one action, one line in the log. */
    private static final class Commands extends BroadcastReceiver {
        private final Context app;
        private final ClassLoader loader;

        Commands(Context app, ClassLoader loader) {
            this.app = app;
            this.loader = loader;
        }

        @Override
        public void onReceive(Context context, Intent intent) {
            // Who may send is settled where the receiver is registered, by the permission the
            // sender has to hold. Nothing here needs to ask again.
            String action = intent.getStringExtra("action");
            if (action == null) action = "dump";
            try {
                switch (action) {
                    case "settings":
                        openSettings();
                        Log.i(TAG, "ok settings opened");
                        break;
                    case "dump":
                        Log.i(TAG, "ok dump\n" + dump());
                        break;
                    case "refresh-shortcuts":
                        refreshShortcuts();
                        Log.i(TAG, "ok refresh-shortcuts asked for");
                        break;
                    case "comments":
                        Log.i(TAG, "ok comments\n" + openCommentsReport());
                        break;
                    case "feed":
                        Log.i(TAG, "ok feed\n" + feedReport());
                        break;
                    case "ad-evidence":
                        // Technical booleans only. Never emit the video id, creator, visible
                        // disclosure text or the raw anchors JSON into device evidence.
                        Log.i(TAG, "ok ad-evidence\n" + adEvidence());
                        break;
                    case "ad-boundary":
                        Log.i(TAG, "ok ad-boundary\n" + adBoundary());
                        break;
                    case "location-evidence":
                        Log.i(TAG, "ok location-evidence\n" + locationEvidence(intent.getStringExtra("aid")));
                        break;
                    case "banner-evidence":
                        Log.i(TAG, "ok banner-evidence\n" + bannerEvidence(intent.getStringExtra("aid")));
                        break;
                    case "webviews": {
                        // Which page a WebView is showing and what it was built with. Hosts and
                        // paths only: a query can carry tokens, so it is never printed.
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        StringBuilder out = new StringBuilder();
                        if (activity != null) {
                            out.append("activity=").append(activity.getClass().getName());
                            android.net.Uri data = activity.getIntent() == null ? null : activity.getIntent().getData();
                            out.append("\nintentData=").append(hostAndPath(data));
                            if (data != null && data.isHierarchical()) {
                                String inner = data.getQueryParameter("url");
                                out.append("\nintentUrlParam=").append(inner == null ? "none"
                                        : hostAndPath(android.net.Uri.parse(inner)));
                            }
                            android.os.Bundle extras = activity.getIntent() == null ? null : activity.getIntent().getExtras();
                            out.append("\nextraKeys=").append(extras == null ? "none" : String.valueOf(extras.keySet()));
                        }
                        for (android.view.View root : windowRoots()) {
                            java.util.ArrayDeque<android.view.View> queue = new java.util.ArrayDeque<>();
                            queue.add(root);
                            while (!queue.isEmpty()) {
                                android.view.View view = queue.poll();
                                if (view instanceof android.webkit.WebView) {
                                    android.webkit.WebView web = (android.webkit.WebView) view;
                                    out.append("\nwebview=").append(web.getClass().getName())
                                            .append(" url=").append(hostAndPath(web.getUrl() == null
                                                    ? null : android.net.Uri.parse(web.getUrl())))
                                            .append(" context=");
                                    Context holder = web.getContext();
                                    for (int depth = 0; holder != null && depth < 6; depth++) {
                                        out.append(holder.getClass().getName()).append(" > ");
                                        if (holder instanceof android.app.Activity) {
                                            Intent hosting = ((android.app.Activity) holder).getIntent();
                                            android.net.Uri hostData = hosting == null ? null : hosting.getData();
                                            out.append("[data=").append(hostAndPath(hostData));
                                            if (hostData != null && hostData.isHierarchical()
                                                    && hostData.getQueryParameter("url") != null) {
                                                out.append(" urlParam=").append(hostAndPath(
                                                        android.net.Uri.parse(hostData.getQueryParameter("url"))));
                                            }
                                            android.os.Bundle held = hosting == null ? null : hosting.getExtras();
                                            if (held != null) {
                                                for (String key : held.keySet()) {
                                                    Object value = held.get(key);
                                                    out.append(' ').append(key).append('=');
                                                    String text = value instanceof String ? (String) value : null;
                                                    out.append(text != null && text.contains("://")
                                                            ? hostAndPath(android.net.Uri.parse(text))
                                                            : value == null ? "null" : value.getClass().getName());
                                                }
                                            }
                                            out.append("] ");
                                        }
                                        holder = holder instanceof android.content.ContextWrapper
                                                ? ((android.content.ContextWrapper) holder).getBaseContext() : null;
                                    }
                                }
                                if (view instanceof android.view.ViewGroup) {
                                    android.view.ViewGroup group = (android.view.ViewGroup) view;
                                    for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
                                }
                            }
                        }
                        Log.i(TAG, "ok webviews\n" + out);
                        break;
                    }
                    case "webview-bridges": {
                        // BrowserPrivacyGuard keeps the objects so it can restore them on the
                        // next trusted page. Read only their registered names, then ask the live
                        // page which names resolve. The probe never calls a bridge or reads page
                        // content. Interface names are technical APK anchors, not account data.
                        Class<?> guard = loader.loadClass(
                                "app.morphe.extension.tiktok.privacy.BrowserPrivacyGuard");
                        Field statesField = guard.getDeclaredField("STATES");
                        statesField.setAccessible(true);
                        Map<?, ?> states = (Map<?, ?>) statesField.get(null);
                        int scheduled = 0;
                        for (android.view.View root : windowRoots()) {
                            java.util.ArrayDeque<android.view.View> queue = new java.util.ArrayDeque<>();
                            queue.add(root);
                            while (!queue.isEmpty()) {
                                android.view.View view = queue.poll();
                                if (view instanceof android.webkit.WebView) {
                                    android.webkit.WebView web = (android.webkit.WebView) view;
                                    List<String> names = new ArrayList<>();
                                    Object state = null;
                                    synchronized (states) {
                                        Object reference = states.get(web);
                                        if (reference instanceof java.lang.ref.WeakReference) {
                                            state = ((java.lang.ref.WeakReference<?>) reference).get();
                                        }
                                    }
                                    if (state != null) {
                                        Field interfacesField = state.getClass().getDeclaredField("interfaces");
                                        interfacesField.setAccessible(true);
                                        synchronized (state) {
                                            Map<?, ?> interfaces = (Map<?, ?>) interfacesField.get(state);
                                            for (Object name : interfaces.keySet()) {
                                                if (name instanceof String) names.add((String) name);
                                            }
                                        }
                                    }

                                    StringBuilder script = new StringBuilder(
                                            "(function(){var n=[");
                                    for (int i = 0; i < names.size(); i++) {
                                        if (i > 0) script.append(',');
                                        script.append(JSONObject.quote(names.get(i)));
                                    }
                                    script.append("];var exposed=[];for(var i=0;i<n.length;i++){"
                                            + "if(typeof window[n[i]]!=='undefined'){var v=window[n[i]],k=[];"
                                            + "try{k=Object.getOwnPropertyNames(v).sort();}catch(e){}"
                                            + "exposed.push([n[i],typeof v,Object.prototype.toString.call(v),k]);}}"
                                            + "return JSON.stringify(exposed);})()");
                                    final int index = ++scheduled;
                                    final int tracked = names.size();
                                    final String origin = hostAndPath(web.getUrl() == null
                                            ? null : android.net.Uri.parse(web.getUrl()));
                                    final String javascript = script.toString();
                                    web.post(() -> web.evaluateJavascript(javascript, value ->
                                            Log.i(TAG, "bridge-exposure webview=" + index
                                                    + " origin=" + origin + " tracked=" + tracked
                                                    + " exposed=" + value)));
                                }
                                if (view instanceof android.view.ViewGroup) {
                                    android.view.ViewGroup group = (android.view.ViewGroup) view;
                                    for (int i = 0; i < group.getChildCount(); i++) {
                                        queue.add(group.getChildAt(i));
                                    }
                                }
                            }
                        }
                        Log.i(TAG, "ok webview-bridges scheduled=" + scheduled);
                        break;
                    }
                    case "series-evidence":
                        Log.i(TAG, "ok series-evidence\n" + seriesEvidence());
                        break;
                    case "marker-corpus": {
                        // One log line per loaded video, so no line nears logcat's size limit.
                        String route = intent.getStringExtra("route");
                        if (route == null || !route.matches("[a-z-]{1,24}")) {
                            throw new IllegalArgumentException("marker-corpus needs a short route name");
                        }
                        List<String> lines = markerCorpus(route);
                        for (String line : lines) Log.i(TAG, "corpus\t" + route + "\t" + line);
                        Log.i(TAG, "ok marker-corpus " + route + " items=" + lines.size());
                        break;
                    }
                    case "marker-token-selftest": {
                        JSONObject tokens = new JSONObject();
                        tokens.put("longNumeral", token("1234567"));
                        tokens.put("leadingPlus", token("+1"));
                        tokens.put("intOverflow", token(4_294_967_296L));
                        tokens.put("doubleEpisode", token(1.0d));
                        tokens.put("blankObject", token(new Object() {
                            @Override public String toString() {
                                return "  ";
                            }
                        }));
                        Log.i(TAG, "ok marker-token-selftest " + tokens);
                        break;
                    }
                    case "commerce-evidence":
                        // Each line is deliberately structural. Strings are represented only by
                        // length, hash and fixed marker booleans so a diagnostic cannot collect
                        // captions, creator names, product names or other visible content.
                        for (String line : commerceEvidence()) {
                            Log.i(TAG, "commerce " + line);
                        }
                        Log.i(TAG, "ok commerce-evidence");
                        break;
                    case "commission-view":
                        for (String line : commissionViewEvidence()) {
                            Log.i(TAG, "commission-view " + line);
                        }
                        Log.i(TAG, "ok commission-view");
                        break;
                    case "video-link":
                        Log.i(TAG, "ok video-link " + copiedTikTokVideoLink());
                        break;
                    case "clear-test-clipboard": {
                        String aid = required(intent, "aid");
                        if (!aid.matches("[0-9]+")) throw new IllegalArgumentException("invalid video id");
                        String copied = copiedTikTokVideoLink();
                        String copiedPath = android.net.Uri.parse(copied).getPath();
                        if (copiedPath != null && copiedPath.endsWith("/video/" + aid)) {
                            android.content.ClipboardManager clipboard = (android.content.ClipboardManager)
                                    app.getSystemService(Context.CLIPBOARD_SERVICE);
                            clipboard.setPrimaryClip(android.content.ClipData.newPlainText("", ""));
                            Log.i(TAG, "ok test clipboard cleared");
                        } else {
                            Log.i(TAG, "test clipboard no longer matches; left unchanged");
                        }
                        break;
                    }
                    case "open-copied-video": {
                        String link = copiedTikTokVideoLink();
                        if (!link.startsWith("https://www.tiktok.com/")) {
                            throw new IllegalStateException("no copied TikTok video URL");
                        }
                        Intent video = new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(link));
                        video.setPackage("com.zhiliaoapp.musically");
                        video.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        app.startActivity(video);
                        Log.i(TAG, "ok open-copied-video");
                        break;
                    }
                    case "open-public-video": {
                        String aid = required(intent, "aid");
                        if (!aid.matches("[0-9]+")) throw new IllegalArgumentException("invalid public video id");
                        Intent video = new Intent(Intent.ACTION_VIEW,
                                android.net.Uri.parse("snssdk1233://aweme/detail/" + aid));
                        video.setPackage("com.zhiliaoapp.musically");
                        video.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        app.startActivity(video);
                        Log.i(TAG, "ok open-public-video");
                        break;
                    }
                    case "open-video": {
                        String user = required(intent, "user");
                        String aid = required(intent, "aid");
                        if (!user.matches("[A-Za-z0-9._]+") || !aid.matches("[0-9]+")) {
                            throw new IllegalArgumentException("invalid public video route");
                        }
                        String link = "https://www.tiktok.com/@" + user + "/video/" + aid;
                        Intent video = new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(link));
                        video.setPackage("com.zhiliaoapp.musically");
                        video.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        app.startActivity(video);
                        Log.i(TAG, "ok open-video");
                        break;
                    }
                    case "hooks": {
                        // HookStatus contains only the names and counts of Hushfeed's own
                        // technical anchors. Keep this separate from the full diagnostic
                        // export so a compatibility pass never has to collect account or
                        // content-linked events just to find a renamed view or member.
                        List<?> lines = (List<?>) loader.loadClass(
                                "app.morphe.extension.shared.diagnostics.HookStatus")
                                .getMethod("report").invoke(null);
                        for (Object line : lines) Log.i(TAG, "hook " + line);
                        Log.i(TAG, "ok hooks " + lines.size());
                        break;
                    }
                    case "hookdetails": {
                        // The names behind each family's counts: which anchors bound and which
                        // were missed. "tako AI: 2 found" cannot say whether the comments bar
                        // guard ran; "comment bar hidden" can. Technical names only, the same
                        // as the counts above. With -e family <name> only that family prints.
                        Class<?> status = loader.loadClass(
                                "app.morphe.extension.shared.diagnostics.HookStatus");
                        Field familiesField = status.getDeclaredField("FAMILIES");
                        familiesField.setAccessible(true);
                        Map<?, ?> families = (Map<?, ?>) familiesField.get(null);
                        String only = intent.getStringExtra("family");
                        List<String> names = new ArrayList<>();
                        for (Object key : families.keySet()) names.add(String.valueOf(key));
                        Collections.sort(names);
                        int printed = 0;
                        for (String name : names) {
                            if (only != null && !only.equals(name)) continue;
                            Object family = families.get(name);
                            Field boundField = family.getClass().getDeclaredField("bound");
                            boundField.setAccessible(true);
                            Field orderField = family.getClass().getDeclaredField("order");
                            orderField.setAccessible(true);
                            StringBuilder line = new StringBuilder("hookdetail ").append(name)
                                    .append(" bound=").append(boundField.get(family));
                            List<?> misses = (List<?>) orderField.get(family);
                            if (!misses.isEmpty()) {
                                line.append(" missed=[");
                                for (int i = 0; i < misses.size(); i++) {
                                    Object miss = misses.get(i);
                                    Field keyField = miss.getClass().getDeclaredField("key");
                                    keyField.setAccessible(true);
                                    if (i > 0) line.append(", ");
                                    line.append(keyField.get(miss));
                                }
                                line.append(']');
                            }
                            Log.i(TAG, line.toString());
                            printed++;
                        }
                        Log.i(TAG, "ok hookdetails " + printed);
                        break;
                    }
                    case "topbar": {
                        // The comment sheet's server-driven top bar components on the current
                        // video, by biz type and component name only: which of them TikTok
                        // offered says whether a guard on one of them could have run at all.
                        // No text, id or url leaves the phone.
                        Class<?> author = loader.loadClass(
                                "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor");
                        Object aweme = author.getMethod("getAweme").invoke(null);
                        if (aweme == null) throw new IllegalStateException("no current video");
                        // The resolver reads AwemeCommentConfig.commentTopBarComponent; the
                        // model's own getCommentTopBarStructList is a different, older list.
                        // Each member is looked up on its own, so a build that renames one
                        // still reports the others rather than nothing at all.
                        Object config = null, components = null, legacy = null;
                        String configState;
                        try {
                            config = aweme.getClass().getMethod("getCommentConfig").invoke(aweme);
                            configState = config == null ? "null" : "present";
                        } catch (NoSuchMethodException missing) {
                            configState = "no getter";
                        }
                        if (config != null) {
                            try {
                                components = config.getClass().getField("commentTopBarComponent").get(config);
                            } catch (NoSuchFieldException missing) {
                                configState += ", no commentTopBarComponent field";
                            }
                        }
                        String legacyState;
                        try {
                            legacy = aweme.getClass().getMethod("getCommentTopBarStructList").invoke(aweme);
                            legacyState = legacy == null ? "null" : String.valueOf(((List<?>) legacy).size());
                        } catch (NoSuchMethodException missing) {
                            legacyState = "no getter";
                        }
                        StringBuilder out = new StringBuilder("config=").append(configState)
                                .append(" legacyList=").append(legacyState)
                                .append(" components=");
                        if (components == null) {
                            out.append("null");
                        } else {
                            List<?> list = (List<?>) components;
                            out.append(list.size());
                            for (Object component : list) {
                                Object bizType = null, name = null;
                                try {
                                    Field field = component.getClass().getField("bizType");
                                    bizType = field.get(component);
                                } catch (NoSuchFieldException ignored) { }
                                try {
                                    Field field = component.getClass().getField("name");
                                    name = field.get(component);
                                } catch (NoSuchFieldException ignored) { }
                                out.append("\n  bizType=").append(bizType).append(" name=").append(name);
                            }
                        }
                        Log.i(TAG, "ok topbar\n" + out);
                        break;
                    }
                    case "videoinfo": {
                        // Technical facts about the current video that decide which surfaces
                        // TikTok offers on it: the caption's language code and whether TikTok
                        // marks the caption as translatable. No caption text, id or creator.
                        Class<?> author = loader.loadClass(
                                "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor");
                        Object aweme = author.getMethod("getAweme").invoke(null);
                        if (aweme == null) throw new IllegalStateException("no current video");
                        Object language = aweme.getClass().getMethod("getDescLanguage").invoke(aweme);
                        Object translatable = aweme.getClass().getMethod("isDescTranslatable").invoke(aweme);
                        Object desc = aweme.getClass().getMethod("getDesc").invoke(aweme);
                        Log.i(TAG, "ok videoinfo descLanguage=" + language
                                + " descTranslatable=" + translatable
                                + " hasDesc=" + (desc != null && String.valueOf(desc).trim().length() > 0));
                        break;
                    }
                    case "textviews": {
                        // Every shown TextView on screen, id or not, with its class chain, place,
                        // size and text length. The caption renderer's text view may carry no id
                        // on a given build, which the views action (ids only) cannot show. The
                        // text itself never leaves the phone.
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        if (activity == null) throw new IllegalStateException("no current activity");
                        StringBuilder out = new StringBuilder();
                        for (android.view.View root : windowRoots()) {
                            walkTextViews(root, 0, out, activity.getResources());
                        }
                        String text = out.toString();
                        int pieces = 0;
                        for (int at = 0; at < text.length(); at += 3000, pieces++) {
                            Log.i(TAG, "textviews[" + pieces + "] " + text.substring(at, Math.min(text.length(), at + 3000)));
                        }
                        Log.i(TAG, "ok textviews " + text.length() + " chars in " + pieces + " pieces");
                        break;
                    }
                    case "doubletap": {
                        // Two taps on TikTok's own window, timed inside the double-tap window.
                        // "input tap" twice from adb spawns a process per tap and lands inside or
                        // outside TikTok's window depending on how busy the phone is, which made
                        // the same check pass and fail on different runs. Dispatching the events
                        // on the main thread pins the timing.
                        float x = Float.parseFloat(required(intent, "x"));
                        float y = Float.parseFloat(required(intent, "y"));
                        String gapText = intent.getStringExtra("gap");
                        long gap = gapText == null ? 90L : Long.parseLong(gapText);
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        if (activity == null) throw new IllegalStateException("no current activity");
                        android.view.View decor = activity.getWindow().getDecorView();
                        tap(decor, x, y);
                        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
                            tap(decor, x, y);
                            Log.i(TAG, "ok doubletap at " + x + "," + y + " gap=" + gap + "ms on "
                                    + activity.getClass().getSimpleName());
                        }, gap);
                        break;
                    }
                    case "report": {
                        // The diagnostic export, which is the extension's own record of what it
                        // did. Logcat is not: the release extension is minified and its Log calls
                        // do not reach the buffer, so this is how a device check reads it. The
                        // log takes about 4 KB a line, so a long export goes out in pieces.
                        String text = String.valueOf(loader.loadClass(
                                "app.morphe.extension.shared.settings.preference.LogBufferManager")
                                .getMethod("buildExportText").invoke(null));
                        int pieces = 0;
                        for (int at = 0; at < text.length(); at += 3000, pieces++) {
                            Log.i(TAG, "report[" + pieces + "] " + text.substring(at, Math.min(text.length(), at + 3000)));
                        }
                        Log.i(TAG, "ok report " + text.length() + " chars in " + pieces + " pieces");
                        break;
                    }
                    case "get": {
                        String key = required(intent, "key");
                        Log.i(TAG, "ok get " + key + "=" + valueOf(find(key)));
                        break;
                    }
                    case "set": {
                        String key = required(intent, "key");
                        String value = required(intent, "value");
                        String before = valueOf(find(key));
                        write(key, value);
                        if ("block_author_button".equals(key)) {
                            loader.loadClass("app.morphe.extension.tiktok.blockauthor.BlockAuthorOverlay")
                                    .getMethod("refresh").invoke(null);
                        }
                        Log.i(TAG, "ok set " + key + " " + before + " -> " + valueOf(find(key)));
                        break;
                    }
                    case "labrule": {
                        // A Feature Gate Lab override, written the way the Lab's own detail page
                        // writes it, with the Lab switched on. Lets a device check force a gate
                        // without driving the Lab's screens: issue #4 was traced to two favourites
                        // gates, and this is how the S22 reproduces them.
                        Class<?> store = loader.loadClass(
                                "app.morphe.extension.tiktok.featuregatelab.FeatureGateLabStore");
                        String manager = required(intent, "manager");
                        String key = required(intent, "key");
                        String type = required(intent, "type");
                        String value = required(intent, "value");
                        boolean enabled = !"false".equals(intent.getStringExtra("enabled"));
                        Object saved = store.getMethod("saveRule", String.class, String.class,
                                String.class, String.class, boolean.class)
                                .invoke(null, manager, key, type, value, enabled);
                        store.getMethod("setMasterEnabled", boolean.class).invoke(null, true);
                        Log.i(TAG, "ok labrule " + manager + " " + key + " " + type + "=" + value
                                + " enabled=" + enabled + " saved=" + saved + " master=on");
                        break;
                    }
                    case "labclear": {
                        Class<?> store = loader.loadClass(
                                "app.morphe.extension.tiktok.featuregatelab.FeatureGateLabStore");
                        store.getMethod("resetAllLabData").invoke(null);
                        Log.i(TAG, "ok labclear");
                        break;
                    }
                    case "views": {
                        // The current activity's view tree, one line per view that carries an
                        // id, with its resource name, visibility, place, size and scale. With
                        // -e find <name> only the views carrying that id name are printed, each
                        // with the chain of id names above it. uiautomator cannot dump TikTok's
                        // feed, and this is how a hider's target ids are checked against what is
                        // really on screen. The log takes about 4 KB a line, so it goes out in
                        // pieces the way the report does.
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        if (activity == null) throw new IllegalStateException("no current activity");
                        String find = intent.getStringExtra("find");
                        StringBuilder out = new StringBuilder();
                        walkViews(activity.getWindow().getDecorView(), 0, find, out, activity.getResources());
                        String text = out.toString();
                        int pieces = 0;
                        for (int at = 0; at < text.length(); at += 3000, pieces++) {
                            Log.i(TAG, "views[" + pieces + "] " + text.substring(at, Math.min(text.length(), at + 3000)));
                        }
                        Log.i(TAG, "ok views " + text.length() + " chars in " + pieces + " pieces");
                        break;
                    }
                    case "tabbadges": {
                        // TikTok's bottom tab icons draw their unread badges through their own
                        // setters (setCountDotText, setCountDotVisibility, setTabDotVisibility),
                        // and the hide switch answers inside those setters. Nothing makes the
                        // server send the test account an unread item on demand, so this calls
                        // the setters the way TikTok does, on every tab icon on screen, and reads
                        // the badge views back half a second later: with the switch off the count
                        // and the dot are visible (0), with it on they stay GONE (8).
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        if (activity == null) throw new IllegalStateException("no current activity");
                        List<android.view.View> icons = new ArrayList<>();
                        collectTabIcons(activity.getWindow().getDecorView(), icons, new java.util.HashMap<>());
                        if (icons.isEmpty()) throw new IllegalStateException("no tab icon with the badge setters on screen");
                        android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
                        main.post(() -> {
                            try {
                                for (android.view.View icon : icons) {
                                    Class<?> type = icon.getClass();
                                    type.getMethod("setCountDotText", String.class).invoke(icon, "7");
                                    type.getMethod("setCountDotVisibility", int.class).invoke(icon, android.view.View.VISIBLE);
                                    type.getMethod("setTabDotVisibility", int.class).invoke(icon, android.view.View.VISIBLE);
                                }
                            } catch (Throwable error) {
                                Log.e(TAG, "failed tabbadges", error);
                                return;
                            }
                            main.postDelayed(() -> {
                                StringBuilder out = new StringBuilder();
                                for (android.view.View icon : icons) {
                                    out.append(" [").append(badgeState(icon, "getCountDotView"))
                                            .append(' ').append(badgeState(icon, "getRedDotVIew")).append(']');
                                }
                                Log.i(TAG, "ok tabbadges " + icons.size() + " icons:" + out);
                            }, 500);
                        });
                        break;
                    }
                    case "block-flow-test": {
                        BlockFlowProbe.run(loader, intent.getStringExtra("value"));
                        break;
                    }
                    case "like-targets": {
                        for (android.view.View root : windowRoots()) readLikeTargets(root);
                        Log.i(TAG, "ok like-targets");
                        break;
                    }
                    case "windowviews": {
                        // Dialogs and bottom sheets can live in a separate WindowManager root.
                        // TikTok 47.0.3's comment sheet leaves MainActivity's own content view
                        // empty while its dialog window is visible, so the ordinary views action
                        // cannot observe or verify its resource anchors. This emits the same
                        // technical-only fields for every root, without text or descriptions.
                        android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                                .getMethod("getActivity").invoke(null);
                        if (activity == null) throw new IllegalStateException("no current activity");
                        String find = intent.getStringExtra("find");
                        java.util.List<android.view.View> roots = windowRoots();
                        StringBuilder out = new StringBuilder();
                        for (int i = 0; i < roots.size(); i++) {
                            android.view.View root = roots.get(i);
                            out.append("root ").append(i).append(' ')
                                    .append(root.getClass().getSimpleName()).append('\n');
                            walkViews(root, 0, find, out, activity.getResources());
                        }
                        String text = out.toString();
                        int pieces = 0;
                        for (int at = 0; at < text.length(); at += 3000, pieces++) {
                            Log.i(TAG, "windowviews[" + pieces + "] "
                                    + text.substring(at, Math.min(text.length(), at + 3000)));
                        }
                        Log.i(TAG, "ok windowviews " + roots.size() + " roots "
                                + text.length() + " chars in " + pieces + " pieces");
                        break;
                    }
                    default:
                        throw new IllegalArgumentException("unknown action: " + action);
                }
            } catch (Throwable error) {
                Log.e(TAG, "failed " + action, error);
            }
        }

        /** Read-only 47.0.3 acceptance data. No comment text, ids or account data is emitted. */
        private void readLikeTargets(android.view.View view) throws Exception {
            if (view.isShown() && "ncu".equals(idName(view, view.getResources()))) {
                int[] position = new int[2];
                view.getLocationOnScreen(position);
                StringBuilder out = new StringBuilder("like-target at=").append(position[0])
                        .append(',').append(position[1]).append(" size=").append(view.getWidth())
                        .append('x').append(view.getHeight());
                android.view.ViewParent parent = view.getParent();
                boolean modelFound = false;
                while (parent instanceof android.view.View) {
                    android.view.View ancestor = (android.view.View) parent;
                    if (!modelFound) {
                        for (Field field : ancestor.getClass().getDeclaredFields()) {
                            if (!field.getType().getName().equals(
                                    "com.ss.android.ugc.aweme.comment.model.Comment")) continue;
                            field.setAccessible(true);
                            Object comment = field.get(ancestor);
                            if (comment != null) {
                                out.append(" liked=").append(comment.getClass()
                                        .getMethod("isUserDigged").invoke(comment));
                                modelFound = true;
                            }
                        }
                    }
                    android.view.TouchDelegate delegate = ancestor.getTouchDelegate();
                    if (delegate != null) {
                        ancestor.getLocationOnScreen(position);
                        out.append(" delegate=").append(delegate.getClass().getName())
                                .append(" hostAt=").append(position[0]).append(',').append(position[1]);
                        if (Build.VERSION.SDK_INT >= 29) {
                            android.view.accessibility.AccessibilityNodeInfo.TouchDelegateInfo info =
                                    delegate.getTouchDelegateInfo();
                            for (int i = 0; i < info.getRegionCount(); i++) {
                                out.append(" localArea=").append(info.getRegionAt(i));
                            }
                        }
                    }
                    parent = parent.getParent();
                }
                Log.i(TAG, out.toString());
            }
            if (view instanceof android.view.ViewGroup) {
                android.view.ViewGroup group = (android.view.ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) readLikeTargets(group.getChildAt(i));
            }
        }

        /** One press and release at a point, delivered the way the window would get it. */
        private static void tap(android.view.View decor, float x, float y) {
            long down = android.os.SystemClock.uptimeMillis();
            android.view.MotionEvent press = android.view.MotionEvent.obtain(
                    down, down, android.view.MotionEvent.ACTION_DOWN, x, y, 0);
            android.view.MotionEvent release = android.view.MotionEvent.obtain(
                    down, down + 30, android.view.MotionEvent.ACTION_UP, x, y, 0);
            try {
                decor.dispatchTouchEvent(press);
                decor.dispatchTouchEvent(release);
            } finally {
                press.recycle();
                release.recycle();
            }
        }

        private String required(Intent intent, String name) {
            String value = intent.getStringExtra(name);
            if (value == null) throw new IllegalArgumentException("-e " + name + " is required");
            return value;
        }

        /** The resource entry name of a view's id, the raw number for an id without one. */
        private static String idName(android.view.View view, android.content.res.Resources resources) {
            int id = view.getId();
            if (id == android.view.View.NO_ID) return null;
            try {
                return resources.getResourceEntryName(id);
            } catch (android.content.res.Resources.NotFoundException missing) {
                return "0x" + Integer.toHexString(id);
            }
        }

        private static void walkTextViews(android.view.View view, int depth, StringBuilder out,
                android.content.res.Resources resources) {
            if (view instanceof android.widget.TextView && view.isShown()
                    && ((android.widget.TextView) view).getText() != null
                    && ((android.widget.TextView) view).getText().length() > 0) {
                int[] where = new int[2];
                view.getLocationOnScreen(where);
                StringBuilder chain = new StringBuilder();
                for (Class<?> c = view.getClass(); c != null && !c.getName().startsWith("android."); c = c.getSuperclass()) {
                    if (chain.length() > 0) chain.append('>');
                    chain.append(c.getSimpleName());
                }
                String id = idName(view, resources);
                android.view.ViewParent parent = view.getParent();
                String parentName = parent instanceof android.view.View
                        ? String.valueOf(idName((android.view.View) parent, resources)) + '/' + parent.getClass().getSimpleName()
                        : "none";
                out.append(depth).append(' ').append(chain)
                        .append(" id=").append(id)
                        .append(" at=").append(where[0]).append(',').append(where[1])
                        .append(" size=").append(view.getWidth()).append('x').append(view.getHeight())
                        .append(" textLength=").append(((android.widget.TextView) view).getText().length())
                        .append(" textSizePx=").append((int) ((android.widget.TextView) view).getTextSize())
                        .append(" parent=").append(parentName)
                        .append('\n');
            }
            if (view instanceof android.view.ViewGroup) {
                android.view.ViewGroup group = (android.view.ViewGroup) view;
                for (int i = 0, count = group.getChildCount(); i < count; i++) {
                    walkTextViews(group.getChildAt(i), depth + 1, out, resources);
                }
            }
        }

        /**
         * Every view in the tree whose class carries both badge setters, which on 46.2.3 and
         * 47.0.3 is the bottom tab icon and nothing else. The answer is cached per class: the
         * tree holds thousands of views and a failed getMethod is an exception each.
         */
        private static void collectTabIcons(android.view.View view, List<android.view.View> icons,
                Map<Class<?>, Boolean> known) {
            Class<?> type = view.getClass();
            Boolean icon = known.get(type);
            if (icon == null) {
                try {
                    type.getMethod("setCountDotVisibility", int.class);
                    type.getMethod("setTabDotVisibility", int.class);
                    icon = true;
                } catch (NoSuchMethodException missing) {
                    icon = false;
                }
                known.put(type, icon);
            }
            if (icon) icons.add(view);
            if (view instanceof android.view.ViewGroup) {
                android.view.ViewGroup group = (android.view.ViewGroup) view;
                for (int i = 0, count = group.getChildCount(); i < count; i++) {
                    collectTabIcons(group.getChildAt(i), icons, known);
                }
            }
        }

        /** "getter=visibility" for one badge view, with its text when it is a TextView. */
        private static String badgeState(android.view.View icon, String getter) {
            try {
                Object badge = icon.getClass().getMethod(getter).invoke(icon);
                if (!(badge instanceof android.view.View)) return getter + "=none";
                android.view.View view = (android.view.View) badge;
                String state = getter + "=" + view.getVisibility();
                if (view instanceof android.widget.TextView) {
                    state += "(" + ((android.widget.TextView) view).getText() + ")";
                }
                return state;
            } catch (Exception error) {
                return getter + "=" + error.getClass().getSimpleName();
            }
        }

        private static void walkViews(android.view.View view, int depth, String find, StringBuilder out,
                android.content.res.Resources resources) {
            String name = idName(view, resources);
            boolean print = find == null ? name != null : find.equals(name);
            if (print) {
                int[] where = new int[2];
                view.getLocationOnScreen(where);
                // The obfuscated class says nothing; the first framework class above it says
                // whether this is an ImageView, a TextView or a plain ViewGroup.
                Class<?> framework = view.getClass();
                while (framework != null && !framework.getName().startsWith("android.")) {
                    framework = framework.getSuperclass();
                }
                out.append(depth).append(' ').append(view.getClass().getSimpleName())
                        .append(" is=").append(framework == null ? "?" : framework.getSimpleName())
                        .append(" id=").append(name)
                        .append(" vis=").append(view.getVisibility())
                        .append(" at=").append(where[0]).append(',').append(where[1])
                        .append(" size=").append(view.getWidth()).append('x').append(view.getHeight())
                        .append(" scale=").append(view.getScaleX());
                if (find != null) {
                    out.append(" shown=").append(view.isShown())
                            .append(" clickable=").append(view.isClickable())
                            .append(" a11y=").append(view.getImportantForAccessibility());
                    out.append(" under=");
                    android.view.ViewParent parent = view.getParent();
                    while (parent instanceof android.view.View) {
                        android.view.View ancestor = (android.view.View) parent;
                        String above = idName(ancestor, resources);
                        out.append(above == null ? ancestor.getClass().getSimpleName() : above)
                                .append("(vis=").append(ancestor.getVisibility())
                                .append(",a11y=").append(ancestor.getImportantForAccessibility())
                                .append(") < ");
                        parent = parent.getParent();
                    }
                }
                out.append('\n');
            }
            if (view instanceof android.view.ViewGroup) {
                android.view.ViewGroup group = (android.view.ViewGroup) view;
                for (int i = 0, count = group.getChildCount(); i < count; i++) {
                    walkViews(group.getChildAt(i), depth + 1, find, out, resources);
                }
            }
        }

        @SuppressWarnings("unchecked")
        private static java.util.List<android.view.View> windowRoots() throws Exception {
            Class<?> globalClass = Class.forName("android.view.WindowManagerGlobal");
            java.lang.reflect.Method getInstance = globalClass.getDeclaredMethod("getInstance");
            getInstance.setAccessible(true);
            Object global = getInstance.invoke(null);
            Object value;
            try {
                java.lang.reflect.Method getWindowViews =
                        globalClass.getDeclaredMethod("getWindowViews");
                getWindowViews.setAccessible(true);
                value = getWindowViews.invoke(global);
            } catch (NoSuchMethodException missingMethod) {
                java.lang.reflect.Field views = globalClass.getDeclaredField("mViews");
                views.setAccessible(true);
                value = views.get(global);
            }
            if (value instanceof java.util.List) {
                return (java.util.List<android.view.View>) value;
            }
            throw new IllegalStateException("WindowManagerGlobal returned no root list");
        }

        /** Opens the settings screen the same way the row inside TikTok's own settings does. */
        private void openSettings() throws Exception {
            Intent intent = new Intent(app, loader.loadClass(SETTINGS_ACTIVITY));
            intent.setAction("morphe_settings");
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            app.startActivity(intent);
        }

        /**
         * Asks TikTok to publish its launcher shortcuts again.
         *
         * <p>Needed because the app publishes them about once, on the first start after an
         * install, and keeps a flag saying it has. The platform carries the published list across
         * a package replace and only rewrites its timestamps, so reinstalling does not exercise
         * the publish path either. Without this there is nothing to watch.
         *
         * <p>The service interface keeps its name; its methods do not. The one wanted is the only
         * one on it taking a scene and a flag, so it is picked by that shape rather than by a
         * name that means nothing and would change with the next build.
         */
        private void refreshShortcuts() throws Exception {
            Class<?> services = loader.loadClass(
                    "com.ss.android.ugc.aweme.framework.services.ServiceManager");
            Object manager = services.getMethod("get").invoke(null);
            Class<?> shortcuts = loader.loadClass(
                    "com.ss.android.ugc.aweme.launcher.service.shortcut.IShortcutService");
            Object service = services.getMethod("getService", Class.class)
                    .invoke(manager, shortcuts);
            if (service == null) throw new IllegalStateException("no IShortcutService");
            Method refresh = null;
            for (Method candidate : shortcuts.getMethods()) {
                Class<?>[] takes = candidate.getParameterTypes();
                if (candidate.getReturnType() == void.class && takes.length == 2
                        && takes[0] == String.class && takes[1] == boolean.class) {
                    if (refresh != null) {
                        throw new IllegalStateException(
                                "IShortcutService has more than one (String, boolean) method, so "
                                        + "the refresh cannot be told apart by its shape any more");
                    }
                    refresh = candidate;
                }
            }
            if (refresh == null) throw new IllegalStateException("no refresh on IShortcutService");
            Log.i(TAG, "refresh is " + refresh.getName());
            refresh.invoke(service, "hushfeed-check", true);
        }

        /**
         * What the double-tap comments action would do right now, and what it sees.
         *
         * <p>The gesture's own path has nothing to say on a phone: a click that lands on a view
         * whose listener does not open the sheet returns true and logs nothing. This lists every
         * comment control the extension has registered, whether the one for the current video is
         * attached, shown and clickable, and then calls the same {@code openComments} the gesture
         * calls, on the main thread, which is the thread a broadcast receiver runs on.
         */
        private String openCommentsReport() throws Exception {
            Class<?> gestures = loader.loadClass(
                    "app.morphe.extension.tiktok.interaction.GestureActions");
            Class<?> author = loader.loadClass(
                    "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor");
            Class<?> reflect = loader.loadClass("app.morphe.extension.tiktok.blockauthor.Reflect");
            Object aweme = author.getMethod("getAweme").invoke(null);
            Object aid = reflect.getMethod("string", Object.class, String.class, String.class)
                    .invoke(null, aweme, "getAid", "aid");

            java.lang.reflect.Field registry = gestures.getDeclaredField("COMMENTS");
            registry.setAccessible(true);
            java.util.Map<?, ?> controls = (java.util.Map<?, ?>) registry.get(null);
            StringBuilder out = new StringBuilder("aweme=" + (aweme == null ? "null" : aweme.getClass().getName())
                    + " aid=" + aid + " registered=" + controls.size());
            for (java.util.Map.Entry<?, ?> entry : controls.entrySet()) {
                Object control = entry.getValue();
                java.lang.reflect.Field viewField = control.getClass().getDeclaredField("view");
                java.lang.reflect.Field idField = control.getClass().getDeclaredField("videoId");
                viewField.setAccessible(true);
                idField.setAccessible(true);
                android.view.View view = ((java.lang.ref.WeakReference<android.view.View>)
                        viewField.get(control)).get();
                out.append("\n  owner=").append(entry.getKey().getClass().getSimpleName())
                        .append(" videoId=").append(idField.get(control));
                if (view == null) {
                    out.append(" view=collected");
                    continue;
                }
                String resource = "none";
                try {
                    if (view.getId() != android.view.View.NO_ID) {
                        resource = view.getResources().getResourceEntryName(view.getId());
                    }
                } catch (Exception ignored) {
                    resource = String.valueOf(view.getId());
                }
                out.append(" view=").append(view.getClass().getSimpleName())
                        .append(" id=").append(resource)
                        .append(" attached=").append(view.isAttachedToWindow())
                        .append(" shown=").append(view.isShown())
                        .append(" clickable=").append(view.isClickable())
                        .append(" hasClickListener=").append(view.hasOnClickListeners())
                        .append(" desc=").append(view.getContentDescription())
                        .append(" children=").append(view instanceof android.view.ViewGroup
                                ? ((android.view.ViewGroup) view).getChildCount() : 0);
            }

            Method open = gestures.getDeclaredMethod("openComments", String.class);
            open.setAccessible(true);
            Object result = open.invoke(null, aid);
            out.append("\n  openComments(").append(aid).append(")=").append(result);
            return out.toString();
        }

        /** Privacy-safe classifier state for the video currently bound to TikTok's player. */
        private String adEvidence() throws Exception {
            Class<?> author = loader.loadClass(
                    "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor");
            Object aweme = author.getMethod("getAweme").invoke(null);
            if (aweme == null) return "aweme=null";

            Class<?> awemeClass = aweme.getClass();
            Object anchorsValue = awemeClass.getMethod("getAnchorsExtras").invoke(aweme);
            String anchors = anchorsValue instanceof String ? (String) anchorsValue : null;
            Object rawAd = awemeClass.getMethod("getAwemeRawAd").invoke(aweme);
            boolean nativeAd = (Boolean) awemeClass.getMethod("isAd").invoke(aweme);
            boolean softAd = (Boolean) awemeClass.getMethod("isSoftAd").invoke(aweme);

            Class<?> ads = loader.loadClass(
                    "app.morphe.extension.tiktok.feedfilter.AdsFilter");
            Class<?> awemeModel = loader.loadClass(
                    "com.ss.android.ugc.aweme.feed.model.Aweme");
            Method commission = ads.getDeclaredMethod(
                    "hasCreatorCommissionDisclosure", awemeModel);
            commission.setAccessible(true);
            boolean commissionMatched = (Boolean) commission.invoke(null, aweme);
            Class<?> reflect = loader.loadClass(
                    "app.morphe.extension.tiktok.blockauthor.Reflect");
            Method invoke = reflect.getMethod("invoke", Object.class, String.class);
            Method field = reflect.getMethod("readField", Object.class, String.class);
            Object content = invoke.invoke(null, aweme, "getContentModel");
            Object business = field.invoke(null, content, "standardBusinessModel");
            Object alliance = invoke.invoke(null, business, "getLocalAllianceInfo");
            Object show = invoke.invoke(null, alliance, "showBottomLabel");
            Object type = field.invoke(null, alliance, "allianceItemLabelType");
            Object label = field.invoke(null, alliance, "allianceItemLabelText");

            StringBuilder out = new StringBuilder();
            out.append("awemeClass=").append(awemeClass.getName())
                    .append("\nnativeAd=").append(nativeAd)
                    .append("\nsoftAd=").append(softAd)
                    .append("\nrawAdPresent=").append(rawAd != null)
                    .append("\nanchorsPresent=").append(anchors != null && !anchors.isEmpty())
                    .append("\nanchorsLength=").append(anchors == null ? 0 : anchors.length())
                    .append("\nanchorsHash=")
                    .append(anchors == null ? "none" : Integer.toHexString(anchors.hashCode()))
                    .append("\npanelDisclosureKey=")
                    .append(anchors != null && anchors.contains("panel_top_disclosure_label"))
                    .append("\ncommissionMatched=").append(commissionMatched)
                    .append("\ncontentPresent=").append(content != null)
                    .append("\nbusinessPresent=").append(business != null)
                    .append("\nlocalAlliancePresent=").append(alliance != null)
                    .append("\nlocalAllianceShowLabel=").append(show)
                    .append("\nlocalAllianceLabelType=").append(type)
                    .append("\nlocalAllianceLabelLength=")
                    .append(label instanceof String ? ((String) label).length() : 0)
                    .append("\nremoveAds=").append(valueOf(find("remove_ads")))
                    .append("\nhidePaidPartnership=")
                    .append(valueOf(find("hide_paid_partnership")));
            return out.toString();
        }

        /** Runs the real ad-only list boundary on a detached list, never the visible pager. */
        private String adBoundary() throws Exception {
            Object aweme = loader.loadClass(
                    "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor")
                    .getMethod("getAweme").invoke(null);
            if (aweme == null) return "aweme=null";
            Class<?> ads = loader.loadClass("app.morphe.extension.tiktok.feedfilter.AdsFilter");
            Class<?> model = loader.loadClass("com.ss.android.ugc.aweme.feed.model.Aweme");
            boolean classified = (Boolean) ads.getMethod("getFiltered", model)
                    .invoke(ads.getConstructor().newInstance(), aweme);
            List<Object> detached = new ArrayList<>();
            detached.add(aweme);
            List<?> remaining = (List<?>) loader.loadClass(
                    "app.morphe.extension.tiktok.feedfilter.FeedItemsFilter")
                    .getMethod("filterProfileAds", List.class).invoke(null, detached);
            Class<?> feed = loader.loadClass("com.ss.android.ugc.aweme.feed.model.FeedItemList");
            Object response = feed.getConstructor().newInstance();
            Field items = feed.getDeclaredField("items");
            items.setAccessible(true);
            items.set(response, new ArrayList<>(Collections.singletonList(aweme)));
            List<?> read = (List<?>) feed.getMethod("getItems").invoke(response);
            return "classified=" + classified + "\nremoveAds=" + valueOf(find("remove_ads"))
                    + "\ninput=1\nremaining=" + remaining.size()
                    + "\nnativeGetterRemaining=" + read.size();
        }

        /**
         * Privacy-safe shape of commerce data attached to the video currently bound to TikTok.
         *
         * <p>47.0.3 renders the creator-commission label while the Aweme exposed by
         * CurrentVideoAuthor has no anchorsExtras. This probe finds which other stable model
         * property carries that decision without ever logging a user or server supplied string.
         */
        private List<String> commerceEvidence() throws Exception {
            Class<?> author = loader.loadClass(
                    "app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor");
            Object aweme = author.getMethod("getAweme").invoke(null);
            if (aweme == null) return Collections.singletonList("aweme=null");

            List<String> out = new ArrayList<>();
            out.add("awemeClass=" + aweme.getClass().getName());
            addRelevantMembers("aweme", aweme, out, true);
            return out;
        }

        /** Exact technical banner counts only. Never collect the search suggestion or other text. */
        private String bannerEvidence(String expectedId) throws Exception {
            Object aweme = loader.loadClass("app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor")
                    .getMethod("getAweme").invoke(null);
            if (aweme == null) return "aweme=null";
            Class<?> model = loader.loadClass("com.ss.android.ugc.aweme.feed.model.Aweme");
            Object raw = model.getMethod("getBanners").invoke(aweme);
            List<?> banners = raw instanceof List ? (List<?>) raw : Collections.emptyList();
            int search = 0, tako = 0, unknown = 0;
            for (Object banner : banners) {
                if (banner == null) { unknown++; continue; }
                Object key = banner.getClass().getField("bannerKey").get(banner);
                Object component = key == null ? null : key.getClass().getField("componentKey").get(key);
                if ("bottom_banner_search_rs".equals(component)) search++;
                else if ("bottom_banner_tako".equals(component)) tako++;
                else unknown++;
            }
            return "banners=" + banners.size() + "\nsearchBanners=" + search + "\ntakoBanners=" + tako
                    + "\notherBanners=" + unknown + "\nexpectedPublicVideo=" + (expectedId == null ? "not checked" :
                    String.valueOf(expectedId.equals(model.getMethod("getAid").invoke(aweme))));
        }

        /** Real current model and patched native getter, on a detached list. No place or creator text. */
        private String locationEvidence(String expectedId) throws Exception {
            Object aweme = loader.loadClass("app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor")
                    .getMethod("getAweme").invoke(null);
            if (aweme == null) return "aweme=null";
            Class<?> model = loader.loadClass("com.ss.android.ugc.aweme.feed.model.Aweme");
            Object raw = model.getMethod("getAnchors").invoke(aweme);
            List<?> anchors = raw instanceof List ? (List<?>) raw : Collections.emptyList();
            int locations = 0;
            for (Object anchor : anchors) {
                if (anchor != null && "anchor_poi".equals(anchor.getClass().getMethod("getComponentKey").invoke(anchor))) locations++;
            }
            Class<?> rule = loader.loadClass("app.morphe.extension.tiktok.feedfilter.LocationBadgeFilter");
            boolean classified = (Boolean) rule.getMethod("hasBadge", model).invoke(null, aweme);
            List<?> display = (List<?>) rule.getMethod("visibleAnchors", List.class).invoke(null, anchors);
            Class<?> feed = loader.loadClass("com.ss.android.ugc.aweme.feed.model.FeedItemList");
            Object response = feed.getConstructor().newInstance();
            Field items = feed.getDeclaredField("items");
            items.setAccessible(true);
            items.set(response, new ArrayList<>(Collections.singletonList(aweme)));
            List<?> remaining = (List<?>) feed.getMethod("getItems").invoke(response);
            Object originalAfter = model.getMethod("getAnchors").invoke(aweme);
            return "anchors=" + anchors.size() + "\nlocationAnchors=" + locations
                    + "\nclassified=" + classified + "\ndisplayAnchors=" + display.size()
                    + "\noriginalAnchorsAfter=" + (originalAfter instanceof List ? ((List<?>) originalAfter).size() : 0)
                    + "\nfilterEnabled=" + valueOf(find("filter_location_videos"))
                    + "\nhideEnabled=" + valueOf(find("hide_location_labels"))
                    + "\nnativeGetterInput=1\nnativeGetterRemaining=" + remaining.size()
                    + "\nexpectedPublicVideo=" + (expectedId == null ? "not checked" :
                    String.valueOf(expectedId.equals(model.getMethod("getAid").invoke(aweme))));
        }

        private static String hostAndPath(android.net.Uri uri) {
            if (uri == null) return "null";
            return uri.getScheme() + "://" + uri.getHost() + uri.getPath();
        }

        /**
         * Which paid-series markers the current video carries. Strings are reported by length and
         * by whether they are a bare number, never by content, so no collection name is recorded.
         */
        private String seriesEvidence() throws Exception {
            Object aweme = loader.loadClass("app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor")
                    .getMethod("getAweme").invoke(null);
            if (aweme == null) return "aweme=null";
            Class<?> model = loader.loadClass("com.ss.android.ugc.aweme.feed.model.Aweme");
            Object info = model.getMethod("getMPaidContentInfo").invoke(aweme);
            StringBuilder out = new StringBuilder("isPaidContent=" + model.getMethod("isPaidContent").invoke(aweme));
            out.append("\ninfoPresent=").append(info != null);
            if (info != null) {
                for (String getter : new String[] {"getPaidCollectionId", "getCategory", "getDisplayPrompt",
                        "isPaidCollectionIntro", "isLimitedFreeShortDrama", "getShowSeriesPurchaseLabel",
                        "getShouldShowPreview", "getHasPurchased"}) {
                    out.append('\n').append(getter).append('=').append(info.getClass().getMethod(getter).invoke(info));
                }
                for (String getter : new String[] {"getCollectionName", "getEpisodeNumber", "getMiniDramaInfo",
                        "getBottomButtonText", "getVoucherId"}) {
                    Object value = info.getClass().getMethod(getter).invoke(info);
                    String text = value == null ? null : value.toString();
                    out.append('\n').append(getter).append('=').append(text == null ? "null"
                            : "length " + text.length() + (text.matches("-?[0-9]+") ? " number " + text : ""));
                }
                for (String getter : new String[] {"getPrice", "getCoverUrl", "getMiniDramaCardInfo"}) {
                    out.append('\n').append(getter).append("Present=")
                            .append(info.getClass().getMethod(getter).invoke(info) != null);
                }
            }
            try {
                Object filter = loader.loadClass(
                        "app.morphe.extension.tiktok.feedfilter.ContentMarkerFilters$SeriesFilter")
                        .getConstructor().newInstance();
                Method filtered = filter.getClass().getMethod("getFiltered", model);
                out.append("\nclassifiedSeries=").append(filtered.invoke(filter, aweme));
            } catch (Throwable unavailable) {
                out.append("\nclassifiedSeries=unavailable ").append(unavailable.getClass().getSimpleName());
            }
            out.append("\nhideSeries=").append(valueOf(find("hide_series")));
            // The playlist filter reads strings the same way, so its defaults are recorded too.
            Object mix = model.getMethod("getMixInfo").invoke(aweme);
            out.append("\nmixPresent=").append(mix != null);
            if (mix != null) {
                for (String name : new String[] {"mixId", "mixName"}) {
                    Object value = null;
                    for (Class<?> type = mix.getClass(); type != null && value == null; type = type.getSuperclass()) {
                        try {
                            Field field = type.getDeclaredField(name);
                            field.setAccessible(true);
                            value = field.get(mix);
                        } catch (NoSuchFieldException absent) {
                            // keep climbing
                        }
                    }
                    String text = value == null ? null : value.toString();
                    out.append('\n').append(name).append('=').append(text == null ? "null"
                            : "length " + text.length() + (text.matches("-?[0-9]+") && text.length() < 3 ? " number " + text : ""));
                }
            }
            try {
                Object filter = loader.loadClass(
                        "app.morphe.extension.tiktok.feedfilter.ContentMarkerFilters$PlaylistFilter")
                        .getConstructor().newInstance();
                out.append("\nclassifiedPlaylist=")
                        .append(filter.getClass().getMethod("getFiltered", model).invoke(filter, aweme));
            } catch (Throwable unavailable) {
                out.append("\nclassifiedPlaylist=unavailable ").append(unavailable.getClass().getSimpleName());
            }
            return out.toString();
        }

        /**
         * The marker fields the content filters read, for every video TikTok has loaded on the
         * current screen, one line each: a key for dropping repeats, the verdicts of the live
         * filters, and the shape of every field they read.
         *
         * <p>Only shapes leave the phone. Booleans stay. Numbers record whether their int and
         * long views are zero plus one of four text classes. Text and unknown objects record only
         * blank, positive integer, non-positive integer or other. Collection and map sizes are
         * capped. The key is the first 12 hex digits of a SHA-256 of the video id, which the host
         * drops before anything is committed. Every field is read through Hushfeed's own Reflect,
         * getter first and field second, which is exactly the read the filters make.
         */
        private List<String> markerCorpus(String route) throws Exception {
            android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                    .getMethod("getActivity").invoke(null);
            if (activity == null) return Collections.singletonList("{\"error\":\"no activity\"}");
            Class<?> model = loader.loadClass("com.ss.android.ugc.aweme.feed.model.Aweme");
            java.util.IdentityHashMap<Object, Boolean> seen = new java.util.IdentityHashMap<>();
            List<Object> videos = new ArrayList<>();
            List<android.view.View> views = new ArrayList<>();
            views.add(activity.getWindow().getDecorView());
            for (int index = 0; index < views.size(); index++) {
                android.view.View view = views.get(index);
                if (view instanceof android.view.ViewGroup) {
                    android.view.ViewGroup group = (android.view.ViewGroup) view;
                    for (int child = 0; child < group.getChildCount(); child++) views.add(group.getChildAt(child));
                }
                Object adapter = null;
                try {
                    adapter = view.getClass().getMethod("getAdapter").invoke(view);
                } catch (NoSuchMethodException none) {
                    // not an adapter view
                }
                if (adapter != null) collectVideos(adapter, model, seen, videos);
            }
            // The feed pager's adapter does not hold its list where a walk can reach it, so the
            // videos Hushfeed saw bound (up to 16, CurrentVideoAuthor.RECENT) are added as well.
            try {
                Field recent = loader.loadClass("app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor")
                        .getDeclaredField("RECENT");
                recent.setAccessible(true);
                Map<?, ?> map = (Map<?, ?>) recent.get(null);
                List<Object> items;
                synchronized (map) {
                    items = new ArrayList<>(map.values());
                }
                for (Object item : items) {
                    Field aweme = item.getClass().getDeclaredField("aweme");
                    aweme.setAccessible(true);
                    Object video = aweme.get(item);
                    if (model.isInstance(video) && seen.put(video, Boolean.TRUE) == null) videos.add(video);
                }
            } catch (Throwable unavailable) {
                Log.w(TAG, "marker-corpus: recent binds unavailable, adapters only", unavailable);
            }
            String[] filterNames = {"AiGeneratedFilter", "PaidPartnershipFilter", "SeriesFilter", "PlaylistFilter"};
            String[] markerNames = {"ai", "paid", "series", "playlist"};
            Object[] filters = new Object[filterNames.length];
            for (int i = 0; i < filterNames.length; i++) {
                filters[i] = loader.loadClass("app.morphe.extension.tiktok.feedfilter.ContentMarkerFilters$"
                        + filterNames[i]).getConstructor().newInstance();
            }
            Method property = loader.loadClass("app.morphe.extension.tiktok.blockauthor.Reflect")
                    .getMethod("property", Object.class, String.class, String.class);
            java.security.MessageDigest sha = java.security.MessageDigest.getInstance("SHA-256");
            List<String> lines = new ArrayList<>();
            for (Object video : videos) {
                JSONArray markers = new JSONArray();
                for (int i = 0; i < filters.length; i++) {
                    Object matched = filters[i].getClass().getMethod("getFiltered", model).invoke(filters[i], video);
                    if (Boolean.TRUE.equals(matched)) markers.put(markerNames[i]);
                }
                JSONObject line = new JSONObject();
                Object aid = model.getMethod("getAid").invoke(video);
                byte[] digest = sha.digest(String.valueOf(aid).getBytes(java.nio.charset.StandardCharsets.UTF_8));
                StringBuilder key = new StringBuilder();
                for (int i = 0; i < 6; i++) key.append(String.format(Locale.ROOT, "%02x", digest[i] & 0xff));
                line.put("key", key.toString());
                line.put("markers", markers);
                line.put("shape", markerShape(video, property));
                lines.add(line.toString());
            }
            return lines;
        }

        /** Breadth-first through an adapter's own objects, at most four levels, for loaded videos. */
        private static void collectVideos(Object root, Class<?> model,
                java.util.IdentityHashMap<Object, Boolean> seen, List<Object> videos) {
            List<Object> level = new ArrayList<>();
            level.add(root);
            for (int depth = 0; depth < 5 && !level.isEmpty(); depth++) {
                List<Object> next = new ArrayList<>();
                for (Object node : level) {
                    if (node == null || seen.put(node, Boolean.TRUE) != null || seen.size() > 50_000) continue;
                    if (model.isInstance(node)) {
                        videos.add(node);
                        continue;
                    }
                    if (node instanceof Collection) {
                        next.addAll((Collection<?>) node);
                    } else if (node instanceof Map) {
                        next.addAll(((Map<?, ?>) node).values());
                    } else if (node.getClass().isArray() && !node.getClass().getComponentType().isPrimitive()) {
                        for (int i = 0; i < Array.getLength(node); i++) next.add(Array.get(node, i));
                    } else if (depth < 4 && worthOpening(node)) {
                        for (Class<?> type = node.getClass(); type != null && worthOpening(type.getName()); type = type.getSuperclass()) {
                            for (Field field : type.getDeclaredFields()) {
                                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                                try {
                                    field.setAccessible(true);
                                    next.add(field.get(node));
                                } catch (Throwable unreadable) {
                                    // skip it
                                }
                            }
                        }
                    }
                }
                level = next;
            }
        }

        /** TikTok's own model and adapter classes, never views, contexts or the platform. */
        private static boolean worthOpening(Object node) {
            if (node instanceof android.view.View || node instanceof Context) return false;
            return worthOpening(node.getClass().getName());
        }

        private static boolean worthOpening(String name) {
            return name.startsWith("com.ss.") || name.startsWith("com.bytedance.") || name.startsWith("X.")
                    || name.startsWith("androidx.recyclerview.") || name.startsWith("androidx.viewpager");
        }

        /** The fields ContentMarkerFilters reads, as privacy-safe typed tokens. */
        private static JSONObject markerShape(Object video, Method property) throws Exception {
            JSONObject shape = new JSONObject();
            shape.put("aigcInfo", struct(read(property, video, "getAigcInfo", "aigcInfo"), property,
                    "getAIGCLabelType", "aigcLabelType"));
            shape.put("moderationAigcInfo", struct(read(property, video, "getModerationAigcInfo", "moderationAigcInfo"),
                    property, "getModerationAigcLabelType", "moderationAigcLabelType",
                    "getModerationUserLabelStatus", "moderationUserLabelStatus"));
            shape.put("brandContentAccounts", token(read(property, video, "getBrandContentAccounts", "brandContentAccounts")));
            shape.put("commerceVideoAuthInfo", struct(read(property, video, "getCommerceVideoAuthInfo", "commerceVideoAuthInfo"),
                    property, "isBrandedContent", "isBrandedContent", "isBrandOrganicContent", "isBrandOrganicContent",
                    "getBrandedContentType", "brandedContentType", "getBrandOrganicType", "brandOrganicType",
                    "getEcSearchBoBcLabelText", "ecSearchBoBcLabelText", "isCommerce", "isCommerce"));
            shape.put("commercialVideoInfo", token(read(property, video, "getCommercialVideoInfo", "commercialVideoInfo")));
            shape.put("isPaidContent", token(read(property, video, "isPaidContent", "isPaidContent")));
            shape.put("mPaidContentInfo", struct(read(property, video, "getMPaidContentInfo", "mPaidContentInfo"),
                    property, "getPaidCollectionId", "paidCollectionId", "getCollectionName", "collectionName",
                    "getEpisodeNumber", "episodeNumber", "isPaidCollectionIntro", "isPaidCollectionIntro"));
            shape.put("playlist_info", struct(read(property, video, "getPlaylist_info", "playlist_info"),
                    property, "getMixId", "mixId"));
            shape.put("mixInfo", struct(read(property, video, "getMixInfo", "mixInfo"), property,
                    "getMixId", "mixId", "getMixName", "mixName"));
            return shape;
        }

        private static Object read(Method property, Object target, String getter, String field) throws Exception {
            return property.invoke(null, target, getter, field);
        }

        /** A struct as {field: token}, from getter and field name pairs, or JSON null when absent. */
        private static Object struct(Object value, Method property, String... pairs) throws Exception {
            if (value == null) return JSONObject.NULL;
            JSONObject out = new JSONObject();
            for (int i = 0; i < pairs.length; i += 2) out.put(pairs[i + 1], token(read(property, value, pairs[i], pairs[i + 1])));
            return out;
        }

        /** One value as a typed token that keeps what the filters test and drops what identifies. */
        private static Object token(Object value) throws Exception {
            if (value == null) return JSONObject.NULL;
            JSONObject out = new JSONObject();
            if (value instanceof Boolean) {
                out.put("b", value);
            } else if (value instanceof Number) {
                Number number = (Number) value;
                out.put("num", "i" + (number.intValue() == 0 ? "0" : "1")
                        + "l" + (number.longValue() == 0L ? "0" : "1") + textShape(value));
            } else if (value instanceof CharSequence) {
                out.put("txt", textShape(value));
            } else if (value instanceof Collection) {
                out.put("c", Math.min(((Collection<?>) value).size(), 10_000));
            } else if (value instanceof Map) {
                out.put("m", Math.min(((Map<?, ?>) value).size(), 10_000));
            } else {
                out.put("obj", textShape(value));
            }
            return out;
        }

        /** What Reflect.string and SeriesFilter.isEpisode can learn without retaining the text. */
        private static String textShape(Object value) {
            String text = value.toString().trim();
            if (text.isEmpty()) return "b";
            try {
                return Long.parseLong(text) > 0L ? "p" : "z";
            } catch (NumberFormatException notALong) {
                return "x";
            }
        }

        /** Finds the fixed disclosure label and reports only its native view structure. */
        private List<String> commissionViewEvidence() throws Exception {
            android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                    .getMethod("getActivity").invoke(null);
            if (activity == null) return Collections.singletonList("activity=null");
            android.view.View root = activity.getWindow().getDecorView();
            List<android.view.View> queue = new ArrayList<>();
            queue.add(root);
            List<android.view.View> found = new ArrayList<>();
            for (int index = 0; index < queue.size(); index++) {
                android.view.View view = queue.get(index);
                if (view instanceof android.widget.TextView) {
                    CharSequence value = ((android.widget.TextView) view).getText();
                    if (value != null && "Creator earns commission".contentEquals(value)) {
                        found.add(view);
                    }
                }
                if (view instanceof android.view.ViewGroup) {
                    android.view.ViewGroup group = (android.view.ViewGroup) view;
                    for (int child = 0; child < group.getChildCount(); child++) {
                        queue.add(group.getChildAt(child));
                    }
                }
            }

            List<String> out = new ArrayList<>();
            out.add("activity=" + activity.getClass().getName()
                    + ",visited=" + queue.size() + ",matches=" + found.size());
            for (int match = 0; match < found.size(); match++) {
                android.view.View current = found.get(match);
                for (int depth = 0; current != null && depth < 10; depth++) {
                    android.graphics.Rect bounds = new android.graphics.Rect();
                    current.getGlobalVisibleRect(bounds);
                    Object tag = current.getTag();
                    out.add("match=" + match + ",depth=" + depth
                            + ",class=" + current.getClass().getName()
                            + ",id=" + safeResourceName(current)
                            + ",shown=" + current.isShown()
                            + ",attached=" + current.isAttachedToWindow()
                            + ",visibility=" + current.getVisibility()
                            + ",bounds=" + bounds.flattenToString()
                            + ",tag=" + (tag == null ? "null" : tag.getClass().getName()));
                    addViewObjectFields("match=" + match + ",depth=" + depth, current, out);
                    android.view.ViewParent parent = current.getParent();
                    current = parent instanceof android.view.View
                            ? (android.view.View) parent : null;
                }
            }
            return out;
        }

        private static String safeResourceName(android.view.View view) {
            if (view.getId() == android.view.View.NO_ID) return "none";
            try {
                return view.getResources().getResourceName(view.getId());
            } catch (Throwable ignored) {
                return "numeric";
            }
        }

        private static void addViewObjectFields(
                String prefix,
                android.view.View view,
                List<String> out
        ) {
            int emitted = 0;
            for (Class<?> current = view.getClass(); current != null
                    && current != android.view.View.class && current != Object.class;
                 current = current.getSuperclass()) {
                String owner = current.getName();
                if (owner.startsWith("android.") || owner.startsWith("java.")) continue;
                for (Field field : current.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || ++emitted > 64) continue;
                    try {
                        field.setAccessible(true);
                        Object value = field.get(view);
                        if (value == null || value instanceof CharSequence
                                || value instanceof Number || value instanceof Boolean) {
                            continue;
                        }
                        out.add(prefix + ",owner=" + owner + ",field=" + field.getName()
                                + ",declared=" + field.getType().getName()
                                + ",value=" + value.getClass().getName());
                    } catch (Throwable ignored) {
                        // A hidden framework field is irrelevant to the custom renderer shape.
                    }
                }
            }
        }

        private static void addRelevantMembers(
                String prefix,
                Object target,
                List<String> out,
                boolean includeMethods
        ) {
            if (target == null) return;
            int before = out.size();
            Class<?> type = target.getClass();
            for (Class<?> current = type; current != null && current != Object.class;
                 current = current.getSuperclass()) {
                for (Field field : current.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || !isCommerceMember(field.getName())) {
                        continue;
                    }
                    try {
                        field.setAccessible(true);
                        addSafeValue(prefix + ".field." + field.getName(), field.get(target), out);
                    } catch (Throwable error) {
                        out.add(prefix + ".field." + field.getName() + "=unreadable");
                    }
                }
            }

            if (includeMethods) {
                for (Method method : type.getMethods()) {
                    String name = method.getName();
                    if (method.getParameterTypes().length != 0
                            || method.getReturnType() == void.class
                            || !(name.startsWith("get") || name.startsWith("is"))
                            || !isCommerceMember(name)) {
                        continue;
                    }
                    try {
                        method.setAccessible(true);
                        addSafeValue(prefix + ".method." + name, method.invoke(target), out);
                    } catch (Throwable error) {
                        out.add(prefix + ".method." + name + "=unreadable");
                    }
                }
            }

            if (out.size() == before) out.add(prefix + "=no-relevant-members");
        }

        private static boolean isCommerceMember(String name) {
            String lower = name.toLowerCase(Locale.ROOT);
            return lower.contains("anchor")
                    || lower.contains("commerce")
                    || lower.contains("paid")
                    || lower.contains("product")
                    || lower.contains("affiliate")
                    || lower.contains("commission")
                    || lower.contains("disclosure")
                    || lower.contains("promotion")
                    || lower.contains("sponsor")
                    || lower.contains("shop")
                    || lower.contains("ecom");
        }

        private static void addSafeValue(String name, Object value, List<String> out) {
            addSafeValue(name, value, out, true);
        }

        private static void addSafeValue(
                String name,
                Object value,
                List<String> out,
                boolean descend
        ) {
            if (value == null) {
                out.add(name + "=null");
                return;
            }
            if (value instanceof CharSequence) {
                String text = value.toString();
                String lower = text.toLowerCase(Locale.ROOT);
                out.add(name + "=string"
                        + ",len=" + text.length()
                        + ",hash=" + Integer.toHexString(text.hashCode())
                        + ",commission=" + lower.contains("commission")
                        + ",affiliate=" + lower.contains("affiliate")
                        + ",disclosure=" + lower.contains("disclosure")
                        + ",paid=" + lower.contains("paid")
                        + ",sponsored=" + lower.contains("sponsor")
                        + ",product=" + lower.contains("product"));
                if (name.endsWith(".field.extra")) addJsonShape(name, text, out);
                return;
            }
            if (value instanceof Boolean) {
                out.add(name + "=boolean," + value);
                return;
            }
            if (value instanceof Number) {
                out.add(name + "=number," + (((Number) value).doubleValue() == 0d
                        ? "zero" : "nonzero"));
                return;
            }
            if (value.getClass().isEnum()) {
                out.add(name + "=enum," + value.getClass().getName());
                return;
            }

            int size = -1;
            Object first = null;
            if (value instanceof Collection) {
                Collection<?> collection = (Collection<?>) value;
                size = collection.size();
                if (!collection.isEmpty()) first = collection.iterator().next();
            } else if (value instanceof Map) {
                Map<?, ?> map = (Map<?, ?>) value;
                size = map.size();
                if (!map.isEmpty()) first = map.values().iterator().next();
            } else if (value.getClass().isArray()) {
                size = Array.getLength(value);
                if (size > 0) first = Array.get(value, 0);
            }
            if (size >= 0) {
                out.add(name + "=container," + value.getClass().getName() + ",size=" + size
                        + (first == null ? "" : ",first=" + first.getClass().getName()));
                if (descend && first != null) addAllFields(name + "[0]", first, out);
                return;
            }

            out.add(name + "=object," + value.getClass().getName());
            if (descend) addAllFields(name, value, out);
        }

        /** JSON keys and value shapes only. String contents never leave the process. */
        private static void addJsonShape(String name, String text, List<String> out) {
            String trimmed = text.trim();
            if (!(trimmed.startsWith("{") || trimmed.startsWith("["))) return;
            try {
                Object root = trimmed.startsWith("{")
                        ? new JSONObject(trimmed) : new JSONArray(trimmed);
                int[] remaining = {96};
                addJsonShape(name + ".json", root, out, 0, remaining);
            } catch (Throwable error) {
                out.add(name + ".json=invalid");
            }
        }

        private static void addJsonShape(
                String path,
                Object value,
                List<String> out,
                int depth,
                int[] remaining
        ) {
            if (remaining[0]-- <= 0) {
                out.add(path + "=node-limit");
                return;
            }
            if (depth > 5) {
                out.add(path + "=depth-limit");
                return;
            }
            if (value == null || value == JSONObject.NULL) {
                out.add(path + "=null");
                return;
            }
            if (value instanceof JSONObject) {
                JSONObject object = (JSONObject) value;
                List<String> keys = new ArrayList<>();
                java.util.Iterator<String> iterator = object.keys();
                while (iterator.hasNext()) keys.add(iterator.next());
                Collections.sort(keys);
                out.add(path + "=object,size=" + keys.size());
                for (String key : keys) {
                    addJsonShape(path + "." + key, object.opt(key), out, depth + 1, remaining);
                }
                return;
            }
            if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                out.add(path + "=array,size=" + array.length());
                if (array.length() > 0) {
                    addJsonShape(path + "[0]", array.opt(0), out, depth + 1, remaining);
                }
                return;
            }
            addSafeValue(path, value, out, false);
        }

        /** One non-recursive field pass over a nested commerce model. */
        private static void addAllFields(String prefix, Object target, List<String> out) {
            int emitted = 0;
            for (Class<?> current = target.getClass(); current != null && current != Object.class;
                 current = current.getSuperclass()) {
                for (Field field : current.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    if (++emitted > 96) {
                        out.add(prefix + "=field-limit");
                        return;
                    }
                    try {
                        field.setAccessible(true);
                        addSafeValue(prefix + ".field." + field.getName(), field.get(target), out, false);
                    } catch (Throwable error) {
                        out.add(prefix + ".field." + field.getName() + "=unreadable");
                    }
                }
            }
        }

        /** Reads only a copied public TikTok video URL, never arbitrary clipboard content. */
        private String copiedTikTokVideoLink() {
            android.content.ClipboardManager clipboard =
                    (android.content.ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
            android.content.ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return "missing";
            CharSequence value = clip.getItemAt(0).coerceToText(app);
            String text = value == null ? "" : value.toString().trim();
            if (text.startsWith("https://www.tiktok.com/") && text.contains("/video/")) return text;
            return "not-a-tiktok-video-url";
        }

        /**
         * What FeedVisibility sees right now: the current activity, its answers, the Home tab's
         * flags and whether any of it has pixels on screen, and the detail-page registry. The
         * registry and its entries are read by field type rather than name, since the release
         * extension is minified and only the hooked entry points keep their names.
         */
        private String feedReport() throws Exception {
            Class<?> visibility = loader.loadClass("app.morphe.extension.tiktok.blockauthor.FeedVisibility");
            android.app.Activity activity = (android.app.Activity) loader.loadClass(UTILS)
                    .getMethod("getActivity").invoke(null);
            StringBuilder out = new StringBuilder();
            out.append("activity=").append(activity == null ? "null" : activity.getClass().getName());
            if (activity != null) {
                out.append("\nisOnFeed=").append(visibility.getMethod("isOnFeed", android.app.Activity.class)
                        .invoke(null, activity));
                out.append("\nonRecommendationFeed=").append(visibility
                        .getMethod("onRecommendationFeed", android.app.Activity.class).invoke(null, activity));
                out.append("\ncommentSheet=").append(visibility
                        .getMethod("isCommentSheetVisible", android.app.Activity.class).invoke(null, activity));
                android.view.View tab = (android.view.View) visibility
                        .getMethod("homeTabView", android.app.Activity.class).invoke(null, activity);
                if (tab == null) {
                    out.append("\nhomeTab=null");
                } else {
                    android.graphics.Rect rect = new android.graphics.Rect();
                    boolean onScreen = tab.getGlobalVisibleRect(rect);
                    int[] where = new int[2];
                    tab.getLocationOnScreen(where);
                    out.append("\nhomeTab shown=").append(tab.isShown())
                            .append(" selected=").append(tab.isSelected())
                            .append(" attached=").append(tab.isAttachedToWindow())
                            .append(" globalVisibleRect=").append(onScreen).append(' ').append(rect.toShortString())
                            .append(" locationOnScreen=").append(where[0]).append(',').append(where[1]);
                    android.view.ViewParent parent = tab.getParent();
                    while (parent instanceof android.view.View) {
                        android.view.View view = (android.view.View) parent;
                        if (view.getScrollX() != 0 || view.getTranslationX() != 0f) {
                            out.append("\n  ancestor ").append(view.getClass().getName())
                                    .append(" scrollX=").append(view.getScrollX())
                                    .append(" translationX=").append(view.getTranslationX())
                                    .append(" left=").append(view.getLeft());
                        }
                        parent = view.getParent();
                    }
                }
            }
            for (java.lang.reflect.Method method : visibility.getDeclaredMethods()) {
                if (method.getParameterTypes().length == 0 && method.getReturnType() == boolean.class
                        && java.lang.reflect.Modifier.isStatic(method.getModifiers())) {
                    method.setAccessible(true);
                    out.append('\n').append(method.getName()).append("()=").append(method.invoke(null));
                }
            }
            for (java.lang.reflect.Field field : visibility.getDeclaredFields()) {
                if (!java.util.Map.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                java.util.Map<?, ?> pages = (java.util.Map<?, ?>) field.get(null);
                out.append("\nregistry ").append(field.getName()).append(" size=").append(pages.size());
                for (java.util.Map.Entry<?, ?> entry : pages.entrySet()) {
                    out.append("\n  page ").append(entry.getKey().getClass().getName());
                    Object state = entry.getValue();
                    for (java.lang.reflect.Field part : state.getClass().getDeclaredFields()) {
                        part.setAccessible(true);
                        Object value = part.get(state);
                        if (value instanceof java.lang.ref.Reference) {
                            Object view = ((java.lang.ref.Reference<?>) value).get();
                            value = view == null ? "null" : view.getClass().getName() + " shown="
                                    + ((android.view.View) view).isShown();
                        }
                        out.append(' ').append(part.getName()).append('=').append(value);
                    }
                }
            }
            return out.toString();
        }

        /**
         * Every setting Hushfeed has created, with its value.
         *
         * <p>Loading the tiktok Settings class is what creates them: each is a static field on it,
         * so until the class is initialised the registry is empty and a lookup finds nothing.
         */
        private String dump() throws Exception {
            List<?> all = (List<?>) registry().getMethod("allLoadedSettings").invoke(null);
            List<String> lines = new ArrayList<>();
            for (Object each : all) lines.add(keyOf(each) + "=" + valueOf(each));
            Collections.sort(lines);
            // String.join arrived in API 26, and this runs on the same floor as the bundle.
            StringBuilder out = new StringBuilder();
            for (String line : lines) {
                if (out.length() != 0) out.append('\n');
                out.append(line);
            }
            return out.toString();
        }

        private void write(String key, String value) throws Exception {
            Object setting = find(key);
            Object current = setting.getClass().getMethod("get").invoke(setting);
            // save is declared final on Setting and generic, so it erases to save(Object).
            loader.loadClass(SETTING).getMethod("save", Object.class)
                    .invoke(setting, coerce(current, value));
        }

        /**
         * The string turned into whatever the setting already holds.
         *
         * <p>Booleans are parsed strictly. {@code Boolean.parseBoolean} answers false for "1",
         * for "yes" and for every typo, so a mistyped value would be written as false and logged
         * as a successful write. This exists to check what settings do on a device; a silent
         * wrong value is the one failure it must not have.
         */
        @SuppressWarnings({"unchecked", "rawtypes"})
        private Object coerce(Object current, String value) {
            if (current instanceof Boolean) {
                if ("true".equalsIgnoreCase(value)) return Boolean.TRUE;
                if ("false".equalsIgnoreCase(value)) return Boolean.FALSE;
                throw new IllegalArgumentException("a boolean setting takes true or false, not " + value);
            }
            if (current instanceof Integer) return Integer.parseInt(value);
            if (current instanceof Long) return Long.parseLong(value);
            if (current instanceof Float) return Float.parseFloat(value);
            // getDeclaringClass, not getClass: an enum constant with a body of its own is an
            // anonymous subclass, and valueOf on that finds nothing.
            if (current instanceof Enum) {
                return Enum.valueOf((Class<Enum>) ((Enum<?>) current).getDeclaringClass(), value);
            }
            return value;
        }

        private Object find(String key) throws Exception {
            Object found = registry().getMethod("getSettingFromPath", String.class)
                    .invoke(null, key);
            if (found == null) throw new IllegalArgumentException("no setting called " + key);
            return found;
        }

        private Class<?> registry() throws Exception {
            Class.forName(SETTINGS, true, loader);
            return loader.loadClass(SETTING);
        }

        private String keyOf(Object setting) throws Exception {
            return String.valueOf(setting.getClass().getField("key").get(setting));
        }

        private String valueOf(Object setting) throws Exception {
            return String.valueOf(setting.getClass().getMethod("get").invoke(setting));
        }
    }
}
