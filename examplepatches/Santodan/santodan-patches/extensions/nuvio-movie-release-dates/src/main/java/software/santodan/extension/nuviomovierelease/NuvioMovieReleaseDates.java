package software.santodan.extension.nuviomovierelease;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/** Runtime bridge kept reflection-only so it does not package Nuvio or Compose classes. */
public final class NuvioMovieReleaseDates {
    private static final String TAG = "SantodanMovieRelease";
    private static final String PREFS = "santodan_nuvio_movie_release_dates";
    private static final String LIBRARY = "library";
    private static final String COLLECTIONS = "collections";
    // Scope belongs to each captured card/restart lambda, never to a shared media model.
    private static final ThreadLocal<String> CONTEXT = new ThreadLocal<>();
    private static final ThreadLocal<java.util.ArrayDeque<String>> STACK =
        ThreadLocal.withInitial(java.util.ArrayDeque::new);
    private static final Map<Object, String> CARDS = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Map<String, Object> STATES = new ConcurrentHashMap<>();
    private static final String RELEASE_PREFIX = "release_v1_";
    private static final String CHECKED_PREFIX = "release_checked_v1_";
    private static final long RELEASE_CACHE_MS = 6L * 60L * 60L * 1000L;
    private static final Map<String, String> RELEASES = new ConcurrentHashMap<>();
    private static final Set<String> FETCHING = Collections.newSetFromMap(new ConcurrentHashMap<>());
    // One worker and a bounded queue keep large libraries from creating a thread per card.
    private static final java.util.concurrent.ThreadPoolExecutor FETCHER = new java.util.concurrent.ThreadPoolExecutor(
        1, 1, 30L, java.util.concurrent.TimeUnit.SECONDS, new java.util.concurrent.ArrayBlockingQueue<>(64),
        task -> { Thread worker = new Thread(task, "SantodanMovieRelease"); worker.setDaemon(true); return worker; });
    private static final ThreadLocal<String> PREPARED_BADGE = new ThreadLocal<>();
    private static final AtomicBoolean REVISION_PENDING = new AtomicBoolean();
    private static volatile Object revisionState;

    private NuvioMovieReleaseDates() {}

    public static void libraryItem(Object ignored) { enter(LIBRARY); }
    public static void collectionItem(Object ignored) { enter(COLLECTIONS); }
    private static void enter(String context) {
        String previous = CONTEXT.get();
        STACK.get().push(previous == null ? "" : previous);
        CONTEXT.set(context);
    }
    public static void exitContext() {
        java.util.ArrayDeque<String> stack = STACK.get();
        if (stack.isEmpty()) { CONTEXT.remove(); return; }
        String previous = stack.pop();
        if (previous.isEmpty()) CONTEXT.remove(); else CONTEXT.set(previous);
    }
    public static void captureContext(Object lambda) {
        String context = CONTEXT.get();
        if (context != null && !context.isEmpty()) CARDS.put(lambda, context);
    }
    public static void enterContext(Object lambda) { enter(CARDS.getOrDefault(lambda, "")); }

    public static void renderSettings(Object composer) {
        renderSetting(composer, LIBRARY, "Show upcoming movie dates in library");
        renderSetting(composer, COLLECTIONS, "Show upcoming movie dates in collections");
    }

    private static void renderSetting(Object composer, String key, String title) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0", false, loader);
            Object state = enabledState(loader, key);
            Object toggle = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) -> {
                if ("invoke".equals(method.getName())) {
                    boolean value = !stateValue(state);
                    preferences().edit().putBoolean(key, value).apply();
                    setStateValue(state, value);
                    Log.d(TAG, "setting changed scope=" + key + " enabled=" + value);
                    bumpRevision();
                    return kotlinUnit(loader);
                }
                return objectMethod(proxy, method, args);
            });
            Object noop = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) ->
                "invoke".equals(method.getName()) ? kotlinUnit(loader) : objectMethod(proxy, method, args));
            Method row = findStatic(Class.forName(NuvioRuntimeLayout.name("sa.eb"), false, loader), "m", 13);
            row.invoke(null, title,
                "Show known release dates on unreleased movie posters (dd-MMM-yy).",
                stateValue(state), toggle, null, noop, false, null, 0L, false, composer, 0, 1008);
        } catch (Throwable error) {
            Log.e(TAG, "settings row rendering failed", error);
            // Keep the host settings screen usable if its Compose implementation changes.
        }
    }

    public static void prepareBadge(Object cardLambda) {
        PREPARED_BADGE.remove();
        if (cardLambda == null) return;
        try {
            boolean library = cardLambda.getClass().getName().equals(NuvioRuntimeLayout.name("ba.n3"));
            Object item = field(cardLambda, library ? "m" : "o").get(cardLambda);
            String context = CARDS.get(cardLambda);
            if (context == null || !enabled(context)) return;
            if (!"movie".equals(findMethod(item.getClass(), "getApiType", 0).invoke(item))) return;
            String released = (String) findMethod(item.getClass(), "getReleased", 0).invoke(item);
            String info = (String) findMethod(item.getClass(), "getReleaseInfo", 0).invoke(item);
            java.time.Clock clock = java.time.Clock.systemDefaultZone();
            String known = MovieReleaseDate.firstKnown(released, info, clock.getZone());
            if (known == null) {
                if (MovieReleaseDate.isPastYearOnly(released, info, clock)) return;
                String id = (String) findMethod(item.getClass(), "getImdbId", 0).invoke(item);
                if (!validId(id)) id = (String) findMethod(item.getClass(), "getId", 0).invoke(item);
                if (!validId(id)) return;
                known = RELEASES.get(id);
                if (known == null) known = preferences().getString(RELEASE_PREFIX + id, null);
                fetchReleaseAsync(id);
            }
            String badge = MovieReleaseDate.upcomingBadge(known, clock);
            if (badge != null) PREPARED_BADGE.set(badge);
        } catch (Throwable error) { Log.e(TAG, "movie release badge preparation failed", error); }
    }

    public static void renderPreparedBadge(Object composer) {
        String badge = PREPARED_BADGE.get();
        PREPARED_BADGE.remove();
        if (composer == null) return;
        try (NuvioBadgeComposition group = NuvioBadgeComposition.begin(composer, 1403088900)) {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object revision = revisionState(loader);
            findMethod(revision.getClass(), "getValue", 0).invoke(revision);
            // Subscribe every card so asynchronously loaded movie dates recompose.
            if (badge == null) return;
            Class<?> text = Class.forName("x5.g2", false, loader);
            Method method = findStatic(text, "b", 19);
            Object boxScope = staticField(Class.forName("e0.v", false, loader), "a").get(null);
            Object[] style = badgeStyle(loader, boxScope, composer);
            // Compose packs sp as a unit tag followed by the float's bits.
            long fontSize = 0x100000000L | (Float.floatToRawIntBits(14f) & 0xffffffffL);
            method.invoke(null, badge, style[0], style[1], fontSize, null, null, 0L, null, 0L,
                0, false, 0, 0, null, style[2], composer, 0, 0, 65520);
        } catch (Throwable error) {
            Log.e(TAG, "badge compose failed", error);
            // Keep the host card usable if badge rendering fails.
        }
    }

    private static Object[] badgeStyle(ClassLoader loader, Object boxScope, Object composer) throws Exception {
        Method compositionLocal = findMethod(composer.getClass(), "j", 1);
        // Compose's sRGB Color representation stores ARGB in the upper 32 bits.
        long content = 0xffffffff00000000L;
        long background = 0xff1976d200000000L;

        Class<?> typographyOwner = Class.forName("x5.i2", false, loader);
        Object typography = compositionLocal.invoke(composer, staticField(typographyOwner, "a").get(null));
        Object textStyle = field(typography, "o").get(typography);

        float horizontal = 6f;
        float vertical = 3f;

        Class<?> modifierOwner = Class.forName("w1.n", false, loader);
        Object modifier = staticField(modifierOwner, "b").get(null);
        Object bottomCenter = staticField(Class.forName("w1.b", false, loader), "h").get(null);
        modifier = findMethod(boxScope.getClass(), "a", 2).invoke(boxScope, modifier, bottomCenter);
        Class<?> modifierType = Class.forName("w1.q", false, loader);
        java.lang.reflect.Constructor<?> layerConstructor = Class.forName("w1.v", false, loader)
            .getDeclaredConstructor(float.class);
        layerConstructor.setAccessible(true);
        Object layer = layerConstructor.newInstance(10f);
        modifier = modifierType.getMethod("d", modifierType).invoke(modifier, layer);
        modifier = findStatic(Class.forName("e0.b", false, loader), "u", 2)
            .invoke(null, modifier, Float.valueOf(horizontal));
        Object shape = staticField(Class.forName(NuvioRuntimeLayout.name("ba.d3"), false, loader), "a").get(null);
        modifier = findStatic(Class.forName("a2.j", false, loader), "b", 2)
            .invoke(null, modifier, shape);
        Object rectangle = staticField(Class.forName("d2.g0", false, loader), "b").get(null);
        modifier = findStatic(Class.forName("y.l", false, loader), "g", 3)
            .invoke(null, modifier, Long.valueOf(background), rectangle);
        modifier = findStatic(Class.forName("e0.b", false, loader), "v", 3)
            .invoke(null, modifier, Float.valueOf(horizontal), Float.valueOf(vertical));
        return new Object[]{modifier, Long.valueOf(content), textStyle};
    }

    private static boolean validId(String id) { return id != null && id.matches("tt[0-9]+"); }

    private static void fetchRelease(String id) {
        long nowMs = System.currentTimeMillis();
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(
                "https://catalog.nuvio.tv/meta/movie/" + id + ".json").openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(8000);
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() / 100 != 2) {
                preferences().edit().putLong(CHECKED_PREFIX + id, nowMs).apply();
                return;
            }
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            try (InputStream input = connection.getInputStream()) {
                byte[] buffer = new byte[8192]; int read;
                while ((read = input.read(buffer)) >= 0) {
                    if (output.size() + read > 1024 * 1024) throw new java.io.IOException("Movie metadata too large");
                    output.write(buffer, 0, read);
                }
            }
            JSONObject meta = new JSONObject(new String(output.toByteArray(),
                java.nio.charset.StandardCharsets.UTF_8)).optJSONObject("meta");
            String known = meta == null ? null : MovieReleaseDate.firstKnown(
                meta.optString("released", null), meta.optString("releaseInfo", null), java.time.ZoneId.systemDefault());
            if (known != null) RELEASES.put(id, known); else RELEASES.remove(id);
            preferences().edit().putString(RELEASE_PREFIX + id, known)
                .putLong(CHECKED_PREFIX + id, nowMs).apply();
            Log.d(TAG, "movie metadata id=" + id + " release=" + known);
            bumpRevision();
        } catch (Throwable error) {
            try { preferences().edit().putLong(CHECKED_PREFIX + id, nowMs).apply(); } catch (Throwable ignored) { }
            Log.e(TAG, "movie metadata fetch failed id=" + id, error);
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static void fetchReleaseAsync(String id) throws Exception {
        long checked = preferences().getLong(CHECKED_PREFIX + id, 0L);
        long age = System.currentTimeMillis() - checked;
        if (checked > 0L && age >= 0L && age < RELEASE_CACHE_MS) return;
        if (!FETCHING.add(id)) return;
        try {
            FETCHER.execute(() -> {
                try { fetchRelease(id); }
                finally { FETCHING.remove(id); }
            });
        } catch (java.util.concurrent.RejectedExecutionException full) { FETCHING.remove(id); }
    }

    private static boolean enabled(String key) {
        try { return preferences().getBoolean(key, false); }
        catch (Throwable ignored) { return false; }
    }

    private static Object enabledState(ClassLoader loader, String key) throws Exception {
        Object result = STATES.get(key);
        if (result != null) return result;
        synchronized (NuvioMovieReleaseDates.class) {
            result = STATES.get(key);
            if (result == null) {
                Class<?> compose = Class.forName("g1.j", false, loader);
                result = findStatic(compose, "r", 1).invoke(null, Boolean.valueOf(enabled(key)));
                STATES.put(key, result);
            }
        }
        return result;
    }

    private static Object revisionState(ClassLoader loader) throws Exception {
        Object result = revisionState;
        if (result != null) return result;
        synchronized (NuvioMovieReleaseDates.class) {
            result = revisionState;
            if (result == null) {
                Class<?> compose = Class.forName("g1.j", false, loader);
                result = findStatic(compose, "r", 1).invoke(null, Integer.valueOf(0));
                revisionState = result;
            }
        }
        return result;
    }

    private static void bumpRevision() {
        if (revisionState == null || !REVISION_PENDING.compareAndSet(false, true)) return;
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            REVISION_PENDING.set(false);
            Object state = revisionState;
            if (state == null) return;
            try {
                Method getter = findMethod(state.getClass(), "getValue", 0);
                Method setter = findMethod(state.getClass(), "setValue", 1);
                int value = ((Number) getter.invoke(state)).intValue();
                setter.invoke(state, Integer.valueOf(value + 1));
            } catch (Throwable error) {
                Log.e(TAG, "revision state update failed", error);
            }
        }, 100L);
    }

    private static boolean stateValue(Object state) throws Exception {
        return ((Boolean) findMethod(state.getClass(), "getValue", 0).invoke(state)).booleanValue();
    }

    private static void setStateValue(Object state, boolean value) throws Exception {
        findMethod(state.getClass(), "setValue", 1).invoke(state, Boolean.valueOf(value));
    }

    private static SharedPreferences preferences() throws Exception {
        return application().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Application application() throws Exception {
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Application app = (Application) activityThread.getMethod("currentApplication").invoke(null);
        if (app == null) throw new IllegalStateException("Application is unavailable");
        return app;
    }

    private static Object kotlinUnit(ClassLoader loader) throws Exception {
        Class<?> unit = Class.forName("kotlin.Unit", false, loader);
        Field instance;
        try { instance = unit.getField("INSTANCE"); }
        catch (NoSuchFieldException ignored) { instance = unit.getField("a"); }
        return instance.get(null);
    }

    private static Object objectMethod(Object proxy, Method method, Object[] args) {
        if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
        if ("equals".equals(method.getName())) return proxy == (args == null ? null : args[0]);
        if ("toString".equals(method.getName())) return "NuvioMovieReleaseDatesCallback";
        return null;
    }

    private static Field field(Object owner, String name) throws Exception {
        Field result = owner.getClass().getDeclaredField(name);
        result.setAccessible(true);
        return result;
    }

    private static Field staticField(Class<?> owner, String name) throws Exception {
        Field result = owner.getDeclaredField(name);
        result.setAccessible(true);
        return result;
    }

    private static Method findStatic(Class<?> owner, String name, int parameters) throws Exception {
        for (Method method : owner.getDeclaredMethods()) {
            if (method.getName().equals(name) && method.getParameterTypes().length == parameters) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException(owner.getName() + '.' + name + '/' + parameters);
    }

    private static Method findMethod(Class<?> owner, String name, int parameters) throws Exception {
        Class<?> current = owner;
        while (current != null) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getName().equals(name) && method.getParameterTypes().length == parameters) {
                    method.setAccessible(true);
                    return method;
                }
            }
            current = current.getSuperclass();
        }
        for (Class<?> contract : owner.getInterfaces()) {
            for (Method method : contract.getMethods()) {
                if (method.getName().equals(name) && method.getParameterTypes().length == parameters) return method;
            }
        }
        throw new NoSuchMethodException(owner.getName() + '.' + name + '/' + parameters);
    }
}
