package software.santodan.extension.nuvioremaining;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.Instant;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/** Runtime bridge kept reflection-only so it does not package Nuvio or Compose classes. */
public final class NuvioRemainingEpisodes {
    private static final String TAG = "SantodanRemaining";
    private static final String PREFS = "santodan_nuvio_remaining_episodes";
    private static final String ENABLED = "enabled";
    private static final Map<String, String> TITLES = new ConcurrentHashMap<>();
    private static final Map<String, int[]> NEXT_EPISODES = new ConcurrentHashMap<>();
    private static final Map<String, Integer> REMAINING = new ConcurrentHashMap<>();
    private static final Set<String> FETCHING = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final ThreadLocal<Integer> PREPARED_BADGE = new ThreadLocal<>();
    private static volatile Object enabledState;
    private static volatile Object revisionState;
    private static volatile Object homeState;

    private NuvioRemainingEpisodes() {}

    public static void registerState(Object state) {
        homeState = state;
    }

    public static void register(Object nextUpInfo) {
        try {
            String id = (String) field(nextUpInfo, "a").get(nextUpInfo);
            String title = (String) field(nextUpInfo, "c").get(nextUpInfo);
            int season = ((Integer) field(nextUpInfo, "h").get(nextUpInfo)).intValue();
            int episode = ((Integer) field(nextUpInfo, "i").get(nextUpInfo)).intValue();
            if (id != null && title != null) {
                TITLES.put(id, title);
                NEXT_EPISODES.put(id, new int[]{season, episode});
                refreshRemaining(id);
                if (!REMAINING.containsKey(id)) fetchRemaining(id, season, episode);
            }
        } catch (Throwable error) {
            Log.e(TAG, "NextUpInfo registration failed", error);
            // The bytecode patch validates the model layout before installing this hook.
        }
    }

    public static void update(Map<?, ?> airedById, Map<?, ?> watchedById) {
        try {
            if (airedById == null || watchedById == null) return;
            // Tracking integrations can update these maps on another coroutine. Snapshot
            // both collections before counting so switching between Local/Trakt/Simkl
            // cannot leak a ConcurrentModificationException into Nuvio's refresh flow.
            Object[] entries = watchedById.entrySet().toArray();
            for (Object value : entries) {
                if (!(value instanceof Map.Entry)) continue;
                Map.Entry<?, ?> entry = (Map.Entry<?, ?>) value;
                String id = String.valueOf(entry.getKey());
                Object airedValue = airedById.get("series:" + id);
                if (!(airedValue instanceof Set)) airedValue = airedById.get("tv:" + id);
                if (!(airedValue instanceof Set) || !(entry.getValue() instanceof Set)) continue;
                Object[] aired = ((Set<?>) airedValue).toArray();
                Set<?> watched = (Set<?>) entry.getValue();
                int count = 0;
                for (Object episode : aired) if (!watched.contains(episode)) count++;
                REMAINING.put(id, count);
            }
            bumpRevision();
        } catch (Throwable error) {
            Log.e(TAG, "episode counting failed", error);
            // Counting is optional and must never interrupt a provider refresh.
        }
    }

    public static void renderSettings(Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0", false, loader);
            Object state = enabledState(loader);
            Object toggle = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) -> {
                if ("invoke".equals(method.getName())) {
                    boolean value = !stateValue(state);
                    preferences().edit().putBoolean(ENABLED, value).apply();
                    setStateValue(state, value);
                    return kotlinUnit(loader);
                }
                return objectMethod(proxy, method, args);
            });
            Object noop = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) ->
                "invoke".equals(method.getName()) ? kotlinUnit(loader) : objectMethod(proxy, method, args));
            Class<?> settings = Class.forName("fb.h3", false, loader);
            Method row = findStatic(settings, "t", 7);
            row.invoke(null, "Show remaining episodes", "Show aired, unwatched episode counts for Local, Trakt, Simkl, and other tracking sources.", stateValue(state), toggle, noop, composer, 24576);
        } catch (Throwable ignored) {
            // Keep the host settings screen usable if its Compose implementation changes.
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
        if (title == null) return;
        Integer count = null;
        for (Map.Entry<String, String> entry : TITLES.entrySet()) {
            if (title.equals(entry.getValue())) {
                refreshRemaining(entry.getKey());
                Integer candidate = REMAINING.get(entry.getKey());
                if (candidate != null && (count == null || candidate > count)) count = candidate;
            }
        }
        if (count == null || count <= 0) return;
        PREPARED_BADGE.set(count);
    }

    public static void renderPreparedBadge(Object composer) {
        Integer count = PREPARED_BADGE.get();
        PREPARED_BADGE.remove();
        if (count == null || composer == null) return;
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object revision = revisionState(loader);
            findMethod(revision.getClass(), "getValue", 0).invoke(revision);
            Class<?> text = Class.forName("x5.i2", false, loader);
            Method method = findStatic(text, "b", 19);
            Object[] style = badgeStyle(loader, composer);
            method.invoke(null, Integer.toString(count), style[0], style[1], 0L, null, null, 0L, null, 0L,
                0, false, 0, 0, null, style[2], composer, 0, 0, 65528);
        } catch (Throwable error) {
            Log.e(TAG, "badge compose failed", error);
            // A rendering failure must never break the Continue Watching row.
        }
    }

    private static Object[] badgeStyle(ClassLoader loader, Object composer) throws Exception {
        Method compositionLocal = findMethod(composer.getClass(), "j", 1);
        Class<?> colorsOwner = Class.forName("ib.x0", false, loader);
        Object colors = compositionLocal.invoke(composer, staticField(colorsOwner, "a").get(null));
        long surface = ((Number) field(colors, "a").get(colors)).longValue();
        long content = ((Number) field(colors, "l").get(colors)).longValue();
        long background = ((Number) findStatic(Class.forName("d2.z", false, loader), "b", 2)
            .invoke(null, Long.valueOf(surface), Float.valueOf(0.8f))).longValue();

        Class<?> typographyOwner = Class.forName("x5.k2", false, loader);
        Object typography = compositionLocal.invoke(composer, staticField(typographyOwner, "a").get(null));
        Object textStyle = field(typography, "o").get(typography);

        Object dimensions = staticField(Class.forName("ib.l0", false, loader), "a").get(null);
        float horizontal = ((Number) field(dimensions, "e").get(dimensions)).floatValue();
        float vertical = ((Number) field(dimensions, "d").get(dimensions)).floatValue();

        Class<?> modifierOwner = Class.forName("w1.n", false, loader);
        Object modifier = staticField(modifierOwner, "b").get(null);
        modifier = findStatic(Class.forName("e0.b", false, loader), "u", 2)
            .invoke(null, modifier, Float.valueOf(horizontal));
        Object shape = staticField(Class.forName("pa.f1", false, loader), "a").get(null);
        modifier = findStatic(Class.forName("a2.j", false, loader), "b", 2)
            .invoke(null, modifier, shape);
        Object rectangle = staticField(Class.forName("d2.g0", false, loader), "b").get(null);
        modifier = findStatic(Class.forName("y.l", false, loader), "g", 3)
            .invoke(null, modifier, Long.valueOf(background), rectangle);
        modifier = findStatic(Class.forName("e0.b", false, loader), "v", 3)
            .invoke(null, modifier, Float.valueOf(horizontal), Float.valueOf(vertical));
        return new Object[]{modifier, Long.valueOf(content), textStyle};
    }

    private static void fetchRemaining(String id, int nextSeason, int nextEpisode) {
        if (!id.startsWith("tt") || !FETCHING.add(id)) return;
        Thread worker = new Thread(() -> {
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(
                    "https://v3-cinemeta.strem.io/meta/series/" + id + ".json").openConnection();
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(8000);
                connection.setRequestProperty("Accept", "application/json");
                if (connection.getResponseCode() / 100 != 2) return;
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                try (InputStream input = connection.getInputStream()) {
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = input.read(buffer)) >= 0) output.write(buffer, 0, read);
                }
                byte[] bytes = output.toByteArray();
                JSONArray videos = new JSONObject(new String(bytes, java.nio.charset.StandardCharsets.UTF_8))
                    .optJSONObject("meta").optJSONArray("videos");
                if (videos == null) return;
                Set<String> episodes = Collections.newSetFromMap(new ConcurrentHashMap<>());
                Instant now = Instant.now();
                for (int i = 0; i < videos.length(); i++) {
                    JSONObject video = videos.optJSONObject(i);
                    if (video == null) continue;
                    int season = video.optInt("season", -1);
                    int episode = video.optInt("episode", -1);
                    if (season < 1 || episode < 1) continue;
                    String released = video.optString("released", null);
                    if (released != null) {
                        try { if (Instant.parse(released).isAfter(now)) continue; }
                        catch (Throwable ignored) { }
                    }
                    if (season > nextSeason || season == nextSeason && episode >= nextEpisode)
                        episodes.add(season + ":" + episode);
                }
                int count = episodes.size();
                REMAINING.put(id, count);
                bumpRevision();
            } catch (Throwable error) {
                Log.e(TAG, "fallback metadata fetch failed id=" + id, error);
            } finally {
                if (connection != null) connection.disconnect();
                FETCHING.remove(id);
            }
        }, "SantodanRemaining-" + id);
        worker.setDaemon(true);
        worker.start();
    }

    private static void refreshRemaining(String id) {
        Object state = homeState;
        int[] next = NEXT_EPISODES.get(id);
        if (state == null || next == null) return;
        try {
            Object value = field(state, "M0").get(state);
            if (!(value instanceof Map)) return;
            Map<?, ?> airedById = (Map<?, ?>) value;
            Object airedValue = airedById.get("series:" + id);
            if (!(airedValue instanceof Set)) airedValue = airedById.get("tv:" + id);
            if (!(airedValue instanceof Set)) return;
            int count = 0;
            for (Object item : ((Set<?>) airedValue).toArray()) {
                if (item == null) continue;
                Object first = findMethod(item.getClass(), "getFirst", 0).invoke(item);
                Object second = findMethod(item.getClass(), "getSecond", 0).invoke(item);
                if (!(first instanceof Number) || !(second instanceof Number)) continue;
                int season = ((Number) first).intValue();
                int episode = ((Number) second).intValue();
                if (season > next[0] || season == next[0] && episode >= next[1]) count++;
            }
            REMAINING.put(id, count);
            bumpRevision();
        } catch (Throwable error) {
            Log.e(TAG, "direct remaining calculation failed id=" + id, error);
        }
    }

    private static boolean enabled() {
        try { return preferences().getBoolean(ENABLED, false); }
        catch (Throwable ignored) { return false; }
    }

    private static Object enabledState(ClassLoader loader) throws Exception {
        Object result = enabledState;
        if (result != null) return result;
        synchronized (NuvioRemainingEpisodes.class) {
            result = enabledState;
            if (result == null) {
                Class<?> compose = Class.forName("g1.h", false, loader);
                result = findStatic(compose, "s", 1).invoke(null, Boolean.valueOf(enabled()));
                enabledState = result;
            }
        }
        return result;
    }

    private static Object revisionState(ClassLoader loader) throws Exception {
        Object result = revisionState;
        if (result != null) return result;
        synchronized (NuvioRemainingEpisodes.class) {
            result = revisionState;
            if (result == null) {
                Class<?> compose = Class.forName("g1.h", false, loader);
                result = findStatic(compose, "s", 1).invoke(null, Integer.valueOf(0));
                revisionState = result;
            }
        }
        return result;
    }

    private static void bumpRevision() {
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
    }

    private static boolean stateValue(Object state) throws Exception {
        return ((Boolean) findMethod(state.getClass(), "getValue", 0).invoke(state)).booleanValue();
    }

    private static void setStateValue(Object state, boolean value) throws Exception {
        findMethod(state.getClass(), "setValue", 1).invoke(state, Boolean.valueOf(value));
    }

    private static SharedPreferences preferences() throws Exception {
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Application app = (Application) activityThread.getMethod("currentApplication").invoke(null);
        if (app == null) throw new IllegalStateException("Application is unavailable");
        return app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
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
        if ("toString".equals(method.getName())) return "NuvioRemainingEpisodesCallback";
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
