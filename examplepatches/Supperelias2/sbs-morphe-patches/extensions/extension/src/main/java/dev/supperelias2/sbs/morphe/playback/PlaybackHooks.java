package dev.supperelias2.sbs.morphe.playback;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import dev.supperelias2.sbs.morphe.MorpheSettings;

/** Local playback policy. App and Media3 classes remain owned by SBS. */
public final class PlaybackHooks {
    private static final String AKAMAI = "com.sbs.ondemand.model.playback.PlaybackStreamProvider$AkamaiHLSProvider";
    private static final String DAI = "com.sbs.ondemand.model.playback.PlaybackStreamProvider$GoogleDAIProvider";
    private static final Map<String, Field> FIELDS = new ConcurrentHashMap<>();
    private static final Map<String, Method> METHODS = new ConcurrentHashMap<>();
    private static final Map<Object, WeakReference<Object>> OWNERS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Session> SESSIONS = Collections.synchronizedMap(new WeakHashMap<>());

    private PlaybackHooks() {}

    private static final class Session {
        String mediaId = "";
        int skipped;
    }

    private static Object field(Object instance, String name) throws ReflectiveOperationException {
        if (instance == null) return null;
        Class<?> type = instance.getClass();
        String key = type.getName() + '#' + name;
        Field field = FIELDS.get(key);
        if (field == null) {
            field = type.getDeclaredField(name);
            field.setAccessible(true);
            FIELDS.put(key, field);
        }
        return field.get(instance);
    }

    private static void setField(Object instance, String name, Object value) throws ReflectiveOperationException {
        field(instance, name);
        FIELDS.get(instance.getClass().getName() + '#' + name).set(instance, value);
    }

    private static Object call(Object instance, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException {
        if (instance == null) return null;
        StringBuilder key = new StringBuilder(instance.getClass().getName()).append('#').append(name);
        for (Class<?> type : types) key.append(':').append(type.getName());
        String methodKey = key.toString();
        Method method = METHODS.get(methodKey);
        if (method == null) {
            try {
                method = instance.getClass().getMethod(name, types);
            } catch (NoSuchMethodException missingPublicMethod) {
                method = instance.getClass().getDeclaredMethod(name, types);
            }
            method.setAccessible(true);
            METHODS.put(methodKey, method);
        }
        return method.invoke(instance, args);
    }

    private static Object call(Object instance, String name) throws ReflectiveOperationException {
        return call(instance, name, new Class<?>[0]);
    }

    private static Object flowValue(Object flow) throws ReflectiveOperationException {
        return call(flow, "getValue");
    }

    private static long number(Object value, long fallback) {
        return value instanceof Number ? ((Number) value).longValue() : fallback;
    }

    private static Object controller(Object viewModel) throws ReflectiveOperationException {
        return field(viewModel, "playbackController");
    }

    private static Object player(Object viewModel) throws ReflectiveOperationException {
        return field(field(viewModel, "playerManager"), "_player");
    }

    private static Object provider(Object viewModel) throws ReflectiveOperationException {
        return field(controller(viewModel), "currentProvider");
    }

    private static boolean providerIs(Object viewModel, String expected) throws ReflectiveOperationException {
        Object provider = provider(viewModel);
        return provider != null && expected.equals(provider.getClass().getName());
    }

    private static boolean vod(Object viewModel) throws ReflectiveOperationException {
        return Boolean.FALSE.equals(flowValue(field(controller(viewModel), "_isMediaLive")));
    }

    private static boolean inAd(Object viewModel) throws ReflectiveOperationException {
        return !Boolean.FALSE.equals(flowValue(field(field(viewModel, "adsController"), "_isAdPlaying")));
    }

    private static Object streamManager(Object viewModel) throws ReflectiveOperationException {
        return field(field(viewModel, "adsController"), "streamManager");
    }

    private static long mapped(Object manager, String method, long position) throws ReflectiveOperationException {
        return number(call(manager, method, new Class<?>[]{long.class}, position), -1L);
    }

    private static boolean markerIsCurrent(Object viewModel, long marker) throws ReflectiveOperationException {
        Object events = field(viewModel, "playbackEventViewModel");
        String[][] segments = {{"openingCreditsBegin", "openingCreditsEnd"}, {"recapBegin", "recapEnd"}};
        for (String[] segment : segments) {
            long end = number(call(events, "getEndEventTime", new Class<?>[]{String.class}, segment[1]), -1L);
            if (end != marker) continue;
            long start = number(call(events, "getStartEventTime", new Class<?>[]{String.class}, segment[0]), -1L);
            if (start >= 0L && start < end) return true;
        }
        return false;
    }

    /** -1 rejects invalid markers before SBS starts its seek bookkeeping. */
    public static long skipTarget(Object viewModel, long marker) {
        try {
            if (!MorpheSettings.enabled("fix_skip", true)) {
                Object manager = streamManager(viewModel);
                return manager == null ? 0L : mapped(manager, "getStreamTimeMsForContentTimeMs", marker);
            }
            if (!vod(viewModel) || inAd(viewModel) || marker <= 0L || marker == Long.MAX_VALUE
                    || !markerIsCurrent(viewModel, marker)) return -1L;
            Object player = player(viewModel);
            long duration = number(call(player, "getDuration"), -1L);
            if (duration <= 0L) return -1L;
            long target;
            if (providerIs(viewModel, AKAMAI)) {
                // An old IMA manager can survive a fallback: direct media never uses it.
                target = marker;
            } else if (providerIs(viewModel, DAI)) {
                Object manager = streamManager(viewModel);
                if (manager == null) return -1L;
                target = mapped(manager, "getStreamTimeMsForContentTimeMs", marker);
                if (target < marker) return -1L;
            } else return -1L;
            return target > 0L && target < duration ? target : -1L;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return -1L;
        }
    }

    public static long contentPosition(Object viewModel) {
        try {
            long position = number(call(player(viewModel), "getCurrentPosition"), 0L);
            if (MorpheSettings.enabled("fix_skip", true) && providerIs(viewModel, AKAMAI)) return Math.max(0L, position);
            Object manager = streamManager(viewModel);
            if (manager != null) return Math.max(0L, mapped(manager, "getContentTimeMsForStreamTimeMs", position));
            return 0L;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return 0L;
        }
    }

    public static void attach(Object viewModel) {
        try {
            Object events = field(viewModel, "playbackEventViewModel");
            if (events != null) OWNERS.put(events, new WeakReference<>(viewModel));
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    private static Session sessionFor(Object viewModel) throws ReflectiveOperationException {
        Object idValue = flowValue(field(controller(viewModel), "_currentContentId"));
        String mediaId = idValue instanceof String ? (String) idValue : "";
        if (mediaId.isEmpty()) return null;
        Session session = SESSIONS.get(viewModel);
        if (session == null) {
            session = new Session();
            SESSIONS.put(viewModel, session);
        }
        if (!mediaId.equals(session.mediaId)) {
            session.mediaId = mediaId;
            session.skipped = 0;
        }
        return session;
    }

    private static void noteSkipped(Object viewModel, int flag) {
        try {
            Session session = sessionFor(viewModel);
            if (session != null) session.skipped |= flag;
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    public static void noteIntroSkipped(Object viewModel) { noteSkipped(viewModel, 1); }
    public static void noteRecapSkipped(Object viewModel) { noteSkipped(viewModel, 2); }

    /** Called by the existing content-time flow, on the player's own thread. */
    public static void onContentTime(Object events) {
        if (!MorpheSettings.enabled("fix_skip", true)) return;
        boolean intro = MorpheSettings.enabled("auto_skip_intro", false);
        boolean recap = MorpheSettings.enabled("auto_skip_recap", false);
        if (!intro && !recap) return;
        try {
            WeakReference<Object> owner = OWNERS.get(events);
            Object viewModel = owner == null ? null : owner.get();
            if (viewModel == null || !vod(viewModel) || inAd(viewModel)) return;
            if (Boolean.TRUE.equals(field(viewModel, "isSeekInProgress"))) return;
            if (!Boolean.TRUE.equals(call(player(viewModel), "isPlaying"))) return;
            Session session = sessionFor(viewModel);
            if (session == null) return;
            long position = contentPosition(viewModel);
            if (position <= 0L) return;
            if (recap && autoSkip(viewModel, events, session, position, 2, "recapBegin", "recapEnd", "recapEnd", "skipRecap")) return;
            if (intro) autoSkip(viewModel, events, session, position, 1, "openingCreditsBegin", "openingCreditsEnd", "introEnd", "skipIntro");
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    private static boolean autoSkip(Object viewModel, Object events, Session session, long position, int flag,
                                    String beginType, String endType, String endField, String skipMethod) throws ReflectiveOperationException {
        if ((session.skipped & flag) != 0) return false;
        Object valid = call(events, "shouldShowSkipButton", new Class<?>[]{String.class, String.class, long.class}, beginType, endType, position);
        if (!Boolean.TRUE.equals(valid)) return false;
        long end = number(call(events, "getEndEventTime", new Class<?>[]{String.class}, endType), -1L);
        if (end <= position || skipTarget(viewModel, end) <= 0L) return false;
        // Mark before calling SBS: a rewind never causes a second automatic skip.
        session.skipped |= flag;
        setField(events, endField, end);
        call(viewModel, skipMethod);
        return true;
    }

    private static int seconds(String key) {
        if (!MorpheSettings.enabled("seek_intervals", false)) return 15;
        int value = MorpheSettings.getInt(key, 15);
        return value >= 5 && value <= 120 ? value : 15;
    }

    public static int backMillis() { return seconds("seek_back_seconds") * 1000; }
    public static int forwardMillis() { return seconds("seek_forward_seconds") * 1000; }
    public static long forwardSeconds() { return seconds("seek_forward_seconds"); }
    public static String backDescription() { return "Rewind " + seconds("seek_back_seconds") + " seconds"; }
    public static String forwardDescription() { return "Forward " + seconds("seek_forward_seconds") + " seconds"; }

    /** Reapplied after every direct load and player recreation. Pitch stays at 1. */
    public static void applySpeed(Object manager) {
        try {
            Object viewModel = field(manager, "parentViewModel");
            float speed = 1f;
            if (MorpheSettings.enabled("playback_speed_enabled", false)
                    && vod(viewModel) && providerIs(viewModel, AKAMAI) && !inAd(viewModel)) {
                float requested = MorpheSettings.getFloat("playback_speed", 1f);
                if (requested == 0.5f || requested == 0.75f || requested == 1f || requested == 1.25f
                        || requested == 1.5f || requested == 1.75f || requested == 2f) speed = requested;
            }
            setSpeed(field(manager, "_player"), speed);
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    private static void setSpeed(Object player, float speed) throws ReflectiveOperationException {
        if (player != null) call(player, "setPlaybackSpeed", new Class<?>[]{float.class}, speed);
    }

    public static void normalSpeed(Object manager) {
        try { setSpeed(field(manager, "_player"), 1f); }
        catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    public static void beforeProviderChange(Object controller) {
        try { normalSpeed(field(field(controller, "parentViewModel"), "playerManager")); }
        catch (ReflectiveOperationException | RuntimeException ignored) {}
    }
}
