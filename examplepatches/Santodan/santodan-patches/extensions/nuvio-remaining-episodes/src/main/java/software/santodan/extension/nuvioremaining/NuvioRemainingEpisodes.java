package software.santodan.extension.nuvioremaining;

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
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/** Runtime bridge kept reflection-only so it does not package Nuvio or Compose classes. */
public final class NuvioRemainingEpisodes {
    private static final String TAG = "SantodanRemaining";
    private static final String PREFS = "santodan_nuvio_remaining_episodes";
    private static final String ENABLED = "enabled";
    private static final String COUNT_PREFIX = "count_v3_";
    private static final long FALLBACK_GRACE_MS = 500L;
    private static final Map<String, String> TITLES = new ConcurrentHashMap<>();
    private static final Map<String, Integer> REMAINING = new ConcurrentHashMap<>();
    private static final Set<String> FETCHING = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();
    private static final ThreadLocal<Integer> PREPARED_BADGE = new ThreadLocal<>();
    private static final AtomicBoolean REVISION_PENDING = new AtomicBoolean();
    private static volatile Map<?, ?> latestAiredById;
    private static volatile Map<?, ?> latestWatchedById;
    private static volatile Object enabledState;
    private static volatile Object revisionState;

    private NuvioRemainingEpisodes() {}

    private static volatile Boolean newerLayout;

    private static boolean beta4() throws Exception {
        Boolean cached = newerLayout;
        if (cached == null) {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
            if (app == null) throw new IllegalStateException("Application is unavailable");
            cached = "1.1.0-beta.4".equals(app.getPackageManager()
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
                if (!REMAINING.containsKey(id)) {
                    int cached = preferences().getInt(COUNT_PREFIX + id, -1);
                    if (cached >= 0) REMAINING.put(id, Integer.valueOf(cached));
                }
                if (LOGGED.add("register:" + id)) Log.d(TAG, "registered id=" + id + " title=" + title
                    + " next=" + season + ':' + episode + " seed=" + seedSeason + ':' + seedEpisode);
                recalculate(id, latestAiredById, latestWatchedById);
                fetchRemaining(id, season, episode, seedSeason, seedEpisode);
            }
        } catch (Throwable error) {
            Log.e(TAG, "NextUpInfo registration failed", error);
            // The bytecode patch validates the model layout before installing this hook.
        }
    }

    public static void update(Map<?, ?> airedById, Map<?, ?> watchedById) {
        try {
            if (airedById == null || watchedById == null) return;
            latestAiredById = airedById;
            latestWatchedById = watchedById;
            // Tracking integrations can update these maps on another coroutine. Snapshot
            // both collections before counting so switching between Local/Trakt/Simkl
            // cannot leak a ConcurrentModificationException into Nuvio's refresh flow.
            Set<String> ids = new HashSet<>(TITLES.keySet());
            for (Object key : watchedById.keySet().toArray()) ids.add(normalizeId(String.valueOf(key)));
            for (String id : ids) recalculate(id, airedById, watchedById);
        } catch (Throwable error) {
            Log.e(TAG, "episode counting failed", error);
            // Counting is optional and must never interrupt a provider refresh.
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
                    return kotlinUnit(loader);
                }
                return objectMethod(proxy, method, args);
            });
            Object noop = Proxy.newProxyInstance(loader, new Class<?>[]{function0}, (proxy, method, args) ->
                "invoke".equals(method.getName()) ? kotlinUnit(loader) : objectMethod(proxy, method, args));
            String description = "Show aired, unwatched episode counts for Local, Trakt, Simkl, and other tracking sources.";
            if (beta4()) {
                Method row = findStatic(Class.forName("sa.eb", false, loader), "m", 13);
                row.invoke(null, "Show remaining episodes", description, stateValue(state), toggle,
                    null, noop, false, null, 0L, false, composer, 0, 1008);
            } else {
                Method row = findStatic(Class.forName("fb.h3", false, loader), "t", 7);
                row.invoke(null, "Show remaining episodes", description, stateValue(state), toggle, noop, composer, 24576);
            }
            Log.d(TAG, "renderSettings row rendered");
        } catch (Throwable error) {
            Log.e(TAG, "settings row rendering failed", error);
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
                recalculate(entry.getKey(), latestAiredById, latestWatchedById);
                Integer candidate = REMAINING.get(entry.getKey());
                if (candidate != null && (count == null || candidate > count)) count = candidate;
            }
        }
        if (LOGGED.add("card:" + title)) Log.d(TAG, "card title=" + title + " matched=" + matchedCounts(title));
        if (count == null || count <= 0) return;
        PREPARED_BADGE.set(count);
    }

    public static void renderPreparedBadge(Object composer) {
        Integer count = PREPARED_BADGE.get();
        PREPARED_BADGE.remove();
        if (composer == null) return;
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object revision = revisionState(loader);
            findMethod(revision.getClass(), "getValue", 0).invoke(revision);
            // Subscribe every card to count changes, including cards whose count
            // is not available during their first composition.
            if (count == null) return;
            Class<?> text = Class.forName(beta4() ? "x5.g2" : "x5.i2", false, loader);
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
        Class<?> colorsOwner = Class.forName(beta4() ? "va.x0" : "ib.x0", false, loader);
        Object colors = compositionLocal.invoke(composer, staticField(colorsOwner, "a").get(null));
        long surface = ((Number) field(colors, "a").get(colors)).longValue();
        long content = ((Number) field(colors, "l").get(colors)).longValue();
        long background = ((Number) findStatic(Class.forName("d2.z", false, loader), "b", 2)
            .invoke(null, Long.valueOf(surface), Float.valueOf(0.8f))).longValue();

        Class<?> typographyOwner = Class.forName(beta4() ? "x5.i2" : "x5.k2", false, loader);
        Object typography = compositionLocal.invoke(composer, staticField(typographyOwner, "a").get(null));
        Object textStyle = field(typography, "o").get(typography);

        Object dimensions = staticField(Class.forName(beta4() ? "va.l0" : "ib.l0", false, loader), "a").get(null);
        float horizontal = ((Number) field(dimensions, "e").get(dimensions)).floatValue();
        float vertical = ((Number) field(dimensions, "d").get(dimensions)).floatValue();

        Class<?> modifierOwner = Class.forName("w1.n", false, loader);
        Object modifier = staticField(modifierOwner, "b").get(null);
        modifier = findStatic(Class.forName("e0.b", false, loader), "u", 2)
            .invoke(null, modifier, Float.valueOf(horizontal));
        Object shape = staticField(Class.forName(beta4() ? "ba.d3" : "pa.g1", false, loader), "a").get(null);
        modifier = findStatic(Class.forName("a2.j", false, loader), "b", 2)
            .invoke(null, modifier, shape);
        Object rectangle = staticField(Class.forName("d2.g0", false, loader), "b").get(null);
        modifier = findStatic(Class.forName("y.l", false, loader), "g", 3)
            .invoke(null, modifier, Long.valueOf(background), rectangle);
        modifier = findStatic(Class.forName("e0.b", false, loader), "v", 3)
            .invoke(null, modifier, Float.valueOf(horizontal), Float.valueOf(vertical));
        return new Object[]{modifier, Long.valueOf(content), textStyle};
    }

    private static void recalculate(String id, Map<?, ?> airedById, Map<?, ?> watchedById) {
        if (airedById == null || watchedById == null) return;
        try {
            Set<?> airedValue = episodeSet(airedById, id);
            if (airedValue == null) return;
            Set<?> watchedValue = episodeSet(watchedById, id);
            // Match Nuvio's publishBadgeUpdate: watched-count coverage also marks
            // a series caught up when the provider and addon number it differently.
            Set<?> airedSnapshot = new HashSet<>(java.util.Arrays.asList(airedValue.toArray()));
            Set<?> watchedSnapshot = watchedValue == null ? Collections.emptySet()
                : new HashSet<>(java.util.Arrays.asList(watchedValue.toArray()));
            int count = NuvioEpisodeCounts.remaining(airedSnapshot, watchedSnapshot);
            Integer previous = REMAINING.put(id, count);
            preferences().edit().putInt(COUNT_PREFIX + id, count).apply();
            if (previous == null || previous.intValue() != count) {
                Log.d(TAG, "native count id=" + id + " aired=" + airedSnapshot.size()
                    + " watched=" + watchedSnapshot.size() + " remaining=" + count
                    + " countCoverage=" + (watchedSnapshot.size() >= airedSnapshot.size()));
                bumpRevision();
            }
        } catch (Throwable error) {
            Log.e(TAG, "remaining calculation failed id=" + id, error);
        }
    }

    private static void fetchRemaining(String id, int nextSeason, int nextEpisode,
                                       Integer seedSeason, Integer seedEpisode) {
        if (!id.startsWith("tt") || !FETCHING.add(id)) return;
        Thread worker = new Thread(() -> {
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
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = input.read(buffer)) >= 0) output.write(buffer, 0, read);
                }
                JSONObject meta = new JSONObject(new String(output.toByteArray(),
                    java.nio.charset.StandardCharsets.UTF_8)).optJSONObject("meta");
                JSONArray videos = meta == null ? null : meta.optJSONArray("videos");
                if (videos == null) return;
                ArrayList<int[]> episodes = new ArrayList<>();
                Set<String> episodeKeys = new HashSet<>();
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
                    String key = season + ":" + episode;
                    if (episodeKeys.add(key)) episodes.add(new int[]{season, episode});
                }
                episodes.sort(Comparator.<int[]>comparingInt(value -> value[0])
                    .thenComparingInt(value -> value[1]));
                Integer remaining = remainingFromSeed(episodes, nextSeason, nextEpisode, seedSeason, seedEpisode);
                if (remaining == null) {
                    Log.w(TAG, "fallback rejected id=" + id + " because Nuvio catalog has neither next="
                        + nextSeason + ':' + nextEpisode + " nor seed=" + seedSeason + ':' + seedEpisode);
                    return;
                }
                // Provider synchronization commonly finishes several seconds
                // after cards are first constructed. Do not flash a metadata
                // estimate that will immediately be replaced by native data.
                Thread.sleep(FALLBACK_GRACE_MS);
                if (!nativeAvailable(id)) {
                    Integer previous = REMAINING.put(id, remaining);
                    preferences().edit().putInt(COUNT_PREFIX + id, remaining.intValue()).apply();
                    if (previous == null || previous.intValue() != remaining.intValue()) {
                        Log.d(TAG, "fallback count id=" + id + " remaining=" + remaining
                            + " next=" + nextSeason + ':' + nextEpisode
                            + " seed=" + seedSeason + ':' + seedEpisode);
                        bumpRevision();
                    }
                }
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

    private static boolean nativeAvailable(String id) {
        Map<?, ?> aired = latestAiredById;
        Map<?, ?> watched = latestWatchedById;
        if (aired == null || watched == null) return false;
        return episodeSet(aired, id) != null;
    }

    private static Integer remainingFromSeed(ArrayList<int[]> episodes, int nextSeason, int nextEpisode,
                                             Integer seedSeason, Integer seedEpisode) {
        if (seedSeason != null && seedEpisode != null && seedEpisode.intValue() > 0) {
            int watchedIndex = episodeIndex(episodes, seedSeason.intValue(), seedEpisode.intValue());
            if (watchedIndex < 0 && seedSeason.intValue() == 1) {
                Set<Integer> seasons = new HashSet<>();
                for (int[] value : episodes) seasons.add(value[0]);
                int globalIndex = seedEpisode.intValue() - 1;
                if (seasons.size() > 1 && globalIndex >= 0 && globalIndex < episodes.size())
                    watchedIndex = globalIndex;
            }
            if (watchedIndex >= 0) return Math.max(0, episodes.size() - watchedIndex - 1);
        }
        int nextIndex = episodeIndex(episodes, nextSeason, nextEpisode);
        if (nextIndex >= 0) return episodes.size() - nextIndex;
        return null;
    }

    private static int episodeIndex(ArrayList<int[]> episodes, int season, int episode) {
        for (int i = 0; i < episodes.size(); i++) {
            int[] value = episodes.get(i);
            if (value[0] == season && value[1] == episode) return i;
        }
        return -1;
    }

    private static Set<?> episodeSet(Map<?, ?> values, String id) {
        Object value = values.get(id);
        if (!(value instanceof Set)) value = values.get("series:" + id);
        if (!(value instanceof Set)) value = values.get("tv:" + id);
        return value instanceof Set ? (Set<?>) value : null;
    }

    private static String matchedCounts(String title) {
        StringBuilder result = new StringBuilder("[");
        for (Map.Entry<String, String> entry : TITLES.entrySet()) {
            if (!title.equals(entry.getValue())) continue;
            if (result.length() > 1) result.append(", ");
            result.append(entry.getKey()).append('=').append(REMAINING.get(entry.getKey()));
        }
        return result.append(']').toString();
    }

    private static String normalizeId(String id) {
        if (id.startsWith("series:")) return id.substring("series:".length());
        if (id.startsWith("tv:")) return id.substring("tv:".length());
        return id;
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
        synchronized (NuvioRemainingEpisodes.class) {
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
