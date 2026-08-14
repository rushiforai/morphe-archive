package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Runtime bridge for the 0.8.4 detail, navigation and player hooks. */
@SuppressWarnings({"unused", "rawtypes", "unchecked", "JavaReflectionMemberAccess"})
public final class RandomEpisodeRuntime {
    private static final int SHUFFLE_DRAWABLE_ID = 0x7f0800e9;
    private static final Random RANDOM = new Random();
    private static final ThreadLocal<HeroContext> HERO_CONTEXT = new ThreadLocal<>();
    private static final Object SESSION_LOCK = new Object();

    private static volatile Object pendingVideo;
    private static volatile List<?> pendingVideos;
    private static volatile List<?> sessionVideos;
    private static volatile Integer sessionSeason;
    private static volatile Integer sessionEpisode;
    private static volatile boolean randomSessionActive;
    private static volatile String nextRandomVideoId;
    private static volatile boolean pendingManualSelection;
    private static volatile boolean manualDialogRendered;
    private static volatile Class<?> heroActionOwner;

    private RandomEpisodeRuntime() {}

    public static Function0<?> enterHero(
            Object meta,
            Function0<?> onPlay,
            Function0<?> onPlayLongPress,
            Function0<?> onFocused,
            Object composer
    ) {
        if (heroActionOwner == null) {
            try {
                heroActionOwner = findHeroOwner(composer);
            } catch (ReflectiveOperationException error) {
                throw new IllegalStateException("Unable to resolve the native detail action", error);
            }
        }
        HeroContext previous = HERO_CONTEXT.get();
        Function0<?> guardedPlay = previous != null && previous.originalOnPlay == onPlay
                ? previous.onPlay
                : new ClearPendingManualAction(onPlay);
        HERO_CONTEXT.set(new HeroContext(meta, onPlay, guardedPlay, onPlayLongPress, onFocused));
        return guardedPlay;
    }

    /** Emits the random action immediately before the native library action. */
    public static void renderAction(Object composer) {
        HeroContext context = HERO_CONTEXT.get();
        if (context == null) return;
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && manualDialogRendered) {
                manualDialogRendered = false;
                new Handler(Looper.getMainLooper()).post(RandomEpisodeRuntime::clearDismissedManualSelection);
            }
        }
        if (!shouldOfferRandomEpisode(context.meta)) return;

        try {
            Class<?> owner = heroActionOwner;
            if (owner == null) throw new NoSuchMethodException("Hero action owner");
            Object painter = createShufflePainter(owner, composer);
            Method actionButton = findActionButton(owner, composer);
            Function0<Unit> click = new RandomClickAction(context.meta, context.onPlay, false);
            Function0<Unit> longPress = context.onPlayLongPress == null
                    ? null
                    : new RandomClickAction(context.meta, context.onPlayLongPress, true);
            Function0<?> focused = context.onFocused == null ? NoOpAction.INSTANCE : context.onFocused;
            actionButton.invoke(
                    null,
                    null,
                    painter,
                    "Play random episode",
                    click,
                    longPress,
                    true,
                    false,
                    0L,
                    0L,
                    focused,
                    composer,
                    0,
                    0
            );
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render the random episode action", error);
        }
    }

    /** Rewrites only the initial random stream route; normal routes are returned byte-for-byte. */
    public static String rewriteStreamRoute(String route) {
        if (route == null || !route.startsWith("stream/")) return route;

        Object video;
        synchronized (SESSION_LOCK) {
            video = pendingVideo;
            if (video != null) {
                pendingVideo = null;
                sessionVideos = pendingVideos;
                pendingVideos = null;
                pendingManualSelection = false;
                manualDialogRendered = false;
                sessionSeason = integerProperty(video, "getSeason");
                sessionEpisode = integerProperty(video, "getEpisode");
                randomSessionActive = true;
                nextRandomVideoId = null;
            } else if (randomSessionActive) {
                String routeVideoId = routeVideoId(route);
                if (nextRandomVideoId != null && nextRandomVideoId.equals(routeVideoId)) {
                    nextRandomVideoId = null;
                    return route;
                }
                clearSessionLocked();
                return route;
            } else {
                return route;
            }
        }

        String id = stringProperty(video, "getId");
        String title = stringProperty(video, "getTitle");
        String thumbnail = stringProperty(video, "getThumbnail");
        Integer season = integerProperty(video, "getSeason");
        Integer episode = integerProperty(video, "getEpisode");
        Integer runtime = integerProperty(video, "getRuntime");

        int queryIndex = route.indexOf('?');
        String path = queryIndex < 0 ? route : route.substring(0, queryIndex);
        String query = queryIndex < 0 ? "" : route.substring(queryIndex + 1);
        String[] pathParts = path.split("/", -1);
        if (pathParts.length >= 4 && id != null) pathParts[1] = encode(id);

        StringBuilder rewritten = new StringBuilder(String.join("/", pathParts));
        if (!query.isEmpty()) {
            rewritten.append('?');
            String[] fields = query.split("&", -1);
            for (int index = 0; index < fields.length; index++) {
                if (index > 0) rewritten.append('&');
                String field = fields[index];
                int equals = field.indexOf('=');
                String key = equals < 0 ? field : field.substring(0, equals);
                String value = equals < 0 ? "" : field.substring(equals + 1);
                if ("poster".equals(key)) value = encodeNullable(thumbnail);
                else if ("season".equals(key)) value = numberValue(season);
                else if ("episode".equals(key)) value = numberValue(episode);
                else if ("episodeName".equals(key)) value = encodeNullable(title);
                else if ("runtime".equals(key)) value = numberValue(runtime);
                rewritten.append(key).append('=').append(value);
            }
        }
        return rewritten.toString();
    }

    /** Replaces Nuvio's sequential next episode only while a random session is active. */
    public static Object chooseNextEpisode(
            Object normalNext,
            List<?> videos,
            Integer currentSeason,
            Integer currentEpisode
    ) {
        if (!randomSessionActive) return normalNext;
        List<Object> candidates = eligibleVideos(videos, currentSeason, currentEpisode);
        Object selected = candidates.isEmpty() ? null : candidates.get(RANDOM.nextInt(candidates.size()));
        synchronized (SESSION_LOCK) {
            nextRandomVideoId = selected == null ? null : stringProperty(selected, "getId");
        }
        return selected;
    }

    public static Object chooseNextEpisode(Object normalNext) {
        if (!randomSessionActive) return normalNext;
        List<Object> candidates = eligibleVideos(sessionVideos, sessionSeason, sessionEpisode);
        Object selected = candidates.isEmpty() ? null : candidates.get(RANDOM.nextInt(candidates.size()));
        synchronized (SESSION_LOCK) {
            if (selected == null) {
                nextRandomVideoId = null;
            } else {
                nextRandomVideoId = stringProperty(selected, "getId");
                sessionSeason = integerProperty(selected, "getSeason");
                sessionEpisode = integerProperty(selected, "getEpisode");
            }
        }
        return selected;
    }

    public static boolean shouldSkipTracking() {
        return randomSessionActive;
    }

    /** Replaces the normal hero episode label while the random manual-play dialog is open. */
    public static String rewriteManualSubtitle(String subtitle) {
        synchronized (SESSION_LOCK) {
            Object video = pendingVideo;
            if (video == null || !pendingManualSelection) return subtitle;
            manualDialogRendered = true;
            Integer season = integerProperty(video, "getSeason");
            Integer episode = integerProperty(video, "getEpisode");
            return season == null || episode == null ? subtitle : "S" + season + " E" + episode;
        }
    }

    public static Integer filterReturnFocusSeason(Integer value) {
        return randomSessionActive ? null : value;
    }

    public static Integer filterReturnFocusEpisode(Integer value) {
        synchronized (SESSION_LOCK) {
            if (!randomSessionActive) return value;
            clearSessionLocked();
            return null;
        }
    }

    static boolean shouldOfferRandomEpisode(Object meta) {
        if (!RandomEpisodeSettings.isEnabled() || meta == null) return false;
        String type = stringProperty(meta, "getApiType");
        if (!("series".equalsIgnoreCase(type) || "tv".equalsIgnoreCase(type))) return false;
        Object videos = property(meta, "getVideos");
        return videos instanceof List && !eligibleVideos((List<?>) videos, null, null).isEmpty();
    }

    static List<Object> eligibleVideos(List<?> videos, Integer currentSeason, Integer currentEpisode) {
        List<Object> eligible = new ArrayList<>();
        if (videos == null) return eligible;
        for (Object video : videos) {
            Integer season = integerProperty(video, "getSeason");
            Integer episode = integerProperty(video, "getEpisode");
            if (season == null || season <= 0 || episode == null || episode <= 0) continue;
            if (season.equals(currentSeason) && episode.equals(currentEpisode)) continue;
            if (!hasAired(stringProperty(video, "getReleased"))) continue;
            eligible.add(video);
        }
        return eligible;
    }

    static boolean hasAired(String released) {
        if (released == null || released.trim().isEmpty()) return true;
        String value = released.trim();
        try {
            LocalDate date = value.length() >= 10
                    ? LocalDate.parse(value.substring(0, 10))
                    : LocalDate.parse(value);
            return !date.isAfter(LocalDate.now());
        } catch (DateTimeParseException ignored) {
            try {
                return !OffsetDateTime.parse(value).toLocalDate().isAfter(LocalDate.now());
            } catch (DateTimeParseException ignoredAgain) {
                return true;
            }
        }
    }

    static void beginRandomForTests(Object video) {
        synchronized (SESSION_LOCK) {
            pendingVideo = video;
            pendingVideos = null;
            pendingManualSelection = true;
        }
    }

    static void setRandomSessionForTests(boolean active) {
        synchronized (SESSION_LOCK) {
            randomSessionActive = active;
            pendingVideo = null;
            nextRandomVideoId = null;
        }
    }

    static void resetForTests() {
        HERO_CONTEXT.remove();
        heroActionOwner = null;
        synchronized (SESSION_LOCK) {
            clearSessionLocked();
        }
    }

    private static void dispatchRandom(Object meta, Function0<?> callback, boolean manualSelection) {
        Object videos = property(meta, "getVideos");
        if (!(videos instanceof List)) return;
        List<Object> eligible = eligibleVideos((List<?>) videos, null, null);
        if (eligible.isEmpty()) return;
        Object selected = eligible.get(RANDOM.nextInt(eligible.size()));
        synchronized (SESSION_LOCK) {
            pendingVideo = selected;
            pendingVideos = (List<?>) videos;
            pendingManualSelection = manualSelection;
            manualDialogRendered = false;
        }
        try {
            callback.invoke();
        } finally {
            synchronized (SESSION_LOCK) {
                if (!manualSelection && !randomSessionActive) {
                    pendingVideo = null;
                    pendingVideos = null;
                }
            }
        }
    }

    private static void clearDismissedManualSelection() {
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && !manualDialogRendered && !randomSessionActive) {
                pendingVideo = null;
                pendingVideos = null;
                pendingManualSelection = false;
            }
        }
    }

    private static void clearPendingManualSelection() {
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && !randomSessionActive) {
                pendingVideo = null;
                pendingVideos = null;
                pendingManualSelection = false;
                manualDialogRendered = false;
            }
        }
    }

    private static Class<?> findHeroOwner(Object composer) throws ReflectiveOperationException {
        ClassLoader loader = composer.getClass().getClassLoader();
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            if (frame.getClassName().equals(RandomEpisodeRuntime.class.getName())) continue;
            Class<?> candidate;
            try {
                candidate = Class.forName(frame.getClassName(), false, loader);
            } catch (ClassNotFoundException ignored) {
                continue;
            }
            try {
                findActionButton(candidate, composer);
                return candidate;
            } catch (NoSuchMethodException ignored) {
                // Continue to the first structurally matching caller.
            }
        }
        throw new NoSuchMethodException("Hero action owner");
    }

    private static Method findActionButton(Class<?> owner, Object composer) throws NoSuchMethodException {
        for (Method method : owner.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                    parameters.length != 13 || parameters[2] != String.class ||
                    !Function0.class.isAssignableFrom(parameters[3]) ||
                    !Function0.class.isAssignableFrom(parameters[4]) ||
                    parameters[5] != Boolean.TYPE || parameters[6] != Boolean.TYPE ||
                    parameters[7] != Long.TYPE || parameters[8] != Long.TYPE ||
                    !Function0.class.isAssignableFrom(parameters[9]) ||
                    !parameters[10].isInstance(composer) ||
                    parameters[11] != Integer.TYPE || parameters[12] != Integer.TYPE) {
                continue;
            }
            method.setAccessible(true);
            return method;
        }
        throw new NoSuchMethodException("Native detail action button");
    }

    private static Object createShufflePainter(Class<?> owner, Object composer)
            throws ReflectiveOperationException {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe application context is unavailable");
        for (Method method : owner.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() == Void.TYPE ||
                    parameters.length != 3 || !Context.class.isAssignableFrom(parameters[0]) ||
                    parameters[1] != Integer.TYPE || !parameters[2].isInstance(composer)) {
                continue;
            }
            method.setAccessible(true);
            Object painter = method.invoke(null, context, SHUFFLE_DRAWABLE_ID, composer);
            if (painter != null) return painter;
        }
        throw new NoSuchMethodException("Native detail painter loader");
    }

    private static String routeVideoId(String route) {
        int query = route.indexOf('?');
        String path = query < 0 ? route : route.substring(0, query);
        String[] parts = path.split("/", -1);
        return parts.length > 1 ? decode(parts[1]) : null;
    }

    private static String encodeNullable(String value) {
        return value == null ? "" : encode(value);
    }

    private static String numberValue(Integer value) {
        return value == null ? "" : value.toString();
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    private static String decode(String value) {
        try {
            return URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    private static Object property(Object target, String methodName) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static String stringProperty(Object target, String methodName) {
        Object value = property(target, methodName);
        return value instanceof String ? (String) value : null;
    }

    private static Integer integerProperty(Object target, String methodName) {
        Object value = property(target, methodName);
        return value instanceof Number ? ((Number) value).intValue() : null;
    }

    private static void clearSessionLocked() {
        pendingVideo = null;
        pendingVideos = null;
        sessionVideos = null;
        sessionSeason = null;
        sessionEpisode = null;
        randomSessionActive = false;
        nextRandomVideoId = null;
        pendingManualSelection = false;
        manualDialogRendered = false;
    }

    private static final class HeroContext {
        final Object meta;
        final Function0<?> originalOnPlay;
        final Function0<?> onPlay;
        final Function0<?> onPlayLongPress;
        final Function0<?> onFocused;
        HeroContext(
                Object meta,
                Function0<?> originalOnPlay,
                Function0<?> onPlay,
                Function0<?> onPlayLongPress,
                Function0<?> onFocused
        ) {
            this.meta = meta;
            this.originalOnPlay = originalOnPlay;
            this.onPlay = onPlay;
            this.onPlayLongPress = onPlayLongPress;
            this.onFocused = onFocused;
        }
    }

    private static final class RandomClickAction implements Function0<Unit> {
        private final Object meta;
        private final Function0<?> callback;
        private final boolean manualSelection;

        RandomClickAction(Object meta, Function0<?> callback, boolean manualSelection) {
            this.meta = meta;
            this.callback = callback;
            this.manualSelection = manualSelection;
        }

        @Override
        public Unit invoke() {
            dispatchRandom(meta, callback, manualSelection);
            return Unit.INSTANCE;
        }
    }

    private static final class ClearPendingManualAction implements Function0<Object> {
        private final Function0<?> delegate;

        ClearPendingManualAction(Function0<?> delegate) {
            this.delegate = delegate;
        }

        @Override
        public Object invoke() {
            clearPendingManualSelection();
            return delegate.invoke();
        }
    }

    private enum NoOpAction implements Function0<Unit> {
        INSTANCE;

        @Override
        public Unit invoke() {
            return Unit.INSTANCE;
        }
    }
}
