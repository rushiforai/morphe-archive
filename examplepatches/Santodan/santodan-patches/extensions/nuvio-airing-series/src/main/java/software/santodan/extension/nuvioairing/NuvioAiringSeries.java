package software.santodan.extension.nuvioairing;

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
import java.time.Instant;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/** Runtime bridge kept reflection-only so it does not package Nuvio or Compose classes. */
public final class NuvioAiringSeries {
    private static final String TAG = "SantodanAiring";
    private static final String PREFS = "santodan_nuvio_airing_series";
    private static final String ENABLED = "enabled";
    private static final String FINALE_PREFIX = "finale_v1_";
    private static final String CHECKED_PREFIX = "finale_checked_v1_";
    private static final long FINALE_CACHE_MS = 6L * 60L * 60L * 1000L;
    private static final Map<String, String> TITLES = new ConcurrentHashMap<>();
    private static final Map<String, Long> FINALES = new ConcurrentHashMap<>();
    private static final Set<String> FETCHING = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();
    private static final ThreadLocal<String> PREPARED_BADGE = new ThreadLocal<>();
    private static final AtomicBoolean REVISION_PENDING = new AtomicBoolean();
    private static volatile Object enabledState;
    private static volatile Object revisionState;

    private NuvioAiringSeries() {}

    private static volatile Boolean newerLayout;

    private static boolean beta4() throws Exception {
        Boolean cached = newerLayout;
        if (cached == null) {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
            if (app == null) throw new IllegalStateException("Application is unavailable");
            cached = !"1.1.0-beta.2".equals(app.getPackageManager()
                .getPackageInfo(app.getPackageName(), 0).versionName);
            newerLayout = cached;
        }
        return cached.booleanValue();
    }

    public static void register(Object nextUpInfo) {
        try {
            String id = (String) field(nextUpInfo, "a").get(nextUpInfo);
            String title = (String) field(nextUpInfo, "c").get(nextUpInfo);
            int season = ((Integer) field(nextUpInfo, "h").get(nextUpInfo)).intValue();
            int episode = ((Integer) field(nextUpInfo, "i").get(nextUpInfo)).intValue();
            Integer seedSeason = (Integer) field(nextUpInfo, "x").get(nextUpInfo);
            Integer seedEpisode = (Integer) field(nextUpInfo, "y").get(nextUpInfo);
            if (id != null && title != null) {
                TITLES.put(id, title);
                boolean active = enabled();
                if (LOGGED.add("register:" + id)) Log.d(TAG, "registered id=" + id + " title=" + title
                    + " next=" + season + ':' + episode + " seed=" + seedSeason + ':' + seedEpisode
                    + " enabled=" + active);
                if (active) {
                    if (Looper.myLooper() == Looper.getMainLooper()) fetchFinaleAsync(id);
                    else fetchFinale(id);
                }
            }
        } catch (Throwable error) {
            Log.e(TAG, "NextUpInfo registration failed", error);
            // The bytecode patch validates the model layout before installing this hook.
        }
    }

    public static void renderSettings(Object composer) {
        try {
            Log.d(TAG, "renderSettings reached composer=" + composer.getClass().getName());
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0", false, loader);
            Object state = enabledState(loader);
            Object toggle = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) -> {
                if ("invoke".equals(method.getName())) {
                    boolean value = !stateValue(state);
                    preferences().edit().putBoolean(ENABLED, value).apply();
                    setStateValue(state, value);
                    Log.d(TAG, "setting changed enabled=" + value);
                    if (value) for (String id : TITLES.keySet()) fetchFinaleAsync(id);
                    return kotlinUnit(loader);
                }
                return objectMethod(proxy, method, args);
            });
            Object noop = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) ->
                "invoke".equals(method.getName()) ? kotlinUnit(loader) : objectMethod(proxy, method, args));
            Method row = findStatic(Class.forName(NuvioRuntimeLayout.name("sa.eb"), false, loader), "m", 13);
            row.invoke(null, "Keep airing series in Upcoming",
                "With Separate Upcoming Row, keep library series there until their latest scheduled episode has aired.",
                stateValue(state), toggle, null, noop, false, null, 0L, false, composer, 0, 1008);
            Log.d(TAG, "renderSettings row rendered");
        } catch (Throwable error) {
            Log.e(TAG, "settings row rendering failed", error);
            // Keep the host settings screen usable if its Compose implementation changes.
        }
    }

    public static boolean effectiveHasAired(Object nextUpInfo) {
        if (nextUpInfo == null) return true;
        try {
            boolean nativeHasAired = field(nextUpInfo, "n").getBoolean(nextUpInfo);
            if (!nativeHasAired || !enabled()) return nativeHasAired;
            String id = (String) field(nextUpInfo, "a").get(nextUpInfo);
            Long finale = FINALES.get(id);
            if (finale == null) {
                long cached = preferences().getLong(FINALE_PREFIX + id, -1L);
                if (cached > 0L) { finale = Long.valueOf(cached); FINALES.put(id, finale); }
            }
            if (finale == null) fetchFinaleAsync(id);
            boolean result = finale == null || finale.longValue() <= System.currentTimeMillis();
            String logKey = "split:" + id + ':' + nativeHasAired + ':' + finale + ':' + result;
            if (LOGGED.add(logKey)) Log.d(TAG, "split id=" + id + " nativeHasAired=" + nativeHasAired
                + " finale=" + finale + " effectiveHasAired=" + result);
            return result;
        } catch (Throwable error) {
            Log.e(TAG, "airing-series classification failed", error);
            return true;
        }
    }

    public static void prepareBadge(Object cardLambda) {
        PREPARED_BADGE.remove();
        if (!enabled() || cardLambda == null) return;
        String title;
        try { title = (String) field(cardLambda, "r").get(cardLambda); }
        catch (Throwable error) {
            Log.e(TAG, "card title read failed class=" + cardLambda.getClass().getName(), error);
            return;
        }
        prepareTitle(title);
    }

    public static void prepareTitle(String title) {
        PREPARED_BADGE.remove();
        if (!enabled() || title == null) return;
        Long finale = null;
        for (Map.Entry<String, String> entry : TITLES.entrySet()) if (title.equals(entry.getValue())) {
            Long candidate = FINALES.get(entry.getKey());
            if (candidate != null && candidate.longValue() > System.currentTimeMillis()
                && (finale == null || candidate.longValue() > finale.longValue())) finale = candidate;
        }
        if (finale != null) PREPARED_BADGE.set(
            new SimpleDateFormat("dd-MMM", Locale.getDefault()).format(new Date(finale.longValue())));
    }

    public static void renderPreparedBadge(Object composer) {
        String badge = PREPARED_BADGE.get();
        PREPARED_BADGE.remove();
        if (composer == null) return;
        try (NuvioBadgeComposition group = NuvioBadgeComposition.begin(composer, 1403088898)) {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object revision = revisionState(loader);
            findMethod(revision.getClass(), "getValue", 0).invoke(revision);
            // Subscribe every card so asynchronously loaded finale dates recompose.
            if (badge == null) return;
            Class<?> text = Class.forName(beta4() ? "x5.g2" : "x5.i2", false, loader);
            Method method = findStatic(text, "b", 19);
            Object boxScope = staticField(Class.forName("e0.v", false, loader), "a").get(null);
            Object[] style = badgeStyle(loader, boxScope, composer);
            // Compose packs sp as a unit tag followed by the float's bits.
            long fontSize = 0x100000000L | (Float.floatToRawIntBits(14f) & 0xffffffffL);
            method.invoke(null, badge, style[0], style[1], fontSize, null, null, 0L, null, 0L,
                0, false, 0, 0, null, style[2], composer, 0, 0, 65520);
        } catch (Throwable error) {
            Log.e(TAG, "badge compose failed", error);
            // A rendering failure must never break the Continue Watching row.
        }
    }

    private static Object[] badgeStyle(ClassLoader loader, Object boxScope, Object composer) throws Exception {
        Method compositionLocal = findMethod(composer.getClass(), "j", 1);
        // Compose's sRGB Color representation stores ARGB in the upper 32 bits.
        long content = 0xffffffff00000000L;
        long background = 0xff1976d200000000L;

        Class<?> typographyOwner = Class.forName(beta4() ? "x5.i2" : "x5.k2", false, loader);
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
        Object shape = staticField(Class.forName(beta4() ? NuvioRuntimeLayout.name("ba.d3") : "pa.g1", false, loader), "a").get(null);
        modifier = findStatic(Class.forName("a2.j", false, loader), "b", 2)
            .invoke(null, modifier, shape);
        Object rectangle = staticField(Class.forName("d2.g0", false, loader), "b").get(null);
        modifier = findStatic(Class.forName("y.l", false, loader), "g", 3)
            .invoke(null, modifier, Long.valueOf(background), rectangle);
        modifier = findStatic(Class.forName("e0.b", false, loader), "v", 3)
            .invoke(null, modifier, Float.valueOf(horizontal), Float.valueOf(vertical));
        return new Object[]{modifier, Long.valueOf(content), textStyle};
    }

    private static void fetchFinale(String id) {
        if (id == null || !id.startsWith("tt")) return;
        long nowMs = System.currentTimeMillis();
        try {
            long checked = preferences().getLong(CHECKED_PREFIX + id, 0L);
            if (nowMs - checked < FINALE_CACHE_MS) {
                long cached = preferences().getLong(FINALE_PREFIX + id, 0L);
                if (cached > 0L) FINALES.put(id, Long.valueOf(cached));
                return;
            }
        } catch (Throwable ignored) { }
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(
                "https://catalog.nuvio.tv/meta/series/" + id + ".json").openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(8000);
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() / 100 != 2) return;
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            try (InputStream input = connection.getInputStream()) {
                byte[] buffer = new byte[8192]; int read;
                while ((read = input.read(buffer)) >= 0) output.write(buffer, 0, read);
            }
            JSONObject meta = new JSONObject(new String(output.toByteArray(),
                java.nio.charset.StandardCharsets.UTF_8)).optJSONObject("meta");
            JSONArray videos = meta == null ? null : meta.optJSONArray("videos");
            if (videos == null) return;
            Instant finale = null;
            for (int i = 0; i < videos.length(); i++) {
                JSONObject video = videos.optJSONObject(i);
                if (video == null) continue;
                String released = video.optString("released", null);
                if (released == null) continue;
                try {
                    Instant candidate = Instant.parse(released);
                    if (finale == null || candidate.isAfter(finale)) finale = candidate;
                } catch (Throwable ignored) { }
            }
            long finaleMs = finale == null ? 0L : finale.toEpochMilli();
            if (finaleMs > 0L) FINALES.put(id, Long.valueOf(finaleMs)); else FINALES.remove(id);
            preferences().edit().putLong(FINALE_PREFIX + id, finaleMs)
                .putLong(CHECKED_PREFIX + id, nowMs).apply();
            Log.d(TAG, "finale id=" + id + " date=" + finaleMs);
            bumpRevision();
        } catch (Throwable error) {
            Log.e(TAG, "finale metadata fetch failed id=" + id, error);
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static void fetchFinaleAsync(String id) {
        if (!FETCHING.add("finale:" + id)) return;
        Thread worker = new Thread(() -> {
            try { fetchFinale(id); }
            finally { FETCHING.remove("finale:" + id); }
        }, "SantodanAiring-" + id);
        worker.setDaemon(true);
        worker.start();
    }

    private static boolean enabled() {
        try { return preferences().getBoolean(ENABLED, false); }
        catch (Throwable ignored) { return false; }
    }

    private static Object enabledState(ClassLoader loader) throws Exception {
        Object result = enabledState;
        if (result != null) return result;
        synchronized (NuvioAiringSeries.class) {
            result = enabledState;
            if (result == null) {
                Class<?> compose = Class.forName(beta4() ? "g1.j" : "g1.h", false, loader);
                result = findStatic(compose, beta4() ? "r" : "s", 1).invoke(null, Boolean.valueOf(enabled()));
                enabledState = result;
            }
        }
        return result;
    }

    private static Object revisionState(ClassLoader loader) throws Exception {
        Object result = revisionState;
        if (result != null) return result;
        synchronized (NuvioAiringSeries.class) {
            result = revisionState;
            if (result == null) {
                Class<?> compose = Class.forName(beta4() ? "g1.j" : "g1.h", false, loader);
                result = findStatic(compose, beta4() ? "r" : "s", 1).invoke(null, Integer.valueOf(0));
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
        if ("toString".equals(method.getName())) return "NuvioAiringSeriesCallback";
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


