package app.nogoogle.gboard.gif;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import app.nogoogle.gboard.ModMenuActivity;
import app.nogoogle.gboard.NoGoogleSettings;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/**
 * GIF search without giving Gboard network access: its Tenor v2 requests are answered from the GIF
 * sources enabled in No-Google settings, fetched by the network helper app, and picture URLs point
 * at a reserved host so the pictures come back here too. Result ids carry their source
 * ("giphy~abc") so recent GIFs resolve later.
 */
@SuppressWarnings("unused")
public final class GifBridge {
    private static final String TAG = "NoGoogleGif";
    public static final String HELPER = "app.nogoogle.gifproxy";
    private static final String TENOR_API = "tenor.googleapis.com";
    static final String MEDIA_HOST = "gif.nogoogle.invalid"; // reserved TLD: never resolves
    /** Tenor parameters passed on; anything else (Gboard's key, client ids) is dropped. */
    private static final String[] FORWARD = {"q", "locale", "country", "limit", "pos", "contentfilter",
            "media_filter", "ar_range", "searchfilter", "ids", "type"};
    private static final int MAX_BODY = 25 << 20;

    private static final ExecutorService POOL = Executors.newFixedThreadPool(4, r -> {
        Thread t = new Thread(r, "nogoogle-gif");
        t.setDaemon(true);
        return t;
    });
    private static final ConcurrentHashMap<Class<?>, Class<?>> FUTURE_TYPES = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Long> NOTICES = new ConcurrentHashMap<>();
    private static volatile Field uriField;
    private static volatile Method responseFactory;

    private GifBridge() {
    }

    /** A GIF source: id (switch "gif_" + id), its chip / settings label, API key setting or null. */
    public static final class Source {
        public final String id;
        public final String label;
        public final String keySetting;
        public final String about;

        Source(String id, String label, String keySetting, String about) {
            this.id = id;
            this.label = label;
            this.keySetting = keySetting;
            this.about = about;
        }

        public boolean on() {
            return NoGoogleSettings.bool(NoGoogleSettings.GIF_SOURCE_PREFIX + id);
        }
    }

    public static final List<Source> SOURCES = Collections.unmodifiableList(Arrays.asList(
            new Source("klipy", "KLIPY", NoGoogleSettings.GIF_KEY_KLIPY,
                    "Reaction GIFs. Free API key at partner.klipy.com"),
            new Source("giphy", "GIPHY", NoGoogleSettings.GIF_KEY_GIPHY,
                    "Reaction GIFs. Free API key at developers.giphy.com (100 searches an hour)"),
            new Source("nekos", "Anime", null,
                    "nekos.best: anime reaction GIFs (hug, wave, laugh…), no key"),
            new Source("wikimedia", "Wikimedia", null,
                    "Wikimedia Commons: no key, mostly educational animations"),
            new Source("openverse", "Openverse", null,
                    "Openverse: Creative Commons GIFs, no key (200 searches a day)")));

    private static volatile String active; // the source chip tapped last
    /** Category tile pictures by source id (proxied GIF URLs), looked up once per process. */
    private static final ConcurrentHashMap<String, String> PICTURES = new ConcurrentHashMap<>();
    private static final long PICTURE_DEADLINE_MS = 2000; // inside FlagOverrides' 3 s fetch delay
    private static final ExecutorService PICTURE_POOL = Executors.newFixedThreadPool(3, r -> {
        Thread t = new Thread(r, "nogoogle-gif-picture");
        t.setDaemon(true);
        return t;
    });

    public static List<Source> enabledSources() {
        List<Source> on = new ArrayList<>();
        for (Source s : SOURCES) if (s.on()) on.add(s);
        return on;
    }

    public static boolean enabled() {
        for (Source s : SOURCES) if (s.on()) return true;
        return false;
    }

    /** Where searches go: the source chip tapped last, else the first enabled source. */
    static Source activeSource() {
        List<Source> on = enabledSources();
        if (on.isEmpty()) return null;
        String a = active;
        for (Source s : on) if (s.id.equals(a)) return s;
        return on.get(0);
    }

    static Source byId(String id) {
        for (Source s : SOURCES) if (s.id.equals(id)) return s;
        return null;
    }

    /** Patched over Gboard's "Search Tenor" hint: "Search GIPHY", or null for Gboard's own. */
    public static String searchHint() {
        Source s = activeSource();
        return s == null ? null : "Search " + s.label;
    }

    /**
     * Patched in after Gboard draws the GIF tab's error card. Without a network helper app that serves
     * this keyboard it offers to install one; with no GIF source on while online, its button opens the
     * GIF settings. Otherwise Gboard's card stays (an unreachable site says "not connected", see
     * {@link #fetch}).
     */
    public static void onErrorCard(ViewGroup card) {
        try {
            if (card == null) return;
            int helper = HelperApk.state(card.getContext());
            if (helper == HelperApk.READY && (enabled() || !online(card.getContext()))) return;
            TextView message = null;
            Button button = null;
            ArrayDeque<View> views = new ArrayDeque<>();
            views.add(card);
            while (!views.isEmpty()) {
                View v = views.poll();
                if (v instanceof ViewGroup) {
                    ViewGroup g = (ViewGroup) v;
                    for (int i = 0; i < g.getChildCount(); i++) views.add(g.getChildAt(i));
                } else if (v instanceof Button) {
                    if (button == null) button = (Button) v;
                } else if (v instanceof TextView && message == null) {
                    message = (TextView) v;
                }
            }
            String text = helper == HelperApk.READY ? "You haven't added any GIF sources"
                    : helper == HelperApk.MISSING ? "To use GIFs, install the network helper app"
                    : "To use GIFs, reinstall the network helper app from this keyboard";
            if (message != null) message.setText(text);
            card.setContentDescription(text);
            if (button != null) {
                boolean install = helper != HelperApk.READY;
                button.setText(install ? "INSTALL" : "ADD SOURCES");
                button.setVisibility(View.VISIBLE);
                // The settings page installs it: Android's confirmation needs a visible activity.
                button.setOnClickListener(v -> v.getContext().startActivity(
                        new Intent(v.getContext(), ModMenuActivity.class)
                                .putExtra(ModMenuActivity.EXTRA_SECTION, ModMenuActivity.SECTION_GIF)
                                .putExtra(ModMenuActivity.EXTRA_INSTALL_HELPER, install)
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)));
            }
        } catch (Throwable t) {
            Log.w(TAG, "GIF error card", t);
        }
    }

    /** The phone has a network that offers internet (when that can't be read: assume it has). */
    private static boolean online(Context c) {
        try {
            ConnectivityManager cm = c.getSystemService(ConnectivityManager.class);
            NetworkCapabilities caps = cm.getNetworkCapabilities(cm.getActiveNetwork());
            return caps != null && caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        } catch (Throwable t) {
            return true;
        }
    }

    /**
     * Patched into the start of every HTTP executor's execute(HttpRequest) → ListenableFuture
     * (Cronet, OkHttp and their wrappers).
     * @return a future of Gboard's HttpResponse, or null to let Gboard handle the request itself
     *         (it fails: the app has no network permission).
     */
    public static Object execute(Object executor, Object request) {
        try {
            Uri uri = uriOf(request);
            if (uri == null || !"https".equals(uri.getScheme())) return null;
            String host = uri.getHost();
            boolean api = TENOR_API.equals(host);
            if (!api && !MEDIA_HOST.equals(host)) return null;
            if (api && !enabled()) return null;
            Class<?> futureType = futureType(executor.getClass(), request.getClass());
            if (futureType == null) return null;
            Answer answer = new Answer();
            Object future = java.lang.reflect.Proxy.newProxyInstance(futureType.getClassLoader(),
                    new Class<?>[]{futureType}, answer);
            POOL.execute(() -> answer.complete(api ? api(uri) : media(uri)));
            return future;
        } catch (Throwable t) {
            Log.w(TAG, "GIF request not handled", t);
            return null;
        }
    }

    private static Uri uriOf(Object request) throws IllegalAccessException {
        Field f = uriField;
        if (f == null || f.getDeclaringClass() != request.getClass()) {
            f = null;
            for (Field c : request.getClass().getDeclaredFields()) {
                if (c.getType() == Uri.class) {
                    c.setAccessible(true);
                    f = c;
                    break;
                }
            }
            if (f == null) return null;
            uriField = f;
        }
        return (Uri) f.get(request);
    }

    /** The executor method's return type: Gboard's (obfuscated) ListenableFuture interface. */
    private static Class<?> futureType(Class<?> executor, Class<?> request) {
        Class<?> cached = FUTURE_TYPES.get(executor);
        if (cached != null) return cached;
        for (Method m : executor.getMethods()) {
            Class<?>[] p = m.getParameterTypes();
            Class<?> r = m.getReturnType();
            if (p.length == 1 && p[0].isAssignableFrom(request) && r.isInterface()
                    && Future.class.isAssignableFrom(r)) {
                FUTURE_TYPES.put(executor, r);
                return r;
            }
        }
        return null;
    }

    /** Status and body of an HTTP answer. */
    static final class Result {
        final int code;
        final byte[] body;

        Result(int code, byte[] body) {
            this.code = code;
            this.body = body == null ? new byte[0] : body;
        }

        static Result ok(String json) {
            return new Result(200, json.getBytes(StandardCharsets.UTF_8));
        }

        boolean ok() {
            return code >= 200 && code < 300;
        }

        String text() {
            return new String(body, StandardCharsets.UTF_8);
        }
    }

    private static Result api(Uri tenor) {
        String endpoint = tenor.getLastPathSegment();
        if (endpoint == null) return new Result(404, null);
        // Share statistics and anonymous ids are Tenor's tracking: answered here, never sent.
        if (endpoint.equals("registershare") || endpoint.equals("anonid")) return Result.ok("{}");
        String q = tenor.getQueryParameter("q");
        q = q == null ? "" : q.trim();
        try {
            // Suggestions for the empty search box (chips) and the category row: the enabled sources.
            if ((endpoint.equals("autocomplete") && q.isEmpty()) || endpoint.equals("trending_terms")) {
                return Result.ok(chips());
            }
            if (endpoint.equals("categories")) return Result.ok(categories(tenor));
            if (endpoint.equals("posts")) return posts(tenor);
            Source source = activeSource();
            if (endpoint.equals("search")) {
                for (Source s : SOURCES) {
                    if (!s.label.equals(q)) continue;
                    // A source chip: search there from now on, starting with its trending GIFs. A chip
                    // left over from a source switched off since shows the current source's instead.
                    if (s.on()) {
                        active = s.id;
                        source = s;
                    }
                    endpoint = "featured";
                    tenor = without(tenor, "q");
                    break;
                }
            }
            return source == null ? new Result(404, null) : answer(source, endpoint, tenor);
        } catch (Throwable t) {
            Log.w(TAG, "GIF request failed: " + endpoint, t);
            return new Result(502, null);
        }
    }

    private static Result answer(Source s, String endpoint, Uri tenor) throws Exception {
        switch (s.id) {
            case "klipy":
                return tenorApi(s, "api.klipy.com", endpoint, tenor);
            case "giphy":
                return tenorApi(s, "api.giphy.com", endpoint, tenor);
            case "nekos":
                return NekosGifs.answer(endpoint, tenor);
            case "wikimedia":
                return WikimediaGifs.answer(endpoint, tenor);
            case "openverse":
                return OpenverseGifs.answer(endpoint, tenor);
            default:
                return new Result(404, null);
        }
    }

    /** KLIPY and GIPHY serve Tenor v2 themselves: the same request with the user's key. */
    private static Result tenorApi(Source s, String host, String endpoint, Uri tenor) throws Exception {
        String key = NoGoogleSettings.str(s.keySetting).trim();
        if (key.isEmpty()) {
            notice(s.label + " API key missing: add it in Gboard settings → No-Google → GIFs");
            return new Result(401, null);
        }
        Result r = fetch(providerUrl(endpoint, tenor, host, key));
        if (r.code == 401 || r.code == 403 || r.code == 404 && r.text().contains("API key")) {
            notice(s.label + " rejected the API key (HTTP " + r.code + ")");
        } else if (r.code == 429) {
            notice(s.label + " rate limit reached; try again later");
        }
        return r.ok() ? Result.ok(rewrite(r.text(), s.id)) : r;
    }

    static String providerUrl(String endpoint, Uri tenor, String host, String key) {
        Uri.Builder b = new Uri.Builder().scheme("https").authority(host).path("/v2/" + endpoint);
        for (String p : FORWARD) {
            String v = tenor.getQueryParameter(p);
            if (v != null) b.appendQueryParameter(p, v);
        }
        return b.appendQueryParameter("key", key).build().toString();
    }

    /** The chip row of the empty GIF search box, as Tenor autocomplete terms. */
    static String chips() throws Exception {
        JSONArray terms = new JSONArray();
        for (Source s : enabledSources()) terms.put(s.label);
        return new JSONObject().put("results", terms).toString();
    }

    /**
     * The category row: one tile per enabled source, pictured with its first trending GIF. Pictures are
     * looked up in parallel against a deadline and remembered, so the row stays well inside Gboard's
     * time limit (when it isn't, Gboard shows its built-in words instead; see {@link #fallbackTerms}).
     */
    static String categories(Uri tenor) throws Exception {
        List<Source> sources = enabledSources();
        List<Future<?>> lookups = new ArrayList<>();
        for (Source s : sources) {
            if (!PICTURES.containsKey(s.id)) lookups.add(PICTURE_POOL.submit(() -> picture(s, tenor)));
        }
        long deadline = SystemClock.elapsedRealtime() + PICTURE_DEADLINE_MS;
        for (Future<?> f : lookups) {
            try {
                f.get(Math.max(0, deadline - SystemClock.elapsedRealtime()), TimeUnit.MILLISECONDS);
            } catch (Throwable ignored) { // late or failed: that tile has no picture this time
            }
        }
        JSONArray tags = new JSONArray();
        for (Source s : sources) {
            String image = PICTURES.get(s.id);
            tags.put(new JSONObject().put("searchterm", s.label).put("name", s.label)
                    .put("path", "").put("image", image == null ? "" : image));
        }
        String locale = tenor.getQueryParameter("locale");
        return new JSONObject().put("locale", locale == null ? "en" : locale).put("tags", tags).toString();
    }

    private static void picture(Source s, Uri tenor) {
        try {
            Result r = answer(s, "featured", without(tenor, "limit").buildUpon()
                    .appendQueryParameter("limit", "1").build());
            JSONArray first = r.ok() ? new JSONObject(r.text()).optJSONArray("results") : null;
            JSONObject formats = first == null || first.length() == 0 ? null
                    : first.getJSONObject(0).optJSONObject("media_formats");
            JSONObject tiny = formats == null ? null : formats.optJSONObject("tinygif");
            String url = tiny == null ? "" : tiny.optString("url");
            if (!url.isEmpty()) PICTURES.put(s.id, url);
        } catch (Throwable t) {
            Log.w(TAG, "no picture for " + s.label, t);
        }
    }

    /**
     * Patched over Gboard's "is the cached Tenor answer expired?" check (its GIF category row is kept for
     * a day, in memory and on disk): with GIF sources set, always, so the row comes from the current
     * sources. The answers are made here and cheap; the cache stays as Gboard's fallback.
     */
    public static boolean tenorCacheExpired(boolean stock) {
        try {
            return stock || enabled();
        } catch (Throwable t) {
            return stock;
        }
    }

    /**
     * A GIF source was switched on or off: Gboard keeps its category row on disk for a day
     * (cache/tenor_cache/CATEGORIES_&lt;locale&gt;.pb) and only asks again once that expires, so it goes.
     */
    public static void sourcesChanged() {
        Context c = NoGoogleSettings.context();
        java.io.File[] cached = c == null ? null : new java.io.File(c.getCacheDir(), "tenor_cache").listFiles();
        if (cached == null) return;
        for (java.io.File f : cached) {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
    }

    /** Patched over Gboard's built-in GIF words (shown when a request fails): the enabled sources. */
    public static String[] fallbackTerms(String[] stock) {
        try {
            List<Source> on = enabledSources();
            if (on.isEmpty()) return stock;
            String[] labels = new String[on.size()];
            for (int i = 0; i < labels.length; i++) labels[i] = on.get(i).label;
            return labels;
        } catch (Throwable t) {
            return stock;
        }
    }

    /** GIFs by id ("source~id", e.g. recent GIFs), fetched from each one's own source. */
    private static Result posts(Uri tenor) throws Exception {
        String ids = tenor.getQueryParameter("ids");
        Map<String, List<String>> bySource = new LinkedHashMap<>();
        if (ids != null) {
            for (String id : ids.split(",")) {
                int sep = id.indexOf('~');
                if (sep <= 0) continue;
                bySource.computeIfAbsent(id.substring(0, sep), k -> new ArrayList<>()).add(id.substring(sep + 1));
            }
        }
        JSONArray all = new JSONArray();
        for (Map.Entry<String, List<String>> e : bySource.entrySet()) {
            Source s = byId(e.getKey());
            if (s == null || !s.on()) continue;
            Uri one = without(tenor, "ids").buildUpon()
                    .appendQueryParameter("ids", android.text.TextUtils.join(",", e.getValue())).build();
            Result r = answer(s, "posts", one);
            if (!r.ok()) continue;
            JSONArray got = new JSONObject(r.text()).optJSONArray("results");
            for (int i = 0; got != null && i < got.length(); i++) all.put(got.get(i));
        }
        return Result.ok(new JSONObject().put("results", all).toString());
    }

    private static Uri without(Uri uri, String param) {
        Uri.Builder b = uri.buildUpon().clearQuery();
        for (String name : uri.getQueryParameterNames()) {
            if (name.equals(param)) continue;
            for (String v : uri.getQueryParameters(name)) b.appendQueryParameter(name, v);
        }
        return b.build();
    }

    /**
     * Points every picture URL of a Tenor v2 answer at the reserved host, tags ids with their
     * source and fills fields Gboard's parser requires (id, title, url); results it could not
     * show are dropped.
     */
    static String rewrite(String json, String source) throws Exception {
        JSONObject root = new JSONObject(json);
        JSONArray results = root.optJSONArray("results");
        if (results != null && (results.length() == 0 || results.opt(0) instanceof JSONObject)) {
            JSONArray kept = new JSONArray();
            for (int i = 0; i < results.length(); i++) {
                JSONObject r = results.optJSONObject(i);
                if (r == null) continue;
                JSONObject formats = r.optJSONObject("media_formats");
                if (formats == null || r.optString("id").isEmpty()) continue;
                for (Iterator<String> it = formats.keys(); it.hasNext(); ) {
                    JSONObject f = formats.optJSONObject(it.next());
                    if (f == null) continue;
                    proxyField(f, "url");
                    proxyField(f, "preview");
                }
                r.put("id", source + "~" + r.optString("id"));
                if (!r.has("title") || r.isNull("title")) r.put("title", r.optString("content_description"));
                if (!r.has("url") || r.isNull("url")) r.put("url", "");
                kept.put(r);
            }
            root.put("results", kept);
        }
        JSONArray tags = root.optJSONArray("tags"); // categories
        if (tags != null) {
            for (int i = 0; i < tags.length(); i++) {
                JSONObject t = tags.optJSONObject(i);
                if (t != null) proxyField(t, "image");
            }
        }
        return root.toString();
    }

    private static void proxyField(JSONObject o, String name) throws Exception {
        String v = o.optString(name);
        if (v.startsWith("https://")) o.put(name, proxied(v));
    }

    /** https://gif.nogoogle.invalid/<base64url of the real URL>[.ext] (keeps the file type visible). */
    static String proxied(String url) {
        String path = Uri.parse(url).getPath();
        String ext = "";
        if (path != null) {
            int dot = path.lastIndexOf('.');
            if (dot > path.lastIndexOf('/') && path.length() - dot <= 5) ext = path.substring(dot).toLowerCase(Locale.ROOT);
        }
        String id = Base64.encodeToString(url.getBytes(StandardCharsets.UTF_8),
                Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
        return "https://" + MEDIA_HOST + "/" + id + ext;
    }

    /** Inverse of {@link #proxied}, or null. */
    static String realUrl(Uri proxied) {
        String seg = proxied.getLastPathSegment();
        if (seg == null) return null;
        int dot = seg.indexOf('.');
        if (dot >= 0) seg = seg.substring(0, dot);
        try {
            String url = new String(Base64.decode(seg, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING),
                    StandardCharsets.UTF_8);
            return url.startsWith("https://") ? url : null;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    private static Result media(Uri proxied) {
        String url = realUrl(proxied);
        return url == null ? new Result(404, null) : fetch(url);
    }

    // A provider call doesn't keep the helper out of Android's "cached" state while it streams the
    // answer, so it could be frozen mid-transfer (GIFs then fail until "try again"). The keyboard stays
    // bound to the helper while any transfer runs, and for a while after the last one.
    private static final long IDLE_MS = 60_000;
    private static final Runnable LET_HELPER_SLEEP = GifBridge::letHelperSleep;
    private static KeepAwake keepAwake; // these three guarded by GifBridge.class
    private static int transfers;
    private static Handler main; // made on first use: class init may run where there's no main looper

    private static Handler main() {
        if (main == null) main = new Handler(Looper.getMainLooper());
        return main;
    }

    /** A transfer through the network helper starts: keep it bound (awake) until endTransfer. */
    public static void beginTransfer() {
        Context c = NoGoogleSettings.context();
        synchronized (GifBridge.class) {
            transfers++;
            main().removeCallbacks(LET_HELPER_SLEEP);
            if (keepAwake != null || c == null) return;
            keepAwake = new KeepAwake();
            try {
                c.bindService(new Intent().setClassName(HELPER, HELPER + ".KeepAlive"), keepAwake,
                        Context.BIND_AUTO_CREATE);
            } catch (Throwable t) {
                Log.w(TAG, "cannot bind the network helper", t);
            }
        }
    }

    public static void endTransfer() {
        synchronized (GifBridge.class) {
            if (transfers > 0) transfers--;
            if (transfers == 0) main().postDelayed(LET_HELPER_SLEEP, IDLE_MS);
        }
    }

    private static void letHelperSleep() {
        unbind(null);
    }

    /** Drops the binding (only if it is still {@code which}, when given) unless a transfer runs. */
    private static void unbind(KeepAwake which) {
        KeepAwake k;
        synchronized (GifBridge.class) {
            if (which == null ? transfers > 0 : keepAwake != which) return;
            k = keepAwake;
            keepAwake = null;
        }
        Context c = NoGoogleSettings.context();
        if (k == null || c == null) return;
        try {
            c.unbindService(k);
        } catch (Throwable ignored) {
        }
    }

    private static final class KeepAwake implements ServiceConnection {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
        }

        @Override
        public void onBindingDied(ComponentName name) { // helper updated or stopped: bind afresh next time
            unbind(this);
        }

        @Override
        public void onNullBinding(ComponentName name) {
            unbind(this);
        }
    }

    /** GET through the network helper app (content://app.nogoogle.gifproxy/fetch?u=...). */
    static Result fetch(String url) {
        beginTransfer();
        try {
            return fetchOnce(url);
        } finally {
            endTransfer();
        }
    }

    private static Result fetchOnce(String url) {
        Context c = NoGoogleSettings.context();
        if (c == null) return new Result(503, null);
        Uri u = new Uri.Builder().scheme("content").authority(HELPER).path("fetch")
                .appendQueryParameter("u", url).build();
        ParcelFileDescriptor pfd;
        try {
            pfd = c.getContentResolver().openFileDescriptor(u, "r");
        } catch (FileNotFoundException | SecurityException e) {
            String m = String.valueOf(e.getMessage());
            // A missing helper, or one that doesn't serve this keyboard, is explained on the GIF tab's
            // error card, with an Install button.
            if (e instanceof SecurityException || m.contains("No content provider")) {
                Log.w(TAG, "network helper unavailable: " + m);
            } else {
                notice("The network helper refused the request: " + m);
            }
            return new Result(503, null);
        }
        if (pfd == null) return new Result(503, null);
        try (DataInputStream in = new DataInputStream(new FileInputStream(pfd.getFileDescriptor()))) {
            int code;
            try {
                code = in.readInt();
            } catch (IOException e) {
                // No HTTP status: the site couldn't be reached (offline, DNS, refused). Status 0 is what
                // Gboard's own network layer reports then, so the GIF tab says it is not connected.
                Log.w(TAG, "GIF site unreachable: " + e);
                return new Result(0, null);
            }
            byte[] body = readAll(in);
            pfd.checkError(); // the helper closes with an error if the transfer broke off
            return new Result(code, body);
        } catch (IOException e) {
            Log.w(TAG, "GIF download failed: " + e.getMessage());
            return new Result(504, null);
        } finally {
            try {
                pfd.close();
            } catch (IOException ignored) {
            }
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(64 << 10);
        byte[] buf = new byte[64 << 10];
        int n;
        while ((n = in.read(buf)) > 0) {
            if (out.size() + n > MAX_BODY) throw new IOException("answer too large");
            out.write(buf, 0, n);
        }
        return out.toByteArray();
    }

    /** A toast, at most once a minute per message. */
    static void notice(String message) {
        long now = SystemClock.elapsedRealtime();
        Long last = NOTICES.get(message);
        if (last != null && now - last < 60_000) return;
        NOTICES.put(message, now);
        Log.w(TAG, message);
        Context c = NoGoogleSettings.context();
        if (c != null) new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(c, message, Toast.LENGTH_LONG).show());
    }

    /** Gboard's HttpResponse for (code, body); added by the patch, found by fingerprint. */
    private static Object response(Result r) throws Exception {
        Method m = responseFactory;
        if (m == null) {
            m = GifBridge.class.getDeclaredMethod("gboardResponse", int.class, boolean.class, byte[].class);
            m.setAccessible(true);
            responseFactory = m;
        }
        return m.invoke(null, r.code, r.ok(), r.body);
    }

    /** Gboard's (obfuscated) ListenableFuture, completed by the GIF worker. */
    private static final class Answer implements InvocationHandler {
        private Object value;
        private Throwable error;
        private boolean done;
        private boolean cancelled;
        private final List<Runnable> listeners = new ArrayList<>();

        void complete(Result r) {
            Object v = null;
            Throwable e = null;
            try {
                v = response(r);
            } catch (Throwable t) {
                e = t;
            }
            finish(v, e, false);
        }

        private void finish(Object v, Throwable e, boolean cancel) {
            List<Runnable> run;
            synchronized (this) {
                if (done) return;
                value = v;
                error = e;
                cancelled = cancel;
                done = true;
                notifyAll();
                run = new ArrayList<>(listeners);
                listeners.clear();
            }
            for (Runnable l : run) l.run();
        }

        private synchronized Object get(long timeoutMs) throws InterruptedException, ExecutionException, TimeoutException {
            long deadline = timeoutMs < 0 ? 0 : SystemClock.elapsedRealtime() + timeoutMs;
            while (!done) {
                if (timeoutMs < 0) {
                    wait();
                } else {
                    long left = deadline - SystemClock.elapsedRealtime();
                    if (left <= 0) throw new TimeoutException();
                    wait(left);
                }
            }
            if (cancelled) throw new CancellationException();
            if (error != null) throw new ExecutionException(error);
            return value;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            Class<?>[] p = method.getParameterTypes();
            switch (method.getName()) {
                case "get":
                    return p.length == 2 ? get(((TimeUnit) args[1]).toMillis((Long) args[0])) : get(-1);
                case "isDone":
                    synchronized (this) {
                        return done;
                    }
                case "isCancelled":
                    synchronized (this) {
                        return cancelled;
                    }
                case "cancel":
                    synchronized (this) {
                        if (done) return false;
                    }
                    finish(null, null, true);
                    return true;
                case "equals":
                    return proxy == args[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "toString":
                    return "NoGoogleGifFuture";
                default:
                    break;
            }
            if (p.length == 2 && p[0] == Runnable.class && p[1] == Executor.class) { // addListener
                Runnable task = (Runnable) args[0];
                Executor executor = (Executor) args[1];
                Runnable l = () -> executor.execute(task);
                boolean now;
                synchronized (this) {
                    now = done;
                    if (!now) listeners.add(l);
                }
                if (now) l.run();
                return null;
            }
            throw new UnsupportedOperationException(method.toString());
        }
    }
}
