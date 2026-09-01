package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Runtime bridge for persistent per-show random series playback. */
@SuppressWarnings({"unused", "rawtypes", "unchecked", "JavaReflectionMemberAccess"})
public final class RandomEpisodeRuntime {
    private static final String TAG = "MorpheRandomEpisode";
    private static final int SHUFFLE_DRAWABLE_ID = 0x7f0800ee;
    private static final Random RANDOM = new Random();
    private static final ThreadLocal<HeroContext> HERO_CONTEXT = new ThreadLocal<>();
    private static final ThreadLocal<NextContext> NEXT_CONTEXT = new ThreadLocal<>();
    private static final ThreadLocal<Object> CONTINUE_ITEM = new ThreadLocal<>();
    private static final ThreadLocal<HomeSplitInput> HOME_SPLIT_INPUT = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> HOME_STATE_CLONING = new ThreadLocal<>();
    private static final Object SESSION_LOCK = new Object();
    private static final Map<String, DetailState> DETAIL_STATES = new HashMap<>();
    private static final Map<String, String> LAST_HERO_VIDEO_KEYS = new HashMap<>();
    private static final Map<String, List<?>> HOME_CATALOGS = new HashMap<>();
    private static final Map<String, HomeSelection> HOME_SELECTIONS = new HashMap<>();
    private static final Map<String, String> LAST_HOME_VIDEO_KEYS = new HashMap<>();
    private static final Map<String, String> LAST_HOME_EPISODE_KEYS = new HashMap<>();
    private static final Map<String, ContinueResume> CONTINUE_RESUMES = new HashMap<>();
    private static final Map<String, NativeNextTarget> NATIVE_NEXT_TARGETS = new HashMap<>();
    private static final Map<Object, Object> CONTINUE_CONTENT_ITEMS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, HomeSelection> HOME_ITEM_SELECTIONS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Object> HOME_RANDOM_SOURCE_ITEMS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String, Object> HOME_NATIVE_SOURCE_ITEMS = new HashMap<>();
    private static final List<HomeSplit> HOME_SPLITS = new ArrayList<>();
    private static final List<HomeState> HOME_STATES = new ArrayList<>();

    private static volatile Object heroVideo;
    private static volatile Object homeOwner;
    private static volatile List<?> heroVideos;
    private static volatile String heroShowKey;
    private static volatile Object pendingVideo;
    private static volatile List<?> pendingVideos;
    private static volatile String pendingShowKey;
    private static volatile List<?> sessionVideos;
    private static volatile String sessionShowKey;
    private static volatile Integer sessionSeason;
    private static volatile Integer sessionEpisode;
    private static volatile boolean randomSessionActive;
    private static volatile String nextRandomVideoId;
    private static volatile Object nextRandomVideo;
    private static volatile Integer nextForCurrentSeason;
    private static volatile Integer nextForCurrentEpisode;
    private static volatile boolean pendingManualSelection;
    private static volatile boolean pendingFromHome;
    private static volatile boolean manualDialogRendered;
    private static volatile boolean homeActive;
    private static volatile Class<?> heroActionOwner;
    private static volatile Object shuffleBadgeIcon;
    private static final List<String> remainingVideoKeys = new ArrayList<>();

    private RandomEpisodeRuntime() {}

    public static Function0<?> enterHero(
            Object meta,
            Object nextToWatch,
            Function0<?> onPlay,
            Function0<?> onPlayLongPress,
            Function0<?> onFocused,
            Object composer
    ) {
        HeroContext previous = HERO_CONTEXT.get();
        RandomEpisodeRefreshState.observeForCompose();
        if (previous == null) {
            new Handler(Looper.getMainLooper()).post(RandomEpisodeRefreshState::invalidate);
        }
        synchronized (SESSION_LOCK) {
            homeActive = false;
        }
        if (heroActionOwner == null) {
            try {
                heroActionOwner = findHeroOwner(composer);
            } catch (ReflectiveOperationException error) {
                throw new IllegalStateException("Unable to resolve the native detail action", error);
            }
        }
        String showKey = showKeyForMeta(meta);
        synchronized (SESSION_LOCK) {
            captureNativeNextTargetLocked(showKey, nextToWatch);
        }
        invalidateRemovedContinueResume(nextToWatch, showKey, previous);
        ResumeTarget resumeTarget = resumeTargetForMeta(meta, showKey);
        boolean resume = usableNativeResume(nextToWatch, showKey) || resumeTarget != null;
        updateHeroSelection(meta, showKey, resume, onPlay, previous);
        Function0<?> wrappedPlay = previous != null &&
                previous.originalOnPlay == onPlay &&
                equalString(previous.showKey, showKey) &&
                previous.resume == resume &&
                equalString(videoKey(previous.resumeVideo), videoKey(
                        resumeTarget == null ? null : resumeTarget.video))
                ? previous.onPlay
                : new PersistentPlayAction(meta, onPlay, false, resume,
                        resumeTarget == null ? null : resumeTarget.video);
        HERO_CONTEXT.set(new HeroContext(
                meta, nextToWatch, showKey, resume,
                resumeTarget == null ? null : resumeTarget.video,
                resumeTarget == null ? null : resumeTarget.progress,
                onPlay, wrappedPlay, onPlayLongPress, onFocused));
        return wrappedPlay;
    }

    /** Ends the current detail visit when Nuvio's Home destination becomes active. */
    public static void enterHome(Object owner) {
        if (owner != null) homeOwner = owner;
        RandomEpisodeRefreshState.observeForCompose();
        HERO_CONTEXT.remove();
        boolean startedHomeVisit = false;
        synchronized (SESSION_LOCK) {
            if (!homeActive) {
                homeActive = true;
                startedHomeVisit = true;
                HOME_SELECTIONS.clear();
                HOME_ITEM_SELECTIONS.clear();
            }
            clearPendingLocked();
            clearHeroSelectionLocked();
        }
        if (startedHomeVisit) {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                synchronized (SESSION_LOCK) {
                    if (!homeActive) return;
                }
                RandomEpisodeRefreshState.invalidate();
            }, 250L);
        }
    }

    static void enterHome() {
        enterHome(null);
    }

    /** Returns the visit's selected episode as a native NextToWatch value for the Play label. */
    public static Object rewriteHeroNextToWatch(Object nativeNextToWatch) {
        HeroContext context = HERO_CONTEXT.get();
        if (context == null ||
                !RandomEpisodeSettings.isEnabled() ||
                !RandomEpisodeSettings.isShowEnabled(context.showKey)) {
            return nativeNextToWatch;
        }

        if (context.resume) {
            if (context.resumeVideo == null) return nativeNextToWatch;
            return createNextToWatch(
                    nativeNextToWatch, context.resumeVideo, context.resumeProgress,
                    true, "Resume");
        }

        Object selected;
        synchronized (SESSION_LOCK) {
            selected = equalString(heroShowKey, context.showKey) ? heroVideo : null;
        }
        if (selected == null) return nativeNextToWatch;

        return createNextToWatch(nativeNextToWatch, selected, null, false, "Play");
    }

    /** Wraps native Play long-press so source selection targets the randomized episode. */
    public static Function0<?> wrapHeroLongPress(Function0<?> onPlayLongPress) {
        HeroContext context = HERO_CONTEXT.get();
        if (context == null || onPlayLongPress == null) return onPlayLongPress;
        Function0<?> wrapped = new PersistentPlayAction(
                context.meta, onPlayLongPress, true, context.resume, context.resumeVideo);
        HERO_CONTEXT.set(new HeroContext(
                context.meta,
                context.nativeNextToWatch,
                context.showKey,
                context.resume,
                context.resumeVideo,
                context.resumeProgress,
                context.originalOnPlay,
                context.onPlay,
                onPlayLongPress,
                wrapped,
                context.onFocused));
        return wrapped;
    }

    /** Emits the persistent random toggle immediately before the native library action. */
    public static void renderAction(Object composer) {
        HeroContext context = HERO_CONTEXT.get();
        if (context == null) return;
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && manualDialogRendered) {
                manualDialogRendered = false;
                new Handler(Looper.getMainLooper()).post(
                        RandomEpisodeRuntime::clearDismissedManualSelection);
            }
        }
        if (!shouldOfferRandomEpisode(context.meta)) return;

        try {
            RandomEpisodeRefreshState.observeForCompose();
            Class<?> owner = heroActionOwner;
            if (owner == null) throw new NoSuchMethodException("Hero action owner");
            Object painter = createShufflePainter(owner, composer);
            Method actionButton = findActionButton(owner, composer);
            String showKey = showKeyForMeta(context.meta);
            boolean selected = RandomEpisodeSettings.isShowEnabled(showKey);
            Function0<Unit> click = new ToggleShowAction(showKey);
            Function0<Unit> longPress = new PoolDialogAction(showKey);
            Function0<?> focused = context.onFocused == null ? NoOpAction.INSTANCE : context.onFocused;
            long selectedBackground = longStaticField("b2.y", "d");
            long selectedContent = longStaticField("b2.y", "b");
            actionButton.invoke(
                    null, null, painter, "Random playback", click, longPress,
                    true, selected, selectedBackground, selectedContent,
                    focused, composer, 0, 0);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render the random playback toggle", error);
        }
    }

    /** Captures the current detail model and Nuvio's merged local/provider watched set. */
    public static void captureDetailState(Object meta, Set<?> watchedEpisodes) {
        String showKey = showKeyForMeta(meta);
        Object videos = property(meta, "getVideos");
        if (showKey == null || !(videos instanceof List)) return;

        Set<String> watched = new HashSet<>();
        if (watchedEpisodes != null) {
            for (Object pair : watchedEpisodes) {
                String key = RandomEpisodeSettings.episodeKey(
                        pairInteger(pair, true), pairInteger(pair, false));
                if (key != null) watched.add(key);
            }
            RandomEpisodeSettings.replaceWatchedEpisodes(showKey, watched);
        } else {
            watched.addAll(RandomEpisodeSettings.watchedEpisodes(showKey));
        }

        synchronized (SESSION_LOCK) {
            DETAIL_STATES.put(showKey, new DetailState((List<?>) videos, watched));
            HOME_CATALOGS.put(showKey, (List<?>) videos);
        }
    }

    /** Captures Nuvio's already-loaded Home episode summary without starting a metadata request. */
    public static void captureHomeCatalog(Object summary, List<?> videos) {
        String contentId = stringProperty(summary, "getId");
        if (contentId == null) contentId = firstInstanceString(summary);
        String showKey = RandomEpisodeSettings.canonicalShowKey("series", contentId);
        if (showKey == null || videos == null) return;

        List<HomeEpisode> catalog = new ArrayList<>();
        for (Object video : videos) {
            HomeEpisode episode = homeEpisode(video);
            if (episode != null) catalog.add(episode);
        }
        synchronized (SESSION_LOCK) {
            HOME_CATALOGS.put(showKey, catalog);
        }
    }

    /** Rewrites only a randomized initial route; ordinary and explicit episode routes are preserved. */
    public static String rewriteStreamRoute(String route) {
        if (route == null || !route.startsWith("stream/")) return route;

        Object video;
        synchronized (SESSION_LOCK) {
            video = pendingVideo;
            if (video != null) {
                pendingVideo = null;
                if (pendingFromHome) homeActive = false;
                pendingFromHome = false;
                sessionVideos = pendingVideos;
                pendingVideos = null;
                sessionShowKey = pendingShowKey;
                pendingShowKey = null;
                pendingManualSelection = false;
                manualDialogRendered = false;
                sessionSeason = integerProperty(video, "getSeason");
                sessionEpisode = integerProperty(video, "getEpisode");
                randomSessionActive = true;
                nextRandomVideoId = null;
                nextRandomVideo = null;
                nextForCurrentSeason = null;
                nextForCurrentEpisode = null;
            } else {
                activateOrContinueOrdinaryRouteLocked(route);
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
                if ("poster".equals(key) && thumbnail != null) value = encode(thumbnail);
                else if ("season".equals(key)) value = numberValue(season);
                else if ("episode".equals(key)) value = numberValue(episode);
                else if ("episodeName".equals(key) && title != null) value = encode(title);
                else if ("runtime".equals(key) && runtime != null) value = runtime.toString();
                rewritten.append(key).append('=').append(value);
            }
        }
        return rewritten.toString();
    }

    /** Captures the exact list and coordinates passed to Nuvio's sequential resolver. */
    public static void captureNextContext(
            int currentEpisode, Integer currentSeason, List<?> videos
    ) {
        NEXT_CONTEXT.set(new NextContext(videos, currentSeason, currentEpisode));
    }

    /** Replaces Nuvio's sequential result only while a randomized show is playing. */
    public static Object chooseNextEpisode(Object normalNext) {
        NextContext context = NEXT_CONTEXT.get();
        NEXT_CONTEXT.remove();
        if (!randomSessionActive) return normalNext;

        synchronized (SESSION_LOCK) {
            if (sessionShowKey != null &&
                    (!RandomEpisodeSettings.isEnabled() ||
                            !RandomEpisodeSettings.isShowEnabled(sessionShowKey))) {
                clearSessionLocked();
                return normalNext;
            }
            List<?> videos = context != null && context.videos != null
                    ? context.videos : sessionVideos;
            Integer season = context != null ? context.season : sessionSeason;
            Integer episode = context != null ? context.episode : sessionEpisode;
            sessionVideos = videos;
            sessionSeason = season;
            sessionEpisode = episode;

            if (nextRandomVideo != null &&
                    equalInteger(nextForCurrentSeason, season) &&
                    equalInteger(nextForCurrentEpisode, episode) &&
                    containsVideo(videos, nextRandomVideoId)) {
                return nextRandomVideo;
            }

            Object selected = selectNextLocked(videos, season, episode, sessionShowKey);
            if (selected == null) {
                nextRandomVideoId = null;
                nextRandomVideo = null;
                nextForCurrentSeason = season;
                nextForCurrentEpisode = episode;
                return null;
            }
            nextRandomVideoId = stringProperty(selected, "getId");
            nextRandomVideo = selected;
            nextForCurrentSeason = season;
            nextForCurrentEpisode = episode;
            return selected;
        }
    }

    static Object chooseNextEpisode(
            Object normalNext, List<?> videos, Integer currentSeason, Integer currentEpisode
    ) {
        captureNextContext(
                currentEpisode == null ? 0 : currentEpisode,
                currentSeason,
                videos);
        return chooseNextEpisode(normalNext);
    }

    /** Mirrors Nuvio's local completion threshold into the persisted random-pool snapshot. */
    public static void recordProgress(long position, long duration, boolean completed) {
        if (!randomSessionActive || sessionShowKey == null) return;
        boolean thresholdReached = duration > 0 && position >= Math.round(duration * 0.90d);
        if (!completed && !thresholdReached) return;
        RandomEpisodeSettings.markEpisodeWatched(
                sessionShowKey, sessionSeason, sessionEpisode);
        synchronized (SESSION_LOCK) {
            ContinueResume resume = CONTINUE_RESUMES.get(sessionShowKey);
            if (resume != null && resume.matches(sessionSeason, sessionEpisode, null)) {
                CONTINUE_RESUMES.remove(sessionShowKey);
            }
            DetailState state = DETAIL_STATES.get(sessionShowKey);
            if (state != null) {
                String key = RandomEpisodeSettings.episodeKey(sessionSeason, sessionEpisode);
                if (key != null) state.watched.add(key);
            }
        }
    }

    /** Kept for binary/test compatibility; tracking is never suppressed by random playback. */
    public static boolean shouldSkipTracking() {
        return false;
    }

    /** Replaces the native episode label while random manual source selection is open. */
    public static String rewriteManualSubtitle(String subtitle) {
        synchronized (SESSION_LOCK) {
            Object video = pendingVideo;
            if (video == null || !pendingManualSelection) return subtitle;
            manualDialogRendered = true;
            String label = episodeLabel(
                    integerProperty(video, "getSeason"),
                    integerProperty(video, "getEpisode"),
                    true);
            return label == null ? subtitle : label;
        }
    }

    /** Re-selects the visit episode when its per-show pool changes. */
    static void onEpisodePoolChanged(String showKey) {
        HeroContext context = HERO_CONTEXT.get();
        synchronized (SESSION_LOCK) {
            refreshRetainedHomeSplitsLocked(showKey);
            if (context == null || context.resume || !equalString(context.showKey, showKey)) return;
            clearPendingLocked();
            prepareHeroSelectionLocked(context.meta, showKey, true);
        }
    }

    /**
     * Rewrites randomized Next Up entries before Nuvio separates future releases into its
     * Upcoming section. A rewritten aired episode therefore follows the native Continue
     * Watching branch, while unrelated items retain Nuvio's original classification.
     */
    public static List<?> rewriteHomeContinueItems(List<?> items) {
        RandomEpisodeRefreshState.observeForCompose();
        HOME_SPLIT_INPUT.set(new HomeSplitInput(items));
        if (items == null || items.isEmpty() || !RandomEpisodeSettings.isEnabled()) return items;

        List<Object> rewrittenItems = new ArrayList<>(items.size());
        boolean changed = false;
        for (Object item : items) {
            Object rewritten = rewriteHomeContinueItem(item);
            if (rewritten == null) {
                changed = true;
                continue;
            }
            rewrittenItems.add(rewritten);
            if (rewritten != item) changed = true;
        }
        return changed ? rewrittenItems : items;
    }

    /** Retains Nuvio's split lists so a Detail setting can update a retained Home screen. */
    public static Object captureHomeContinueSplit(Object pair) {
        HomeSplitInput input = HOME_SPLIT_INPUT.get();
        HOME_SPLIT_INPUT.remove();
        if (input == null || pair == null) return pair;
        Object first = property(pair, "getFirst");
        Object second = property(pair, "getSecond");
        if (!(first instanceof List) || !(second instanceof List)) return pair;

        synchronized (SESSION_LOCK) {
            List<?> continueItems = (List<?>) first;
            List<?> upcomingItems = (List<?>) second;
            for (int index = HOME_SPLITS.size() - 1; index >= 0; index--) {
                HomeSplit existing = HOME_SPLITS.get(index);
                if (existing.continueItems == continueItems || existing.upcomingItems == upcomingItems) {
                    HOME_SPLITS.remove(index);
                }
            }
            HOME_SPLITS.add(new HomeSplit(input.sourceItems, continueItems, upcomingItems));
            while (HOME_SPLITS.size() > 12) HOME_SPLITS.remove(0);
        }
        return pair;
    }

    /** Captures the exact list instances retained by Nuvio's immutable Home state model. */
    public static void captureHomeState(
            Object state, List<?> continueItems, List<?> upcomingItems
    ) {
        if (Boolean.TRUE.equals(HOME_STATE_CLONING.get()) || state == null ||
                continueItems == null || upcomingItems == null) return;
        synchronized (SESSION_LOCK) {
            for (int index = HOME_STATES.size() - 1; index >= 0; index--) {
                HomeState existing = HOME_STATES.get(index);
                if (existing.state == state || existing.continueItems == continueItems ||
                        existing.upcomingItems == upcomingItems) {
                    HOME_STATES.remove(index);
                }
            }
            HOME_STATES.add(new HomeState(state, continueItems, upcomingItems));
            while (HOME_STATES.size() > 12) HOME_STATES.remove(0);
        }
    }

    /**
     * Rewrites only Next Up cards for random-enabled shows. One selection is retained for
     * the complete Home visit; returning to Home starts a new visit and a new draw.
     * Returning null intentionally omits an exhausted Unwatched-only card.
     */
    public static Object rewriteHomeContinueItem(Object item) {
        if (item == null || !isNextUpContinueItem(item) || !RandomEpisodeSettings.isEnabled()) {
            return item;
        }
        String showKey = showKeyForContinueItem(item);
        if (showKey == null || !RandomEpisodeSettings.isShowEnabled(showKey)) return item;

        synchronized (SESSION_LOCK) {
            Object identitySource = nativeHomeSource(item);
            Object retainedSource = HOME_NATIVE_SOURCE_ITEMS.get(showKey);
            String lastVideoKey = LAST_HOME_VIDEO_KEYS.get(showKey);
            boolean generatedClone = retainedSource != null && lastVideoKey != null &&
                    lastVideoKey.equals(continueVideoId(item));
            if (!generatedClone && retainedSource != null) {
                String lastEpisodeKey = LAST_HOME_EPISODE_KEYS.get(showKey);
                generatedClone = lastEpisodeKey != null &&
                        lastEpisodeKey.equals(continueEpisodeKey(item));
            }
            Object nativeSource;
            if (retainedSource != null && (identitySource != item || generatedClone)) {
                nativeSource = retainedSource;
            } else {
                nativeSource = identitySource;
                HOME_NATIVE_SOURCE_ITEMS.put(showKey, nativeSource);
            }
            HomeSelection existing = HOME_SELECTIONS.get(showKey);
            if (existing != null) {
                HOME_ITEM_SELECTIONS.put(existing.item, existing);
                return existing.item;
            }

            List<?> videos = HOME_CATALOGS.get(showKey);
            if (videos == null) {
                DetailState detail = DETAIL_STATES.get(showKey);
                if (detail != null) videos = detail.videos;
            }
            boolean unwatchedOnly = RandomEpisodeSettings.POOL_UNWATCHED.equals(
                    RandomEpisodeSettings.episodePool(showKey));
            Set<String> watched = RandomEpisodeSettings.watchedEpisodes(showKey);
            DetailState detail = DETAIL_STATES.get(showKey);
            if (detail != null) watched.addAll(detail.watched);
            List<Object> eligible = eligibleVideos(
                    videos, null, null, watched, unwatchedOnly);
            if (eligible.isEmpty()) return unwatchedOnly ? null : item;

            String previousKey = LAST_HOME_VIDEO_KEYS.get(showKey);
            List<Object> candidates = eligible;
            if (previousKey != null && eligible.size() > 1) {
                candidates = new ArrayList<>();
                for (Object candidate : eligible) {
                    if (!previousKey.equals(videoKey(candidate))) candidates.add(candidate);
                }
            }
            Object selected = candidates.get(RANDOM.nextInt(candidates.size()));
            Object rewritten = createRandomNextUpItem(nativeSource, selected);
            if (rewritten == null) return item;

            HomeSelection selection = new HomeSelection(
                    showKey, selected, videos, nativeSource, rewritten);
            HOME_SELECTIONS.put(showKey, selection);
            HOME_ITEM_SELECTIONS.put(rewritten, selection);
            HOME_RANDOM_SOURCE_ITEMS.put(rewritten, nativeSource);
            LAST_HOME_VIDEO_KEYS.put(showKey, videoKey(selected));
            String selectedEpisodeKey = RandomEpisodeSettings.episodeKey(
                    integerProperty(selected, "getSeason"),
                    integerProperty(selected, "getEpisode"));
            if (selectedEpisodeKey != null) {
                LAST_HOME_EPISODE_KEYS.put(showKey, selectedEpisodeKey);
            }
            return rewritten;
        }
    }

    /** Arms the exact episode displayed by a rewritten Home card before native navigation. */
    public static Function0<?> wrapHomeContinuePlay(Object item, Function0<?> action) {
        if (item == null || action == null) return action;
        HomeSelection selection;
        synchronized (SESSION_LOCK) {
            selection = HOME_ITEM_SELECTIONS.get(item);
            if (selection == null) selection = HOME_SELECTIONS.get(showKeyForContinueItem(item));
        }
        return selection == null ? action : new HomePlayAction(selection, action);
    }

    /** Stores the current Continue Watching item for the card-content composition. */
    public static void prepareContinueWatchingItem(Object item) {
        CONTINUE_ITEM.set(item);
        updateContinueResume(item);
    }

    /** Associates Nuvio's remembered card-content lambda with its source item. */
    public static void bindContinueWatchingContent(Object content) {
        Object item = CONTINUE_ITEM.get();
        if (content != null && item != null) CONTINUE_CONTENT_ITEMS.put(content, item);
    }

    /** Restores the exact item when an individual remembered card lambda recomposes. */
    public static void activateContinueWatchingContent(Object content) {
        Object item = content == null ? null : CONTINUE_CONTENT_ITEMS.get(content);
        if (item != null) {
            CONTINUE_ITEM.set(item);
            updateContinueResume(item);
        }
    }

    /** Draws a compact shuffle marker in the top-left corner of a Continue Watching artwork box. */
    public static void renderContinueWatchingBadge(Object composer) {
        if (composer == null) return;
        boolean groupStarted = false;
        try {
            Method beginGroup = composer.getClass().getMethod("d0", Integer.TYPE);
            beginGroup.invoke(composer, 0x4d6f7252);
            groupStarted = true;
            String showKey = showKeyForContinueItem(CONTINUE_ITEM.get());
            if (!RandomEpisodeSettings.isEnabled() ||
                    !RandomEpisodeSettings.isShowEnabled(showKey)) return;

            Class<?> modifierClass = Class.forName("u1.q");
            Class<?> alignmentClass = Class.forName("u1.d");
            Class<?> shapeClass = Class.forName("b2.u0");
            Class<?> composerClass = Class.forName("e1.p");
            Object modifier = staticField("u1.n", "b");
            Object boxScope = staticField("c0.u", "a");
            Object topStart = staticField("u1.b", "a");
            modifier = declaredMethod(boxScope.getClass(), "a", modifierClass, alignmentClass)
                    .invoke(boxScope, modifier, topStart);
            modifier = declaredMethod(Class.forName("c0.b"), "w", modifierClass,
                    Float.TYPE, Float.TYPE, Float.TYPE, Float.TYPE)
                    .invoke(null, modifier, 8f, 8f, 0f, 0f);
            modifier = declaredMethod(Class.forName("androidx.compose.foundation.layout.b"),
                    "l", modifierClass, Float.TYPE).invoke(null, modifier, 20f);

            Object circle = staticField("j0.g", "a");
            long shadowColor = longStaticField("b2.y", "k");
            modifier = declaredMethod(Class.forName("y1.g"), "g", modifierClass,
                    Float.TYPE, shapeClass, Long.TYPE, Integer.TYPE)
                    .invoke(null, modifier, 10f, circle, shadowColor, 12);
            long badgeColor = longStaticField("b2.y", "d");
            modifier = declaredMethod(Class.forName("w.m"), "g", modifierClass,
                    Long.TYPE, shapeClass).invoke(null, modifier, badgeColor, circle);
            modifier = declaredMethod(Class.forName("u1.a"), "d", modifierClass,
                    Float.TYPE).invoke(null, modifier, 2f);

            long iconColor = longStaticField("b2.y", "b");
            declaredMethod(Class.forName("p5.k0"), "b", Class.forName("h2.f"),
                    String.class, modifierClass, Long.TYPE, composerClass,
                    Integer.TYPE, Integer.TYPE).invoke(
                    null, shuffleBadgeIcon(), "Random playback", modifier, iconColor,
                    composer, 0, 0);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render Continue Watching random badge", error);
        } finally {
            if (groupStarted) {
                try { composer.getClass().getMethod("p", Boolean.TYPE).invoke(composer, false); }
                catch (Throwable error) {
                    Log.e(TAG, "Unable to close random badge composition group", error);
                }
            }
        }
    }

    static boolean shouldOfferRandomEpisode(Object meta) {
        if (!RandomEpisodeSettings.isEnabled() || meta == null) return false;
        String showKey = showKeyForMeta(meta);
        Object videos = property(meta, "getVideos");
        return showKey != null && videos instanceof List &&
                !eligibleVideos((List<?>) videos, null, null).isEmpty();
    }

    static List<Object> eligibleVideos(List<?> videos, Integer currentSeason, Integer currentEpisode) {
        return eligibleVideos(videos, currentSeason, currentEpisode, Collections.emptySet(), false);
    }

    static List<Object> eligibleVideos(
            List<?> videos,
            Integer currentSeason,
            Integer currentEpisode,
            Set<String> watched,
            boolean unwatchedOnly
    ) {
        List<Object> eligible = new ArrayList<>();
        if (videos == null) return eligible;
        for (Object video : videos) {
            Integer season = integerProperty(video, "getSeason");
            Integer episode = integerProperty(video, "getEpisode");
            String id = stringProperty(video, "getId");
            if (id == null || id.trim().isEmpty() || season == null || season <= 0 ||
                    episode == null || episode <= 0) continue;
            Object available = property(video, "getAvailable");
            if (Boolean.FALSE.equals(available)) continue;
            if (season.equals(currentSeason) && episode.equals(currentEpisode)) continue;
            if (!hasAired(stringProperty(video, "getReleased"))) continue;
            String episodeKey = RandomEpisodeSettings.episodeKey(season, episode);
            if (unwatchedOnly && watched != null && watched.contains(episodeKey)) continue;
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
            pendingShowKey = null;
            pendingManualSelection = true;
        }
    }

    static void setRandomSessionForTests(boolean active) {
        synchronized (SESSION_LOCK) {
            clearSessionLocked();
            randomSessionActive = active;
        }
    }

    static void setRandomSeedForTests(long seed) {
        RANDOM.setSeed(seed);
    }

    static int shuffleDrawableIdForTests() {
        return SHUFFLE_DRAWABLE_ID;
    }

    static String showKeyForContinueItemForTests(Object item) {
        return showKeyForContinueItem(item);
    }

    static String activeContinueShowKeyForTests() {
        return showKeyForContinueItem(CONTINUE_ITEM.get());
    }

    static Function0<?> wrapHeroLongPressForTests(Object meta, Function0<?> action) {
        HERO_CONTEXT.set(new HeroContext(
                meta, null, showKeyForMeta(meta), false,
                null, null,
                action, action, action, null));
        return wrapHeroLongPress(action);
    }

    static Function0<?> heroPlayActionForTests() {
        HeroContext context = HERO_CONTEXT.get();
        return context == null ? null : context.onPlay;
    }

    static boolean isRandomSessionActiveForTests() {
        return randomSessionActive;
    }

    static void resetForTests() {
        HERO_CONTEXT.remove();
        NEXT_CONTEXT.remove();
        CONTINUE_ITEM.remove();
        HOME_SPLIT_INPUT.remove();
        HOME_STATE_CLONING.remove();
        heroActionOwner = null;
        homeOwner = null;
        synchronized (SESSION_LOCK) {
            DETAIL_STATES.clear();
            LAST_HERO_VIDEO_KEYS.clear();
            HOME_CATALOGS.clear();
            HOME_SELECTIONS.clear();
            LAST_HOME_VIDEO_KEYS.clear();
            LAST_HOME_EPISODE_KEYS.clear();
            CONTINUE_RESUMES.clear();
            NATIVE_NEXT_TARGETS.clear();
            CONTINUE_CONTENT_ITEMS.clear();
            HOME_ITEM_SELECTIONS.clear();
            HOME_RANDOM_SOURCE_ITEMS.clear();
            HOME_NATIVE_SOURCE_ITEMS.clear();
            HOME_SPLITS.clear();
            HOME_STATES.clear();
            homeActive = false;
            clearHeroSelectionLocked();
            clearSessionLocked();
        }
    }

    static void leaveHomeForTests() {
        synchronized (SESSION_LOCK) { homeActive = false; }
    }

    static void prepareNativeHomeSourceForTests(Object meta, Object nativeNextToWatch) {
        synchronized (SESSION_LOCK) {
            prepareNativeHomeSourceLocked(
                    meta, nativeNextToWatch, showKeyForMeta(meta));
        }
    }

    static void prepareNativeHomeSourceForTests(String showKey) {
        synchronized (SESSION_LOCK) {
            prepareNativeHomeSourceLocked(null, null, showKey);
        }
    }

    static Object prepareHeroNextToWatchForTests(
            Object meta, Object nativeNextToWatch, Function0<?> entryAction
    ) {
        HeroContext previous = HERO_CONTEXT.get();
        String showKey = showKeyForMeta(meta);
        synchronized (SESSION_LOCK) {
            captureNativeNextTargetLocked(showKey, nativeNextToWatch);
        }
        invalidateRemovedContinueResume(nativeNextToWatch, showKey, previous);
        ResumeTarget resumeTarget = resumeTargetForMeta(meta, showKey);
        boolean resume = usableNativeResume(nativeNextToWatch, showKey) || resumeTarget != null;
        updateHeroSelection(meta, showKey, resume, entryAction, previous);
        Function0<?> wrappedPlay = new PersistentPlayAction(
                meta, entryAction, false, resume,
                resumeTarget == null ? null : resumeTarget.video);
        HERO_CONTEXT.set(new HeroContext(
                meta, nativeNextToWatch, showKey, resume,
                resumeTarget == null ? null : resumeTarget.video,
                resumeTarget == null ? null : resumeTarget.progress,
                entryAction, wrappedPlay, entryAction, null));
        return rewriteHeroNextToWatch(nativeNextToWatch);
    }

    static Object selectedHeroVideoForTests() {
        synchronized (SESSION_LOCK) { return heroVideo; }
    }

    private static void activateOrContinueOrdinaryRouteLocked(String route) {
        String showKey = showKeyFromRoute(route);
        String videoId = routeVideoId(route);
        boolean enabled = showKey != null && RandomEpisodeSettings.isEnabled() &&
                RandomEpisodeSettings.isShowEnabled(showKey);
        if (!enabled) {
            clearSessionLocked();
            return;
        }

        boolean expectedNext = randomSessionActive && showKey.equals(sessionShowKey) &&
                nextRandomVideoId != null && nextRandomVideoId.equals(videoId);
        if (!expectedNext) {
            remainingVideoKeys.clear();
        }
        DetailState detail = DETAIL_STATES.get(showKey);
        if (detail != null) sessionVideos = detail.videos;
        sessionShowKey = showKey;
        sessionSeason = queryInteger(route, "season");
        sessionEpisode = queryInteger(route, "episode");
        randomSessionActive = true;
        nextRandomVideoId = null;
        nextRandomVideo = null;
        nextForCurrentSeason = null;
        nextForCurrentEpisode = null;
    }

    private static Object selectNextLocked(
            List<?> videos, Integer currentSeason, Integer currentEpisode, String showKey
    ) {
        boolean unwatchedOnly = showKey != null && RandomEpisodeSettings.POOL_UNWATCHED.equals(
                RandomEpisodeSettings.episodePool(showKey));
        Set<String> watched = showKey == null
                ? new HashSet<>() : RandomEpisodeSettings.watchedEpisodes(showKey);
        DetailState detail = showKey == null ? null : DETAIL_STATES.get(showKey);
        if (detail != null) watched.addAll(detail.watched);
        List<Object> candidates = eligibleVideos(
                videos, currentSeason, currentEpisode, watched, unwatchedOnly);
        if (candidates.isEmpty()) {
            remainingVideoKeys.clear();
            return null;
        }

        Set<String> valid = new LinkedHashSet<>();
        for (Object candidate : candidates) valid.add(videoKey(candidate));
        remainingVideoKeys.removeIf(key -> !valid.contains(key));
        if (remainingVideoKeys.isEmpty()) remainingVideoKeys.addAll(valid);

        List<Object> remaining = new ArrayList<>();
        for (Object candidate : candidates) {
            if (remainingVideoKeys.contains(videoKey(candidate))) remaining.add(candidate);
        }
        if (remaining.isEmpty()) return null;
        Object selected = remaining.get(RANDOM.nextInt(remaining.size()));
        remainingVideoKeys.remove(videoKey(selected));
        return selected;
    }

    private static void dispatchPreparedRandom(
            Object meta, Function0<?> callback, boolean manualSelection
    ) {
        String showKey = showKeyForMeta(meta);
        Object videos = property(meta, "getVideos");
        if (showKey == null || !(videos instanceof List)) return;
        Object selected;
        List<Object> eligible;
        synchronized (SESSION_LOCK) {
            if (!equalString(heroShowKey, showKey) || heroVideo == null) {
                prepareHeroSelectionLocked(meta, showKey, false);
            }
            selected = heroVideo;
            eligible = eligibleForShowLocked(meta, showKey);
            if (selected == null || eligible.isEmpty()) {
                toast(RandomEpisodeSettings.POOL_UNWATCHED.equals(
                        RandomEpisodeSettings.episodePool(showKey))
                        ? "No unwatched episodes are available"
                        : "No aired episodes are available");
                return;
            }
            remainingVideoKeys.clear();
            for (Object candidate : eligible) remainingVideoKeys.add(videoKey(candidate));
            remainingVideoKeys.remove(videoKey(selected));
            pendingVideo = selected;
            pendingVideos = heroVideos != null ? heroVideos : (List<?>) videos;
            pendingShowKey = showKey;
            pendingManualSelection = manualSelection;
            pendingFromHome = false;
            manualDialogRendered = false;
        }
        try {
            callback.invoke();
        } finally {
            synchronized (SESSION_LOCK) {
                if (!manualSelection && !randomSessionActive) clearPendingLocked();
            }
        }
    }

    private static void updateHeroSelection(
            Object meta,
            String showKey,
            boolean resume,
            Function0<?> entryAction,
            HeroContext previous
    ) {
        boolean newEntry = previous == null || !equalString(previous.showKey, showKey);
        synchronized (SESSION_LOCK) {
            if (newEntry) clearPendingLocked();
            if (resume || showKey == null ||
                    !RandomEpisodeSettings.isEnabled() ||
                    !RandomEpisodeSettings.isShowEnabled(showKey)) {
                clearHeroSelectionLocked();
                return;
            }
            if (newEntry || !equalString(heroShowKey, showKey) || heroVideo == null) {
                prepareHeroSelectionLocked(meta, showKey, newEntry);
            }
        }
    }

    private static void dispatchPreparedResume(
            Object meta, Object resumeVideo, Function0<?> callback, boolean manualSelection
    ) {
        String showKey = showKeyForMeta(meta);
        Object videos = property(meta, "getVideos");
        if (showKey == null || resumeVideo == null || !(videos instanceof List)) {
            callback.invoke();
            return;
        }
        synchronized (SESSION_LOCK) {
            List<Object> eligible = eligibleForShowLocked(meta, showKey);
            remainingVideoKeys.clear();
            for (Object candidate : eligible) remainingVideoKeys.add(videoKey(candidate));
            remainingVideoKeys.remove(videoKey(resumeVideo));
            pendingVideo = resumeVideo;
            pendingVideos = (List<?>) videos;
            pendingShowKey = showKey;
            pendingManualSelection = manualSelection;
            pendingFromHome = false;
            manualDialogRendered = false;
        }
        try {
            callback.invoke();
        } finally {
            synchronized (SESSION_LOCK) {
                if (!manualSelection && !randomSessionActive) clearPendingLocked();
            }
        }
    }

    private static void prepareHeroSelectionLocked(
            Object meta, String showKey, boolean avoidPrevious
    ) {
        clearHeroSelectionLocked();
        if (showKey == null || !RandomEpisodeSettings.isEnabled() ||
                !RandomEpisodeSettings.isShowEnabled(showKey)) return;
        List<Object> eligible = eligibleForShowLocked(meta, showKey);
        if (eligible.isEmpty()) return;

        String previousKey = avoidPrevious ? LAST_HERO_VIDEO_KEYS.get(showKey) : null;
        List<Object> candidates = eligible;
        if (previousKey != null && eligible.size() > 1) {
            candidates = new ArrayList<>();
            for (Object candidate : eligible) {
                if (!previousKey.equals(videoKey(candidate))) candidates.add(candidate);
            }
        }
        Object selected = candidates.get(RANDOM.nextInt(candidates.size()));
        Object videos = property(meta, "getVideos");
        heroVideo = selected;
        heroVideos = videos instanceof List ? (List<?>) videos : null;
        heroShowKey = showKey;
        LAST_HERO_VIDEO_KEYS.put(showKey, videoKey(selected));
    }

    private static List<Object> eligibleForShowLocked(Object meta, String showKey) {
        Object videos = property(meta, "getVideos");
        if (!(videos instanceof List)) return Collections.emptyList();
        boolean unwatchedOnly = RandomEpisodeSettings.POOL_UNWATCHED.equals(
                RandomEpisodeSettings.episodePool(showKey));
        Set<String> watched = RandomEpisodeSettings.watchedEpisodes(showKey);
        DetailState detail = DETAIL_STATES.get(showKey);
        if (detail != null) watched.addAll(detail.watched);
        return eligibleVideos((List<?>) videos, null, null, watched, unwatchedOnly);
    }

    private static void clearDismissedManualSelection() {
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && !manualDialogRendered && !randomSessionActive) {
                clearPendingLocked();
            }
        }
    }

    private static void clearPendingManualSelection() {
        synchronized (SESSION_LOCK) {
            if (pendingManualSelection && !randomSessionActive) clearPendingLocked();
        }
    }

    private static String showKeyForMeta(Object meta) {
        return RandomEpisodeSettings.canonicalShowKey(
                stringProperty(meta, "getApiType"), stringProperty(meta, "getId"));
    }

    private static void prepareNativeHomeSourceLocked(
            Object meta, Object nativeNextToWatch, String showKey
    ) {
        if (showKey == null || isResume(nativeNextToWatch)) return;
        NativeNextTarget target = NATIVE_NEXT_TARGETS.get(showKey);
        String videoId = target == null
                ? stringProperty(nativeNextToWatch, "getNextVideoId") : target.videoId;
        Integer season = target == null
                ? integerProperty(nativeNextToWatch, "getNextSeason") : target.season;
        Integer episode = target == null
                ? integerProperty(nativeNextToWatch, "getNextEpisode") : target.episode;

        List<?> videos = null;
        DetailState detail = DETAIL_STATES.get(showKey);
        if (detail != null) videos = detail.videos;
        if (videos == null) {
            Object videosValue = property(meta, "getVideos");
            if (videosValue instanceof List) videos = (List<?>) videosValue;
        }
        if (videos == null) videos = HOME_CATALOGS.get(showKey);
        if (videos == null) return;
        Object video = null;
        for (Object candidate : videos) {
            boolean idMatch = videoId != null && videoId.equals(
                    stringProperty(candidate, "getId"));
            boolean episodeMatch = equalInteger(
                    season, integerProperty(candidate, "getSeason")) && equalInteger(
                    episode, integerProperty(candidate, "getEpisode"));
            if (idMatch || episodeMatch) {
                video = candidate;
                break;
            }
        }
        if (video == null) {
            video = oldestUnwatchedVideoLocked(videos, showKey);
        }
        if (video == null) return;

        Object template = HOME_NATIVE_SOURCE_ITEMS.get(showKey);
        HomeSelection selection = HOME_SELECTIONS.get(showKey);
        if (template == null && selection != null) template = selection.sourceItem;
        if (template == null) {
            for (HomeState state : HOME_STATES) {
                template = nextUpForShow(state.upcomingItems, showKey);
                if (template == null) template = nextUpForShow(state.continueItems, showKey);
                if (template != null) break;
            }
        }
        if (template == null) return;

        Object nativeSource = createNativeNextUpItem(template, video);
        if (nativeSource != null) HOME_NATIVE_SOURCE_ITEMS.put(showKey, nativeSource);
    }

    private static void captureNativeNextTargetLocked(String showKey, Object nextToWatch) {
        if (showKey == null || nextToWatch == null || isResume(nextToWatch)) return;
        String displayText = stringProperty(nextToWatch, "getDisplayText");
        if (displayText == null) {
            Object value = declaredFieldValue(nextToWatch, "displayText");
            if (value instanceof String) displayText = (String) value;
        }
        if (displayText != null && displayText.startsWith("Play S")) return;
        String videoId = stringProperty(nextToWatch, "getNextVideoId");
        Integer season = integerProperty(nextToWatch, "getNextSeason");
        Integer episode = integerProperty(nextToWatch, "getNextEpisode");
        if (videoId == null) {
            Object value = declaredFieldValue(nextToWatch, "nextVideoId");
            if (value instanceof String) videoId = (String) value;
        }
        if (season == null) {
            Object value = declaredFieldValue(nextToWatch, "nextSeason");
            if (value instanceof Number) season = ((Number) value).intValue();
        }
        if (episode == null) {
            Object value = declaredFieldValue(nextToWatch, "nextEpisode");
            if (value instanceof Number) episode = ((Number) value).intValue();
        }
        if (videoId != null || RandomEpisodeSettings.episodeKey(season, episode) != null) {
            NATIVE_NEXT_TARGETS.put(showKey, new NativeNextTarget(videoId, season, episode));
        }
    }

    private static Object oldestUnwatchedVideoLocked(List<?> videos, String showKey) {
        Set<String> watched = RandomEpisodeSettings.watchedEpisodes(showKey);
        DetailState detail = DETAIL_STATES.get(showKey);
        if (detail != null) watched.addAll(detail.watched);

        Object oldest = null;
        Integer oldestSeason = null;
        Integer oldestEpisode = null;
        for (Object candidate : videos) {
            Integer season = integerProperty(candidate, "getSeason");
            Integer episode = integerProperty(candidate, "getEpisode");
            if (season == null || season <= 0 || episode == null || episode <= 0 ||
                    Boolean.FALSE.equals(property(candidate, "getAvailable")) ||
                    watched.contains(RandomEpisodeSettings.episodeKey(season, episode))) {
                continue;
            }
            if (oldest == null || season < oldestSeason ||
                    (season.equals(oldestSeason) && episode < oldestEpisode)) {
                oldest = candidate;
                oldestSeason = season;
                oldestEpisode = episode;
            }
        }
        return oldest;
    }

    private static void refreshRetainedHomeSplitsLocked(String showKey) {
        if (showKey == null || (HOME_SPLITS.isEmpty() && HOME_STATES.isEmpty())) return;
        boolean enabled = RandomEpisodeSettings.isEnabled() &&
                RandomEpisodeSettings.isShowEnabled(showKey);
        HomeSelection selection = HOME_SELECTIONS.get(showKey);
        Object source = HOME_NATIVE_SOURCE_ITEMS.get(showKey);
        if (source == null) source = selection == null ? null : selection.sourceItem;
        for (HomeSplit split : HOME_SPLITS) {
            if (source != null) break;
            if (split.sourceItems != null) {
                for (Object candidate : split.sourceItems) {
                    if (isNextUpContinueItem(candidate) &&
                            equalString(showKey, showKeyForContinueItem(candidate))) {
                        source = nativeHomeSource(candidate);
                        break;
                    }
                }
            }
            if (source != null) break;
        }
        if (source == null) {
            for (HomeState state : HOME_STATES) {
                source = nextUpForShow(state.upcomingItems, showKey);
                if (source == null) source = nextUpForShow(state.continueItems, showKey);
                if (source != null) source = nativeHomeSource(source);
                if (source != null) break;
            }
        }
        if (source == null) return;

        publishRetainedHomeStateLocked(source, showKey, enabled);
    }

    private static void publishRetainedHomeStateLocked(
            Object source, String showKey, boolean enabled
    ) {
        Object owner = homeOwner;
        if (owner == null) return;
        for (Field ownerField : instanceFields(owner.getClass())) {
            try {
                ownerField.setAccessible(true);
                Object candidate = ownerField.get(owner);
                if (candidate == null) continue;
                Method getValue;
                try {
                    getValue = candidate.getClass().getMethod("getValue");
                } catch (NoSuchMethodException ignored) {
                    continue;
                }
                Object current = getValue.invoke(candidate);
                if (current == null) continue;
                boolean knownHomeState = false;
                for (HomeState captured : HOME_STATES) {
                    if (captured.state.getClass() == current.getClass()) {
                        knownHomeState = true;
                        break;
                    }
                }
                if (!knownHomeState) continue;
                Field continueField;
                Field upcomingField;
                try {
                    continueField = current.getClass().getDeclaredField("b");
                    upcomingField = current.getClass().getDeclaredField("c");
                } catch (NoSuchFieldException ignored) {
                    continue;
                }
                continueField.setAccessible(true);
                upcomingField.setAccessible(true);
                Object continueValue = continueField.get(current);
                Object upcomingValue = upcomingField.get(current);
                if (!(continueValue instanceof List) || !(upcomingValue instanceof List)) continue;

                List<Object> continueItems = new ArrayList<>((List<?>) continueValue);
                List<Object> upcomingItems = new ArrayList<>((List<?>) upcomingValue);
                rewriteRetainedHomeListsLocked(
                        continueItems, upcomingItems, source, showKey, enabled);
                Object replacement = cloneHomeState(current, continueItems, upcomingItems);
                if (replacement == null) continue;

                Method setValue = null;
                for (Method method : candidate.getClass().getMethods()) {
                    if (method.getName().equals("setValue") &&
                            method.getParameterTypes().length == 1) {
                        setValue = method;
                        break;
                    }
                }
                if (setValue == null) continue;
                setValue.setAccessible(true);
                setValue.invoke(candidate, replacement);
                captureHomeState(replacement, continueItems, upcomingItems);
                return;
            } catch (ReflectiveOperationException error) {
                Log.e(TAG, "Unable to publish Nuvio's retained Home state", error);
            }
        }
    }

    private static Object cloneHomeState(
            Object state, List<?> continueItems, List<?> upcomingItems
    ) {
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            Field singletonField = unsafeClass.getDeclaredField("theUnsafe");
            singletonField.setAccessible(true);
            Object unsafe = singletonField.get(null);
            Method allocateInstance = unsafeClass.getMethod("allocateInstance", Class.class);
            Object copy = allocateInstance.invoke(unsafe, state.getClass());
            for (Field field : instanceFields(state.getClass())) {
                field.setAccessible(true);
                Object value = field.get(state);
                if ("b".equals(field.getName())) value = continueItems;
                else if ("c".equals(field.getName())) value = upcomingItems;
                field.set(copy, value);
            }
            return copy;
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Unable to copy Nuvio's retained Home state", error);
            return null;
        }
    }

    private static void rewriteRetainedHomeListsLocked(
            List<?> continueItems,
            List<?> upcomingItems,
            Object source,
            String showKey,
            boolean enabled
    ) {
        try {
            int continueIndex = indexOfNextUpForShow(continueItems, showKey);
            int upcomingIndex = indexOfNextUpForShow(upcomingItems, showKey);
            removeNextUpForShow(continueItems, showKey);
            removeNextUpForShow(upcomingItems, showKey);
            Object replacement;
            List target;
            if (enabled) {
                replacement = rewriteHomeContinueItem(source);
                target = (List) continueItems;
            } else {
                Object payload = unwrapContinueItem(source);
                boolean hasAired = Boolean.TRUE.equals(property(payload, "getHasAired"));
                replacement = source;
                target = (List) (hasAired ? continueItems : upcomingItems);
            }
            if (replacement != null) {
                int priorIndex = target == continueItems ? continueIndex : upcomingIndex;
                if (priorIndex < 0) {
                    priorIndex = target == continueItems ? upcomingIndex : continueIndex;
                }
                int insertionIndex = priorIndex < 0
                        ? target.size() : Math.min(priorIndex, target.size());
                target.add(insertionIndex, replacement);
            }
        } catch (UnsupportedOperationException ignored) {
            // Current Nuvio builds use mutable state lists. A future immutable result safely
            // falls back to its next normal Home data refresh.
        }
    }

    private static Object nextUpForShow(List<?> items, String showKey) {
        for (Object item : items) {
            if (isNextUpContinueItem(item) &&
                    equalString(showKey, showKeyForContinueItem(item))) return item;
        }
        return null;
    }

    private static Object nativeHomeSource(Object item) {
        Object source = HOME_RANDOM_SOURCE_ITEMS.get(item);
        return source == null ? item : source;
    }

    private static String continueVideoId(Object item) {
        Object payload = unwrapContinueItem(item);
        String id = stringProperty(payload, "getVideoId");
        if (id == null || id.isEmpty()) id = stringProperty(payload, "getId");
        if ((id == null || id.isEmpty()) && payload != null) {
            Object fieldValue = instanceFieldValue(payload, 6);
            if (fieldValue instanceof String) id = (String) fieldValue;
        }
        return id == null || id.isEmpty() ? null : id;
    }

    private static String continueEpisodeKey(Object item) {
        Object payload = unwrapContinueItem(item);
        Integer season = integerProperty(payload, "getSeason");
        Integer episode = integerProperty(payload, "getEpisode");
        if (season == null && payload != null) {
            Object fieldValue = instanceFieldValue(payload, 7);
            if (fieldValue instanceof Number) season = ((Number) fieldValue).intValue();
        }
        if (episode == null && payload != null) {
            Object fieldValue = instanceFieldValue(payload, 8);
            if (fieldValue instanceof Number) episode = ((Number) fieldValue).intValue();
        }
        return RandomEpisodeSettings.episodeKey(season, episode);
    }

    private static Object instanceFieldValue(Object target, int index) {
        try {
            List<Field> fields = instanceFields(target.getClass());
            if (index < 0 || index >= fields.size()) return null;
            Field field = fields.get(index);
            field.setAccessible(true);
            return field.get(target);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static Object declaredFieldValue(Object target, String name) {
        if (target == null) return null;
        try {
            Field field = target.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(target);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static void removeNextUpForShow(List<?> items, String showKey) {
        for (int index = items.size() - 1; index >= 0; index--) {
            Object item = items.get(index);
            if (isNextUpContinueItem(item) &&
                    equalString(showKey, showKeyForContinueItem(item))) {
                ((List) items).remove(index);
            }
        }
    }

    private static int indexOfNextUpForShow(List<?> items, String showKey) {
        for (int index = 0; index < items.size(); index++) {
            Object item = items.get(index);
            if (isNextUpContinueItem(item) &&
                    equalString(showKey, showKeyForContinueItem(item))) return index;
        }
        return -1;
    }

    private static String showKeyFromRoute(String route) {
        int query = route.indexOf('?');
        String path = query < 0 ? route : route.substring(0, query);
        String[] parts = path.split("/", -1);
        String contentType = parts.length > 2 ? decode(parts[2]) : null;
        String contentId = queryValue(route, "contentId");
        return RandomEpisodeSettings.canonicalShowKey(contentType, contentId);
    }

    private static String showKeyForContinueItem(Object item) {
        Object payload = unwrapContinueItem(item);
        if (payload == null) return null;
        String contentId = stringProperty(payload, "getContentId");
        String contentType = stringProperty(payload, "getContentType");
        if (contentId == null || contentType == null) {
            String value = String.valueOf(payload);
            contentId = between(value, "contentId=", ", contentType=");
            contentType = between(value, ", contentType=", ", name=");
        }
        return RandomEpisodeSettings.canonicalShowKey(contentType, contentId);
    }

    private static boolean isNextUpContinueItem(Object item) {
        if (item == null) return false;
        String itemValue = String.valueOf(item);
        if (itemValue.startsWith("NextUp(")) return true;
        Object payload = unwrapContinueItem(item);
        return payload != null && String.valueOf(payload).startsWith("NextUpInfo(");
    }

    private static Object createRandomNextUpItem(Object item, Object video) {
        return createNextUpItem(item, video, true);
    }

    private static Object createNativeNextUpItem(Object item, Object video) {
        return createNextUpItem(item, video, false);
    }

    private static Object createNextUpItem(Object item, Object video, boolean randomized) {
        Object payload = unwrapContinueItem(item);
        if (payload == null || video == null) return null;
        String id = stringProperty(video, "getId");
        Integer season = integerProperty(video, "getSeason");
        Integer episode = integerProperty(video, "getEpisode");
        if (id == null || season == null || episode == null) return null;

        try {
            Constructor<?> payloadConstructor = null;
            for (Constructor<?> constructor : payload.getClass().getDeclaredConstructors()) {
                if (constructor.getParameterTypes().length == 26) {
                    payloadConstructor = constructor;
                    break;
                }
            }
            if (payloadConstructor == null) return null;
            payloadConstructor.setAccessible(true);
            List<Field> fields = instanceFields(payload.getClass());
            Class<?>[] parameterTypes = payloadConstructor.getParameterTypes();
            if (fields.size() != parameterTypes.length) return null;
            Object[] values = new Object[fields.size()];
            for (int index = 0; index < fields.size(); index++) {
                Field field = fields.get(index);
                field.setAccessible(true);
                if (!compatibleField(parameterTypes[index], field.getType())) return null;
                values[index] = field.get(payload);
            }
            values[6] = id;
            values[7] = season.intValue();
            values[8] = episode.intValue();
            values[9] = stringProperty(video, "getTitle");
            values[10] = stringProperty(video, "getOverview");
            values[11] = stringProperty(video, "getThumbnail");
            String released = stringProperty(video, "getReleased");
            values[12] = released;
            boolean aired = hasAired(released);
            values[13] = randomized || aired;
            values[14] = randomized || aired ? null : futureAirDateLabel(released);
            if (randomized) {
                values[20] = null;
                values[21] = false;
                values[22] = false;
            } else if (!aired) {
                Long releaseTimestamp = releaseTimestamp(released);
                if (releaseTimestamp != null) values[20] = releaseTimestamp;
            }
            Object rewrittenPayload = payloadConstructor.newInstance(values);

            for (Constructor<?> constructor : item.getClass().getDeclaredConstructors()) {
                Class<?>[] parameters = constructor.getParameterTypes();
                if (parameters.length == 1 && parameters[0].isAssignableFrom(payload.getClass())) {
                    constructor.setAccessible(true);
                    return constructor.newInstance(rewrittenPayload);
                }
            }
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Unable to rewrite random Home episode", error);
        }
        return null;
    }

    private static String futureAirDateLabel(String released) {
        LocalDate date = releaseDate(released);
        if (date == null) return null;
        long days = ChronoUnit.DAYS.between(LocalDate.now(), date);
        if (days <= 0L) return null;
        if (days == 1L) return "Airs Tomorrow";
        return "Airs in " + days + " Days";
    }

    private static Long releaseTimestamp(String released) {
        LocalDate date = releaseDate(released);
        return date == null ? null : date.atStartOfDay(ZoneId.systemDefault())
                .toInstant().toEpochMilli();
    }

    private static LocalDate releaseDate(String released) {
        if (released == null || released.trim().isEmpty()) return null;
        String value = released.trim();
        try {
            return value.length() >= 10
                    ? LocalDate.parse(value.substring(0, 10))
                    : LocalDate.parse(value);
        } catch (DateTimeParseException ignored) {
            try {
                return OffsetDateTime.parse(value).toLocalDate();
            } catch (DateTimeParseException ignoredAgain) {
                return null;
            }
        }
    }

    private static HomeEpisode homeEpisode(Object value) {
        if (value == null) return null;
        String id = stringProperty(value, "getId");
        String title = stringProperty(value, "getTitle");
        String released = stringProperty(value, "getReleased");
        String thumbnail = stringProperty(value, "getThumbnail");
        Integer season = integerProperty(value, "getSeason");
        Integer episode = integerProperty(value, "getEpisode");
        String overview = stringProperty(value, "getOverview");
        Object availableValue = property(value, "getAvailable");
        Boolean available = availableValue instanceof Boolean ? (Boolean) availableValue : null;

        if (id == null) {
            try {
                List<Field> fields = instanceFields(value.getClass());
                if (fields.size() != 8) return null;
                Object[] values = new Object[8];
                for (int index = 0; index < fields.size(); index++) {
                    fields.get(index).setAccessible(true);
                    values[index] = fields.get(index).get(value);
                }
                id = values[0] instanceof String ? (String) values[0] : null;
                title = values[1] instanceof String ? (String) values[1] : null;
                released = values[2] instanceof String ? (String) values[2] : null;
                thumbnail = values[3] instanceof String ? (String) values[3] : null;
                season = values[4] instanceof Number ? ((Number) values[4]).intValue() : null;
                episode = values[5] instanceof Number ? ((Number) values[5]).intValue() : null;
                overview = values[6] instanceof String ? (String) values[6] : null;
                available = values[7] instanceof Boolean ? (Boolean) values[7] : null;
            } catch (ReflectiveOperationException error) {
                Log.e(TAG, "Unable to read Nuvio's Home episode catalogue", error);
                return null;
            }
        }
        return id == null ? null : new HomeEpisode(
                id, title, released, thumbnail, season, episode, overview, available);
    }

    private static List<Field> instanceFields(Class<?> owner) {
        List<Field> fields = new ArrayList<>();
        for (Field field : owner.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers())) fields.add(field);
        }
        return fields;
    }

    private static boolean compatibleField(Class<?> parameter, Class<?> field) {
        if (parameter == field) return true;
        if (!parameter.isPrimitive()) return parameter.isAssignableFrom(field);
        return (parameter == Integer.TYPE && field == Integer.TYPE) ||
                (parameter == Long.TYPE && field == Long.TYPE) ||
                (parameter == Boolean.TYPE && field == Boolean.TYPE) ||
                (parameter == Float.TYPE && field == Float.TYPE) ||
                (parameter == Double.TYPE && field == Double.TYPE);
    }

    private static String firstInstanceString(Object value) {
        if (value == null) return null;
        for (Field field : value.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
            try {
                field.setAccessible(true);
                Object result = field.get(value);
                if (result instanceof String) return (String) result;
            } catch (ReflectiveOperationException ignored) {
                return null;
            }
        }
        return null;
    }

    private static void updateContinueResume(Object item) {
        Object payload = unwrapContinueItem(item);
        String showKey = showKeyForContinueItem(item);
        if (payload == null || showKey == null) return;

        String videoId = stringProperty(payload, "getVideoId");
        Integer season = integerProperty(payload, "getSeason");
        Integer episode = integerProperty(payload, "getEpisode");
        if (videoId == null && RandomEpisodeSettings.episodeKey(season, episode) == null) return;

        Number positionValue = numberProperty(payload, "getPosition");
        Number durationValue = numberProperty(payload, "getDuration");
        long position = positionValue == null ? 0L : positionValue.longValue();
        long duration = durationValue == null ? 0L : durationValue.longValue();
        Number percentage = numberProperty(payload, "getProgressPercentage");
        if (percentage == null) percentage = numberProperty(payload, "getProgressPercent");
        double percentageRatio = 0.0d;
        if (percentage != null) {
            double value = percentage.doubleValue();
            percentageRatio = value <= 1.0d ? value : value / 100.0d;
        }
        boolean started = position > 0L || percentageRatio > 0.0d;
        boolean completed = (duration > 0L && position >= Math.round(duration * 0.90d)) ||
                percentageRatio >= 0.90d;

        synchronized (SESSION_LOCK) {
            if (!started || completed) {
                ContinueResume current = CONTINUE_RESUMES.get(showKey);
                if (current != null && current.matches(season, episode, videoId)) {
                    CONTINUE_RESUMES.remove(showKey);
                }
                return;
            }
            CONTINUE_RESUMES.put(
                    showKey, new ContinueResume(payload, videoId, season, episode));
        }
    }

    private static ResumeTarget resumeTargetForMeta(Object meta, String showKey) {
        if (showKey == null || !RandomEpisodeSettings.isEnabled() ||
                !RandomEpisodeSettings.isShowEnabled(showKey)) return null;
        Object videosValue = property(meta, "getVideos");
        if (!(videosValue instanceof List)) return null;

        ContinueResume resume;
        synchronized (SESSION_LOCK) {
            resume = CONTINUE_RESUMES.get(showKey);
        }
        if (resume == null) return null;
        for (Object video : (List<?>) videosValue) {
            if (resume.matches(
                    integerProperty(video, "getSeason"),
                    integerProperty(video, "getEpisode"),
                    stringProperty(video, "getId"))) {
                return new ResumeTarget(video, resume.progress);
            }
        }
        return null;
    }

    /**
     * Treats Nuvio's in-place Resume-to-Play transition as an explicit removal of the
     * current Continue Watching session. The cached card payload must not restore Resume
     * if random mode is enabled after that transition.
     */
    private static void invalidateRemovedContinueResume(
            Object nextToWatch, String showKey, HeroContext previous
    ) {
        if (showKey == null || previous == null ||
                !equalString(showKey, previous.showKey) ||
                !isResume(previous.nativeNextToWatch) || isResume(nextToWatch)) return;

        String nextVideoId = stringProperty(nextToWatch, "getNextVideoId");
        String nextEpisodeKey = RandomEpisodeSettings.episodeKey(
                integerProperty(nextToWatch, "getNextSeason"),
                integerProperty(nextToWatch, "getNextEpisode"));
        if (nextVideoId == null && nextEpisodeKey == null) return;

        synchronized (SESSION_LOCK) {
            CONTINUE_RESUMES.remove(showKey);
        }
    }

    private static boolean usableNativeResume(Object nextToWatch, String showKey) {
        if (!isResume(nextToWatch)) return false;
        Integer season = integerProperty(nextToWatch, "getNextSeason");
        Integer episode = integerProperty(nextToWatch, "getNextEpisode");
        String key = RandomEpisodeSettings.episodeKey(season, episode);
        if (showKey == null || key == null) return true;
        Set<String> watched = RandomEpisodeSettings.watchedEpisodes(showKey);
        synchronized (SESSION_LOCK) {
            DetailState detail = DETAIL_STATES.get(showKey);
            if (detail != null) watched.addAll(detail.watched);
        }
        return !watched.contains(key);
    }

    private static Object createNextToWatch(
            Object nativeNextToWatch,
            Object video,
            Object progress,
            boolean resume,
            String verb
    ) {
        try {
            Class<?> nextClass = nativeNextToWatch == null
                    ? Class.forName("com.nuvio.tv.domain.model.NextToWatch")
                    : nativeNextToWatch.getClass();
            Constructor<?> constructor = findNextToWatchConstructor(nextClass);
            String id = stringProperty(video, "getId");
            Integer season = integerProperty(video, "getSeason");
            Integer episode = integerProperty(video, "getEpisode");
            String episodeLabel = episodeLabel(season, episode, true);
            String display = episodeLabel == null ? null : verb + " " + episodeLabel;
            if (id == null || display == null) return nativeNextToWatch;
            return constructor.newInstance(progress, resume, id, season, episode, display);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Unable to expose the selected episode on Play", error);
            return nativeNextToWatch;
        }
    }

    private static Object unwrapContinueItem(Object item) {
        if (item == null) return null;
        Object direct = property(item, "getProgress");
        if (direct == null) direct = property(item, "getInfo");
        if (direct != null) return direct;
        for (Field field : item.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            try {
                field.setAccessible(true);
                Object value = field.get(item);
                if (value == null) continue;
                String type = value.getClass().getName();
                if ("com.nuvio.tv.domain.model.WatchProgress".equals(type) ||
                        String.valueOf(value).startsWith("NextUpInfo(")) return value;
            } catch (ReflectiveOperationException ignored) {
                // Continue to the next captured value.
            }
        }
        return null;
    }

    private static Integer pairInteger(Object pair, boolean first) {
        Object value = property(pair, first ? "getFirst" : "getSecond");
        if (value == null) value = property(pair, first ? "component1" : "component2");
        return value instanceof Number ? ((Number) value).intValue() : null;
    }

    private static String between(String value, String start, String end) {
        int first = value.indexOf(start);
        if (first < 0) return null;
        first += start.length();
        int last = value.indexOf(end, first);
        return last < 0 ? null : value.substring(first, last);
    }

    private static String videoKey(Object video) {
        String id = stringProperty(video, "getId");
        if (id != null && !id.isEmpty()) return id;
        return RandomEpisodeSettings.episodeKey(
                integerProperty(video, "getSeason"), integerProperty(video, "getEpisode"));
    }

    private static boolean containsVideo(List<?> videos, String videoId) {
        if (videos == null || videoId == null) return false;
        for (Object video : videos) {
            if (videoId.equals(stringProperty(video, "getId"))) return true;
        }
        return false;
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
                    parameters[11] != Integer.TYPE || parameters[12] != Integer.TYPE) continue;
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
                    parameters[1] != Integer.TYPE || !parameters[2].isInstance(composer)) continue;
            method.setAccessible(true);
            Object painter = method.invoke(null, context, SHUFFLE_DRAWABLE_ID, composer);
            if (painter != null) return painter;
        }
        throw new NoSuchMethodException("Native detail painter loader");
    }

    private static Object shuffleBadgeIcon() throws Exception {
        Object cached = shuffleBadgeIcon;
        if (cached != null) return cached;
        synchronized (SESSION_LOCK) {
            cached = shuffleBadgeIcon;
            if (cached != null) return cached;
            Class<?> builderClass = Class.forName("h2.e");
            Constructor<?> constructor = builderClass.getDeclaredConstructor(
                    String.class, Float.TYPE, Float.TYPE, Float.TYPE, Float.TYPE,
                    Long.TYPE, Integer.TYPE, Boolean.TYPE, Integer.TYPE);
            constructor.setAccessible(true);
            Object builder = constructor.newInstance(
                    "Material.Shuffle", 24f, 24f, 960f, 960f, 0L, 0, false, 96);
            ArrayList<Object> path = new ArrayList<>(40);
            addVectorPoint(path, "h2.n", 560f, 800f);
            addVectorPoint(path, "h2.m", 560f, 720f);
            addVectorPoint(path, "h2.m", 664f, 720f);
            addVectorPoint(path, "h2.m", 537f, 593f);
            addVectorPoint(path, "h2.m", 594f, 536f);
            addVectorPoint(path, "h2.m", 720f, 662f);
            addVectorPoint(path, "h2.m", 720f, 560f);
            addVectorPoint(path, "h2.m", 800f, 560f);
            addVectorPoint(path, "h2.m", 800f, 800f);
            addVectorPoint(path, "h2.m", 560f, 800f);
            path.add(staticField("h2.j", "c"));
            addVectorPoint(path, "h2.n", 216f, 800f);
            addVectorPoint(path, "h2.m", 160f, 744f);
            addVectorPoint(path, "h2.m", 664f, 240f);
            addVectorPoint(path, "h2.m", 560f, 240f);
            addVectorPoint(path, "h2.m", 560f, 160f);
            addVectorPoint(path, "h2.m", 800f, 160f);
            addVectorPoint(path, "h2.m", 800f, 400f);
            addVectorPoint(path, "h2.m", 720f, 400f);
            addVectorPoint(path, "h2.m", 720f, 296f);
            addVectorPoint(path, "h2.m", 216f, 800f);
            path.add(staticField("h2.j", "c"));
            addVectorPoint(path, "h2.n", 367f, 423f);
            addVectorPoint(path, "h2.m", 160f, 216f);
            addVectorPoint(path, "h2.m", 216f, 160f);
            addVectorPoint(path, "h2.m", 423f, 367f);
            addVectorPoint(path, "h2.m", 367f, 423f);
            path.add(staticField("h2.j", "c"));
            Class<?> brushClass = Class.forName("b2.x0");
            Constructor<?> brushConstructor = brushClass.getDeclaredConstructor(Long.TYPE);
            brushConstructor.setAccessible(true);
            Object brush = brushConstructor.newInstance(longStaticField("b2.y", "b"));
            declaredMethod(builderClass, "a", builderClass, ArrayList.class,
                    Integer.TYPE, brushClass).invoke(null, builder, path, 0, brush);
            cached = declaredMethod(builderClass, "b").invoke(builder);
            shuffleBadgeIcon = cached;
            return cached;
        }
    }

    private static void addVectorPoint(
            ArrayList<Object> path, String className, float x, float y
    ) throws Exception {
        Constructor<?> constructor = Class.forName(className)
                .getDeclaredConstructor(Float.TYPE, Float.TYPE);
        constructor.setAccessible(true);
        path.add(constructor.newInstance(x, y));
    }

    private static String routeVideoId(String route) {
        int query = route.indexOf('?');
        String path = query < 0 ? route : route.substring(0, query);
        String[] parts = path.split("/", -1);
        return parts.length > 1 ? decode(parts[1]) : null;
    }

    private static String queryValue(String route, String requestedKey) {
        int query = route.indexOf('?');
        if (query < 0) return null;
        for (String field : route.substring(query + 1).split("&", -1)) {
            int equals = field.indexOf('=');
            String key = equals < 0 ? field : field.substring(0, equals);
            if (requestedKey.equals(key)) {
                return decode(equals < 0 ? "" : field.substring(equals + 1));
            }
        }
        return null;
    }

    private static Integer queryInteger(String route, String key) {
        String value = queryValue(route, key);
        if (value == null || value.isEmpty()) return null;
        try { return Integer.valueOf(value); }
        catch (NumberFormatException ignored) { return null; }
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

    private static Number numberProperty(Object target, String methodName) {
        Object value = property(target, methodName);
        return value instanceof Number ? (Number) value : null;
    }

    private static boolean isResume(Object nextToWatch) {
        Object value = property(nextToWatch, "getIsResume");
        if (!(value instanceof Boolean)) value = property(nextToWatch, "isResume");
        if (!(value instanceof Boolean) && nextToWatch != null) {
            value = declaredFieldValue(nextToWatch, "isResume");
        }
        return Boolean.TRUE.equals(value);
    }

    private static String episodeLabel(Integer season, Integer episode, boolean spaced) {
        if (season == null || episode == null) return null;
        return "S" + season + (spaced ? " E" : "E") + episode;
    }

    private static boolean equalString(String first, String second) {
        return first == null ? second == null : first.equals(second);
    }

    private static Constructor<?> findNextToWatchConstructor(Class<?> owner)
            throws NoSuchMethodException {
        for (Constructor<?> constructor : owner.getDeclaredConstructors()) {
            Class<?>[] p = constructor.getParameterTypes();
            if (p.length == 6 &&
                    (p[1] == Boolean.TYPE || p[1] == Boolean.class) &&
                    p[2] == String.class && p[3] == Integer.class &&
                    p[4] == Integer.class && p[5] == String.class) {
                constructor.setAccessible(true);
                return constructor;
            }
        }
        throw new NoSuchMethodException(owner.getName() + " NextToWatch constructor");
    }

    private static boolean equalInteger(Integer first, Integer second) {
        return first == null ? second == null : first.equals(second);
    }

    private static Method declaredMethod(
            Class<?> owner, String name, Class<?>... parameterTypes
    ) throws NoSuchMethodException {
        Method method = owner.getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return method;
    }

    private static Object staticField(String className, String name) throws Exception {
        Field field = Class.forName(className).getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private static long longStaticField(String className, String name)
            throws ReflectiveOperationException {
        Field field = Class.forName(className).getDeclaredField(name);
        field.setAccessible(true);
        return field.getLong(null);
    }

    private static long longField(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getLong(target);
    }

    private static void toast(String message) {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(
                () -> Toast.makeText(context, message, Toast.LENGTH_SHORT).show());
    }

    private static void clearPendingLocked() {
        pendingVideo = null;
        pendingVideos = null;
        pendingShowKey = null;
        pendingManualSelection = false;
        pendingFromHome = false;
        manualDialogRendered = false;
    }

    private static void clearHeroSelectionLocked() {
        heroVideo = null;
        heroVideos = null;
        heroShowKey = null;
    }

    private static void clearSessionLocked() {
        clearPendingLocked();
        sessionVideos = null;
        sessionShowKey = null;
        sessionSeason = null;
        sessionEpisode = null;
        randomSessionActive = false;
        nextRandomVideoId = null;
        nextRandomVideo = null;
        nextForCurrentSeason = null;
        nextForCurrentEpisode = null;
        remainingVideoKeys.clear();
    }

    private static final class DetailState {
        final List<?> videos;
        final Set<String> watched;
        DetailState(List<?> videos, Set<String> watched) {
            this.videos = videos;
            this.watched = new HashSet<>(watched);
        }
    }

    private static final class HomeSelection {
        final String showKey;
        final Object video;
        final List<?> videos;
        final Object sourceItem;
        final Object item;

        HomeSelection(
                String showKey, Object video, List<?> videos, Object sourceItem, Object item
        ) {
            this.showKey = showKey;
            this.video = video;
            this.videos = videos;
            this.sourceItem = sourceItem;
            this.item = item;
        }
    }

    private static final class HomeSplitInput {
        final List<?> sourceItems;
        HomeSplitInput(List<?> sourceItems) { this.sourceItems = sourceItems; }
    }

    private static final class HomeSplit {
        final List<?> sourceItems;
        final List<?> continueItems;
        final List<?> upcomingItems;

        HomeSplit(List<?> sourceItems, List<?> continueItems, List<?> upcomingItems) {
            this.sourceItems = sourceItems;
            this.continueItems = continueItems;
            this.upcomingItems = upcomingItems;
        }
    }

    private static final class HomeState {
        final Object state;
        List<?> continueItems;
        List<?> upcomingItems;

        HomeState(Object state, List<?> continueItems, List<?> upcomingItems) {
            this.state = state;
            this.continueItems = continueItems;
            this.upcomingItems = upcomingItems;
        }
    }

    private static final class HomeEpisode {
        private final String id;
        private final String title;
        private final String released;
        private final String thumbnail;
        private final Integer season;
        private final Integer episode;
        private final String overview;
        private final Boolean available;

        HomeEpisode(
                String id, String title, String released, String thumbnail,
                Integer season, Integer episode, String overview, Boolean available
        ) {
            this.id = id;
            this.title = title;
            this.released = released;
            this.thumbnail = thumbnail;
            this.season = season;
            this.episode = episode;
            this.overview = overview;
            this.available = available;
        }

        public String getId() { return id; }
        public String getTitle() { return title; }
        public String getReleased() { return released; }
        public String getThumbnail() { return thumbnail; }
        public Integer getSeason() { return season; }
        public Integer getEpisode() { return episode; }
        public String getOverview() { return overview; }
        public Boolean getAvailable() { return available; }
    }

    private static final class NextContext {
        final List<?> videos;
        final Integer season;
        final Integer episode;
        NextContext(List<?> videos, Integer season, Integer episode) {
            this.videos = videos;
            this.season = season;
            this.episode = episode;
        }
    }

    private static final class ContinueResume {
        final Object progress;
        final String videoId;
        final Integer season;
        final Integer episode;

        ContinueResume(Object progress, String videoId, Integer season, Integer episode) {
            this.progress = progress;
            this.videoId = videoId;
            this.season = season;
            this.episode = episode;
        }

        boolean matches(Integer candidateSeason, Integer candidateEpisode, String candidateVideoId) {
            if (videoId != null && candidateVideoId != null) return videoId.equals(candidateVideoId);
            return equalInteger(season, candidateSeason) && equalInteger(episode, candidateEpisode);
        }
    }

    private static final class NativeNextTarget {
        final String videoId;
        final Integer season;
        final Integer episode;

        NativeNextTarget(String videoId, Integer season, Integer episode) {
            this.videoId = videoId;
            this.season = season;
            this.episode = episode;
        }
    }

    private static final class ResumeTarget {
        final Object video;
        final Object progress;
        ResumeTarget(Object video, Object progress) {
            this.video = video;
            this.progress = progress;
        }
    }

    private static final class HeroContext {
        final Object meta;
        final Object nativeNextToWatch;
        final String showKey;
        final boolean resume;
        final Object resumeVideo;
        final Object resumeProgress;
        final Function0<?> originalOnPlay;
        final Function0<?> onPlay;
        final Function0<?> originalOnPlayLongPress;
        final Function0<?> onPlayLongPress;
        final Function0<?> onFocused;

        HeroContext(
                Object meta,
                Object nativeNextToWatch,
                String showKey,
                boolean resume,
                Object resumeVideo,
                Object resumeProgress,
                Function0<?> originalOnPlay,
                Function0<?> onPlay,
                Function0<?> originalOnPlayLongPress,
                Function0<?> onFocused
        ) {
            this(meta, nativeNextToWatch, showKey, resume, resumeVideo, resumeProgress,
                    originalOnPlay, onPlay, originalOnPlayLongPress,
                    originalOnPlayLongPress, onFocused);
        }

        HeroContext(
                Object meta,
                Object nativeNextToWatch,
                String showKey,
                boolean resume,
                Object resumeVideo,
                Object resumeProgress,
                Function0<?> originalOnPlay,
                Function0<?> onPlay,
                Function0<?> originalOnPlayLongPress,
                Function0<?> onPlayLongPress,
                Function0<?> onFocused
        ) {
            this.meta = meta;
            this.nativeNextToWatch = nativeNextToWatch;
            this.showKey = showKey;
            this.resume = resume;
            this.resumeVideo = resumeVideo;
            this.resumeProgress = resumeProgress;
            this.originalOnPlay = originalOnPlay;
            this.onPlay = onPlay;
            this.originalOnPlayLongPress = originalOnPlayLongPress;
            this.onPlayLongPress = onPlayLongPress;
            this.onFocused = onFocused;
        }
    }

    private static final class PersistentPlayAction implements Function0<Object> {
        private final Object meta;
        private final Function0<?> delegate;
        private final boolean manualSelection;
        private final boolean resume;
        private final Object resumeVideo;

        PersistentPlayAction(
                Object meta,
                Function0<?> delegate,
                boolean manualSelection,
                boolean resume,
                Object resumeVideo
        ) {
            this.meta = meta;
            this.delegate = delegate;
            this.manualSelection = manualSelection;
            this.resume = resume;
            this.resumeVideo = resumeVideo;
        }

        @Override public Object invoke() {
            clearPendingManualSelection();
            String showKey = showKeyForMeta(meta);
            boolean enabled = RandomEpisodeSettings.isEnabled() &&
                    RandomEpisodeSettings.isShowEnabled(showKey);
            if (enabled && resumeVideo != null) {
                dispatchPreparedResume(meta, resumeVideo, delegate, manualSelection);
                return Unit.INSTANCE;
            }
            if (!resume && enabled) {
                dispatchPreparedRandom(meta, delegate, manualSelection);
                return Unit.INSTANCE;
            }
            return delegate.invoke();
        }
    }

    private static final class HomePlayAction implements Function0<Object> {
        private final HomeSelection selection;
        private final Function0<?> delegate;

        HomePlayAction(HomeSelection selection, Function0<?> delegate) {
            this.selection = selection;
            this.delegate = delegate;
        }

        @Override public Object invoke() {
            synchronized (SESSION_LOCK) {
                pendingVideo = selection.video;
                pendingVideos = selection.videos;
                pendingShowKey = selection.showKey;
                pendingManualSelection = false;
                pendingFromHome = true;
                manualDialogRendered = false;
            }
            try {
                return delegate.invoke();
            } finally {
                synchronized (SESSION_LOCK) {
                    if (pendingVideo == selection.video) clearPendingLocked();
                }
            }
        }
    }

    private static final class ToggleShowAction implements Function0<Unit> {
        private final String showKey;
        ToggleShowAction(String showKey) { this.showKey = showKey; }
        @Override public Unit invoke() {
            boolean enabled = RandomEpisodeSettings.toggleShow(showKey);
            HeroContext context = HERO_CONTEXT.get();
            synchronized (SESSION_LOCK) {
                if (!enabled) {
                    prepareNativeHomeSourceLocked(
                            context != null && equalString(context.showKey, showKey)
                                    ? context.meta : null,
                            context != null && equalString(context.showKey, showKey)
                                    ? context.nativeNextToWatch : null,
                            showKey);
                }
                refreshRetainedHomeSplitsLocked(showKey);
                clearPendingLocked();
                if (context != null && equalString(context.showKey, showKey)) {
                    if (enabled && !context.resume) {
                        prepareHeroSelectionLocked(context.meta, showKey, true);
                    } else {
                        clearHeroSelectionLocked();
                    }
                }
            }
            RandomEpisodeRefreshState.invalidate();
            return Unit.INSTANCE;
        }
    }

    private static final class PoolDialogAction implements Function0<Unit> {
        private final String showKey;
        PoolDialogAction(String showKey) { this.showKey = showKey; }
        @Override public Unit invoke() {
            RandomEpisodePoolDialog.show(showKey);
            return Unit.INSTANCE;
        }
    }

    private enum NoOpAction implements Function0<Unit> {
        INSTANCE;
        @Override public Unit invoke() { return Unit.INSTANCE; }
    }
}
