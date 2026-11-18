package nl.johninnl.demorgen;

import android.content.Context;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Runtime half of the Android Auto nieuws patch. The bytecode patch in
 * patches/volkskrant/CarNieuwsPatch.kt calls {@link #init(Context)} from the
 * audio service and {@link #withNieuws(Object)} right after the car start-tab
 * response is wrapped in AmaliaResult.Success. This class fetches the app's own
 * home overview page through the existing Hilt repository, converts every
 * article that the publisher supplies spoken audio for into the car SDK's
 * spoken_article row format, and replaces the start-tab with one Nieuws component.
 * Rendering, queue building, playback, entitlement and premium
 * handling all stay in the app's unmodified Amalia car pipeline.
 *
 * App-specific types are reached reflectively using the verified APK contracts.
 * A failed feed request leaves an empty news tab, never the old Start content.
 */
public final class CarNieuws {
    private static final String TAG = "CarNieuws";

    private static final String AMALIA_RESULT_SUCCESS =
        "nl.dpgmedia.mcdpg.amalia.util.kotlin.result.AmaliaResult$Success";
    private static final String CAR_TAB_RESPONSE =
        "nl.dpgmedia.mcdpg.amalia.car.data.model.dto.CarTabSdUiResponse";
    private static final String CAR_TAB_COMPONENT = CAR_TAB_RESPONSE + "$Component";
    private static final String AUDIO_ITEM_RESPONSE =
        "nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AudioItemContentResponse";
    private static final String IMAGE_DTO = "nl.dpgmedia.mcdpg.amalia.model.ImageDto";
    private static final String PODCAST_SHOW =
        "nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AmaliaPodcastShow";
    private static final String TTS_DISCLAIMER =
        "nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AmaliaTtsDisclaimerResponse";
    private static final String VODCAST = AUDIO_ITEM_RESPONSE + "$Vodcast";
    private static final String OVERVIEW_REPOSITORY =
        "nl.persgroep.edition.overview.data.OverviewPageRepositoryImpl";
    private static final String OVERVIEW_TOP_NONE =
        "nl.persgroep.edition.overview.domain.model.OverviewTopComponent$None";
    private static final String OVERVIEW_TOP =
        "nl.persgroep.edition.overview.domain.model.OverviewTopComponent";
    private static final String RESULT_OF_SUCCESS = "nl.persgroep.domain.base.ResultOf$Success";
    private static final String OVERVIEW_GROUP =
        "nl.persgroep.edition.overview.domain.model.OverviewPageComponent$Group";

    /** Home overview path used by the phone app's feed screen. */
    private static final String HOME_PATH = "/";
    /** Keep recent browse generations playable after a feed refresh. Each map
     * holds UID references to the original native queues, not copies per row. */
    private static final int RETAINED_LANES = 4;
    private static final List<Map<String, Object>> playbackQueues = new ArrayList<>();
    private static final Map<String, Object> browseItems = new LinkedHashMap<>();
    private static final Map<String, String> feedIds = new LinkedHashMap<>();
    private static final String FEED_ID = "nl.johninnl.demorgen.NEWS_FEED";
    private static final String CAR_AUDIO_QUEUE = "nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue";
    private static volatile Object activeNewsQueue;
    private static volatile Set<String> activeNewsUids = Collections.emptySet();
    private static volatile String activeFeedId;
    private static volatile Object selectedNewsQueue;
    private static volatile Set<String> selectedNewsUids = Collections.emptySet();
    private static volatile String selectedFeedId;
    /** Reuse a fetched feed within this window so repeated browses are instant. */
    private static final long CACHE_MS = 90_000L;
    /** After a failed fetch wait this long before trying again. */
    private static final long FAILURE_BACKOFF_MS = 20_000L;
    /** Bounded wait for the overview request; the caller's browse stays responsive. */
    private static final long FETCH_TIMEOUT_MS = 6_000L;

    private static volatile Context app;
    private static volatile List<Item> cache = Collections.emptyList();
    private static volatile long cacheAt = 0L;
    private static volatile long failedAt = 0L;

    /** One spoken headline exactly as the car DTO needs it. */
    static final class Item {
        final String urn;
        final String title;
        final String imageUrl;
        final boolean premium;
        final long durationMs;
        final long publishedAtMs;

        Item(String urn, String title, String imageUrl, boolean premium, long durationMs, long publishedAtMs) {
            this.urn = urn;
            this.title = title;
            this.imageUrl = imageUrl;
            this.premium = premium;
            this.durationMs = durationMs;
            this.publishedAtMs = publishedAtMs;
        }
    }

    private CarNieuws() {}

    /** Hooked at the start of AmaliaAudioPlayerService.onCreate. */
    public static void init(Context context) {
        logInfo("init: service starting", null);
        if (context == null) return;
        Context application = context.getApplicationContext();
        if (application != null) app = application;
    }

    /**
     * Hooked right after the first tab MediaItem is built: makes its playable
     * children render as list rows (title prominent, small leading artwork)
     * instead of the podcast grid the server tab uses.
     */
    public static void styleTab(Object mediaItem) {
        try {
            Object metadata = member(mediaItem, "mediaMetadata", "getMediaMetadata");
            Object extras = metadata == null ? null : member(metadata, "extras", "getExtras");
            if (extras instanceof android.os.Bundle) {
                android.os.Bundle bundle = (android.os.Bundle) extras;
                bundle.putInt("android.media.browse.CONTENT_STYLE_PLAYABLE_HINT", 1);
                logInfo("styleTab: playable hint set, browsable now " + bundle.getInt("android.media.browse.CONTENT_STYLE_BROWSABLE_HINT"), null);
            } else {
                logInfo("styleTab: no extras bundle on " + (mediaItem == null ? "null" : mediaItem.getClass().getName()), null);
            }
        } catch (Throwable t) {
            log("tab styling skipped", t);
        }
    }

    /** media3 exposes MediaItem.mediaMetadata and MediaMetadata.extras as fields, not getters. */
    private static Object member(Object target, String field, String getter) {
        if (target == null) return null;
        try {
            return target.getClass().getMethod(getter).invoke(target);
        } catch (Throwable t) {
            try {
                return target.getClass().getField(field).get(target);
            } catch (Throwable t2) {
                return null;
            }
        }
    }

    /**
     * Hooked immediately after the start-tab lambda constructed
     * AmaliaResult.Success. The tab always renders the Nieuws feed: the
     * synthesized component on success, or an empty component list when the
     * feed is unavailable. Server content is never shown in this tab.
     */
    public static Object withNieuws(Object result) {
        if (result == null || !AMALIA_RESULT_SUCCESS.equals(result.getClass().getName())) return result;
        final Object empty;
        try {
            empty = success(withOnlyComponent(null));
        } catch (Exception e) {
            // A changed DTO contract must fail the browse request, never leak
            // the server's non-news response into the Nieuws tab.
            throw new IllegalStateException("Cannot construct the Nieuws tab", e);
        }
        try {
            List<Item> items = currentItems();
            if (items.isEmpty()) return empty;
            Object component = buildComponent(items);
            return component == null ? empty : success(withOnlyComponent(component));
        } catch (Throwable t) {
            log("news unavailable; showing an empty tab", t);
            return empty;
        }
    }

    /** Cache-bounded feed access shared by every start-tab response. */
    static synchronized List<Item> currentItems() {
        long now = System.nanoTime();
        List<Item> cached = cache;
        if (!cached.isEmpty() && now - cacheAt < TimeUnit.MILLISECONDS.toNanos(CACHE_MS)) return cached;
        if (failedAt != 0L && now - failedAt < TimeUnit.MILLISECONDS.toNanos(FAILURE_BACKOFF_MS)) return cached;
        try {
            List<Item> fresh = collectItems();
            if (fresh.isEmpty()) {
                failedAt = now;
                return cached;
            }
            cache = fresh;
            cacheAt = System.nanoTime();
            failedAt = 0L;
            return fresh;
        } catch (Throwable t) {
            failedAt = now;
            log("feed unavailable", t);
            return cached;
        }
    }

    private static List<Item> collectItems() throws Exception {
        Object page = fetchOverviewPage(HOME_PATH);
        List<Item> items = page == null ? Collections.<Item>emptyList() : overviewItems(page);
        logInfo("home feed: page=" + (page == null ? "null" : describe(page)) + " items=" + items.size(), null);
        return items;
    }

    /** Short structural summary of a fetched page so stale or wrong paths are visible in logs. */
    private static String describe(Object page) {
        try {
            Object components = invokeGetter(page, "getPageComponents");
            int groups = 0, total = 0;
            for (Object component : asIterable(components)) {
                total++;
                if (component != null && OVERVIEW_GROUP.equals(component.getClass().getName())) groups++;
            }
            String path = stringGetter(page, "getUrlPath");
            return "components=" + total + "/groups=" + groups + "/path=" + path;
        } catch (Throwable t) {
            return "?";
        }
    }

    // ---------------------------------------------------------------- Hilt access

    /** The Hilt singleton component behind the running application, or null. */
    private static Object generatedComponent() {
        Context context = app;
        if (context == null) return null;
        try {
            return context.getClass().getMethod("generatedComponent").invoke(context);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object fetchOverviewPage(String path) throws Exception {
        Object component = generatedComponent();
        if (component == null) {
            logInfo("hilt component unavailable", null);
            return null;
        }
        Object repository;
        try {
            repository = component.getClass().getMethod("overviewPageRepositoryImpl").invoke(component);
        } catch (Throwable t) {
            logInfo("overview repository unavailable", t);
            return null;
        }
        if (repository == null || !OVERVIEW_REPOSITORY.equals(repository.getClass().getName())) {
            logInfo("overview repository unexpected: " + (repository == null ? "null" : repository.getClass().getName()), null);
            return null;
        }
        Object none = Class.forName(OVERVIEW_TOP_NONE).getField("INSTANCE").get(null);
        Method get = repository.getClass().getMethod("getOverviewPage",
            String.class, Class.forName(OVERVIEW_TOP), Class.forName("kotlin.coroutines.Continuation"));
        Object outcome;
        try {
            outcome = invokeSuspend(get, repository, new Object[]{path, none, null}, FETCH_TIMEOUT_MS);
        } catch (Throwable t) {
            logInfo("overview fetch failed for " + path, t);
            return null;
        }
        if (outcome == null) {
            logInfo("overview fetch returned null outcome", null);
            return null;
        }
        if (!RESULT_OF_SUCCESS.equals(outcome.getClass().getName())) {
            logInfo("overview fetch outcome: " + outcome.getClass().getName(), null);
            return null;
        }
        return outcome.getClass().getMethod("getValue").invoke(outcome);
    }

    /**
     * Calls a suspend function through a latch continuation. Handles both the
     * direct-completion and suspension paths without compile-time Kotlin
     * dependencies; without Kotlin on the classpath (JVM tests) only the
     * direct-completion path works.
     */
    static Object invokeSuspend(Method method, Object target, Object[] args, long timeoutMs) throws Exception {
        LatchContinuation latch = newLatchContinuation();
        args[args.length - 1] = latch != null ? latch.proxy() : null;
        Object direct = method.invoke(target, args);
        if (latch == null) return direct;
        if (direct != null && !isSuspended(direct)) return direct;
        if (!latch.await(timeoutMs)) throw new IllegalStateException("overview fetch timed out");
        if (latch.failure != null) throw asException(latch.failure);
        return latch.value;
    }

    /** COROUTINE_SUSPENDED detection without depending on its accessor surviving optimization. */
    private static volatile Object suspendedMarkerCache;

    private static boolean isSuspended(Object candidate) {
        Object marker = suspendedMarkerCache;
        if (marker == null) {
            try {
                marker = Class.forName("kotlin.coroutines.intrinsics.IntrinsicsKt")
                    .getMethod("getCOROUTINE_SUSPENDED").invoke(null);
            } catch (Throwable t) {
                marker = Boolean.FALSE; // never a real suspend-method result
            }
            suspendedMarkerCache = marker;
        }
        return candidate == marker
            || "kotlin.coroutines.intrinsics.CoroutineSingletons".equals(candidate.getClass().getName());
    }

    private static final class LatchContinuation {
        final CountDownLatch done = new CountDownLatch(1);
        volatile Object value;
        volatile Throwable failure;
        final Object emptyContext;
        final Class<?> continuationInterface;

        LatchContinuation(Object emptyContext, Class<?> continuationInterface) {
            this.emptyContext = emptyContext;
            this.continuationInterface = continuationInterface;
        }

        Object proxy() {
            return Proxy.newProxyInstance(CarNieuws.class.getClassLoader(),
                new Class<?>[]{continuationInterface}, (proxy, method, a) -> {
                    switch (method.getName()) {
                    case "getContext": return emptyContext;
                    case "resumeWith":
                        Object result = a[0];
                        if (result != null && "kotlin.Result$Failure".equals(result.getClass().getName())) {
                            try {
                                failure = (Throwable) result.getClass().getField("exception").get(result);
                            } catch (Throwable t) {
                                failure = t;
                            }
                        } else {
                            value = result;
                        }
                        done.countDown();
                        return null;
                    case "equals": return proxy == a[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    case "toString": return "CarNieuwsContinuation";
                    default: return null;
                    }
                });
        }

        boolean await(long timeoutMs) throws InterruptedException {
            return done.await(timeoutMs, TimeUnit.MILLISECONDS);
        }
    }

    /** Resolves the Kotlin continuation machinery lazily; null in JVM unit tests. */
    private static LatchContinuation newLatchContinuation() {
        try {
            Class<?> continuation = Class.forName("kotlin.coroutines.Continuation");
            Object empty = Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
            return new LatchContinuation(empty, continuation);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Hooked over the result of CarMediaItemQueueMapper.toLaneItemQueues inside
     * fromUiDto: the app attaches the full lane queue to every row, which makes
     * a large spoken-news lane exceed Media3's 256 KiB legacy browse budget.
     * Browse rows carry only their selected item. The full native queue is
     * restored at readLaneQueue, before the existing player consumes it.
     */
    public static Object slimQueues(Object laneQueues) {
        try {
            if (!(laneQueues instanceof List)) return laneQueues;
            List<?> queues = (List<?>) laneQueues;
            if (!isArticleLane(queues)) return laneQueues;

            Class<?> audioQueueClass = Class.forName("nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue");
            Constructor<?> audioCtor = audioQueueClass.getConstructor(List.class);
            Constructor<?> laneCtor = Class.forName("nl.dpgmedia.mcdpg.amalia.car.ui.mediaitem.CarLaneItemQueue")
                .getDeclaredConstructor(audioQueueClass, String.class);
            laneCtor.setAccessible(true);

            Map<String, Object> retained = new LinkedHashMap<>();
            Map<Object, String> stored = new IdentityHashMap<>();
            Map<String, String> tokens = new LinkedHashMap<>();
            List<Object> result = new ArrayList<Object>(queues.size());
            for (Object laneQueue : queues) {
                if (laneQueue == null) { result.add(null); continue; }
                Object full = member(laneQueue, "queue", "getQueue");
                Object itemsObject = full == null ? null : invokeGetter(full, "getItems");
                if (!(itemsObject instanceof List)) { result.add(laneQueue); continue; }
                List<?> items = (List<?>) itemsObject;
                String uid = uidOf(laneQueue);
                int self = -1;
                for (int j = 0; j < items.size(); j++) {
                    if (uid != null && uid.equals(uidOf(items.get(j)))) { self = j; break; }
                }
                if (self < 0) throw new IllegalStateException("Missing article queue UID");
                Object compact = audioCtor.newInstance(Collections.singletonList(items.get(self)));
                result.add(laneCtor.newInstance(compact, uid));
                retained.put(uid, full);
                if (!stored.containsKey(full)) {
                    Set<String> pinned = new HashSet<>();
                    if (activeFeedId != null) pinned.add(activeFeedId);
                    if (selectedFeedId != null) pinned.add(selectedFeedId);
                    Object json = invokeGetter(full, "toJsonString");
                    stored.put(full, NewsFeedStore.save(app, json instanceof String ? (String) json : null, pinned));
                }
                String token = stored.get(full);
                if (token != null) tokens.put(uid, token);
            }
            if (!retained.isEmpty()) {
                synchronized (playbackQueues) {
                    playbackQueues.add(retained);
                    feedIds.putAll(tokens);
                    if (playbackQueues.size() > RETAINED_LANES) {
                        playbackQueues.remove(0);
                    }
                    trimBrowseItems();
                }
            }
            return result;
        } catch (Throwable t) {
            log("queue slimming skipped", t);
            return laneQueues;
        }
    }

    /** In-memory restoration; unmarked queues from other native routes pass through. */
    public static Object restoreQueue(Object queue) {
        Object itemsObject = invokeGetter(queue, "getItems");
        if (!(itemsObject instanceof List)) return queue;
        List<?> items = (List<?>) itemsObject;
        if (items.size() != 1) return queue;
        String uid = uidOf(items.get(0));
        synchronized (playbackQueues) {
            for (int i = playbackQueues.size() - 1; i >= 0; i--) {
                Object original = playbackQueues.get(i).get(uid);
                if (original != null) {
                    selectNewsQueue(original, feedIds.get(uid));
                    return original;
                }
            }
            // Browsing a fresh feed must not evict the sequence currently being
            // listened to or turn a retained queue row into single playback.
            if (activeNewsUids.contains(uid) && activeNewsQueue != null) return activeNewsQueue;
            if (selectedNewsUids.contains(uid) && selectedNewsQueue != null) return selectedNewsQueue;
        }
        return queue;
    }

    private static void selectNewsQueue(Object queue, String token) {
        Set<String> uids = new HashSet<>();
        for (Object item : asIterable(invokeGetter(queue, "getItems"))) {
            String uid = uidOf(item);
            if (uid != null) uids.add(uid);
        }
        selectedNewsQueue = queue;
        selectedNewsUids = Collections.unmodifiableSet(uids);
        selectedFeedId = token;
        trimBrowseItems();
    }

    /** Activate only the sequence the native player actually accepted. */
    static void acceptNewsQueue(String currentUid, List<String> acceptedUids) {
        synchronized (playbackQueues) {
            Object source = selectedNewsUids.contains(currentUid) ? selectedNewsQueue
                : activeNewsUids.contains(currentUid) ? activeNewsQueue : null;
            if (source == null) {
                for (Map<String, Object> lane : playbackQueues) {
                    if (lane.containsKey(currentUid)) { source = lane.get(currentUid); break; }
                }
            }
            if (source == null) return;
            activeNewsQueue = source;
            activeNewsUids = Collections.unmodifiableSet(new HashSet<>(acceptedUids));
            activeFeedId = source == selectedNewsQueue ? selectedFeedId : feedIds.get(currentUid);
            trimBrowseItems();
        }
    }

    private static void trimBrowseItems() {
        Set<String> retained = new HashSet<>(activeNewsUids);
        retained.addAll(selectedNewsUids);
        for (Map<String, Object> lane : playbackQueues) retained.addAll(lane.keySet());
        browseItems.keySet().retainAll(retained);
        feedIds.keySet().retainAll(retained);
    }

    /** Same native decoder, with a compact durable feed reference for news rows. */
    public static Object readQueue(android.os.Bundle extras) {
        if (extras == null) return null;
        String json = extras.getString("LANE_QUEUE_ITEMS");
        if (json == null) return null;
        Object compact = decodeQueue(json);
        Object restored = restoreQueue(compact);
        String token = extras.getString(FEED_ID);
        if (token != null && restored == compact) {
            String fullJson = NewsFeedStore.load(app, token);
            Object full = fullJson == null ? null : decodeQueue(fullJson);
            Object items = invokeGetter(compact, "getItems");
            String uid = items instanceof List && ((List<?>) items).size() == 1
                ? uidOf(((List<?>) items).get(0)) : null;
            Map<String, Object> recovered = new LinkedHashMap<>();
            for (Object item : asIterable(invokeGetter(full, "getItems"))) {
                String itemUid = uidOf(item);
                if (itemUid != null) recovered.put(itemUid, full);
            }
            if (uid == null || !recovered.containsKey(uid)) throw expiredFeed();
            synchronized (playbackQueues) {
                playbackQueues.add(recovered);
                if (playbackQueues.size() > RETAINED_LANES) playbackQueues.remove(0);
                for (String itemUid : recovered.keySet()) feedIds.put(itemUid, token);
                selectNewsQueue(full, token);
            }
            return full;
        }
        // Rows cached by an older patch have no token. Never silently play only
        // that article when its old news context is no longer recoverable.
        if (restored == compact && token == null
                && "Nieuws".equals(extras.getString("android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT"))) {
            Object items = invokeGetter(compact, "getItems");
            if (items instanceof List && ((List<?>) items).size() == 1) throw expiredFeed();
        }
        return restored;
    }

    private static IllegalStateException expiredFeed() {
        return new IllegalStateException("Nieuws-feed is niet meer beschikbaar. Open Nieuws opnieuw.");
    }

    private static Object decodeQueue(String json) {
        try {
            Object companion = Class.forName(CAR_AUDIO_QUEUE).getField("Companion").get(null);
            return companion.getClass().getMethod("fromJsonString", String.class).invoke(companion, json);
        } catch (java.lang.reflect.InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException(cause);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Cannot decode the native news queue", e);
        }
    }

    /** Preserve the original opaque ID, tracking and compact playback extras. */
    public static void rememberBrowseItem(Object item) {
        Object value = member(item, "mediaId", "getMediaId");
        if (!(value instanceof String)) return;
        String uid = (String) value;
        synchronized (playbackQueues) {
            for (Map<String, Object> lane : playbackQueues) {
                if (lane.containsKey(uid)) {
                    String token = feedIds.get(uid);
                    Object metadata = member(item, "mediaMetadata", "getMediaMetadata");
                    Object extras = member(metadata, "extras", "getExtras");
                    if (token != null && extras instanceof android.os.Bundle) {
                        ((android.os.Bundle) extras).putString(FEED_ID, token);
                    }
                    browseItems.put(uid, item);
                    return;
                }
            }
        }
    }

    static Object browseItem(String uid) {
        synchronized (playbackQueues) {
            return browseItems.get(uid);
        }
    }

    static boolean isNewsUid(String uid) {
        return uid != null && activeNewsUids.contains(uid);
    }

    private static boolean isArticleLane(List<?> queues) {
        for (Object laneQueue : queues) {
            Object queue = laneQueue == null ? null : member(laneQueue, "queue", "getQueue");
            Object items = queue == null ? null : invokeGetter(queue, "getItems");
            for (Object item : asIterable(items)) {
                Object type = item == null ? null : invokeGetter(item, "getType");
                if (type != null && "Article".equals(nameOf(type))) return true;
            }
        }
        return false;
    }

    private static String uidOf(Object target) {
        if (target == null) return null;
        try {
            // Kotlin's actual getter is getQueueUid-EU6Fzmo. JADX's m6831...
            // spelling is not a runtime method. Both native models expose this
            // verified backing field, which also avoids a decompiler alias.
            Field field = target.getClass().getDeclaredField("queueUid");
            field.setAccessible(true);
            return (String) field.get(target);
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }

    private static String nameOf(Object value) {
        try {
            return (String) value.getClass().getMethod("name").invoke(value);
        } catch (Throwable t) {
            return String.valueOf(value);
        }
    }

    private static Exception asException(Throwable t) {
        return t instanceof Exception ? (Exception) t : new IllegalStateException(t);
    }

    // ---------------------------------------------------------------- feed walk

    /**
     * Walks an OverviewPage the same way the phone feed does: every group's
     * blocks expose lists of content items, and each item may carry a
     * text-to-speech object. Articles repeated across blocks keep their first
     * position.
     */
    static List<Item> overviewItems(Object page) {
        Map<String, Item> byUrn = new LinkedHashMap<String, Item>();
        Object components = invokeGetter(page, "getPageComponents");
        for (Object component : asIterable(components)) {
            if (component == null || !OVERVIEW_GROUP.equals(component.getClass().getName())) continue;
            Object blocks = invokeGetter(component, "getBlocks");
            for (Object block : asIterable(blocks)) {
                if (block != null) collectFromBlock(block, byUrn);
            }
        }
        return new ArrayList<Item>(byUrn.values());
    }

    /** Scans a block's public list getters for elements exposing getTextToSpeech(). */
    private static void collectFromBlock(Object block, Map<String, Item> byUrn) {
        Set<String> seenGetters = new HashSet<String>();
        for (Method method : block.getClass().getMethods()) {
            if (method.getParameterCount() != 0) continue;
            if (!List.class.isAssignableFrom(method.getReturnType())) continue;
            if (method.getDeclaringClass() == Object.class) continue;
            if (!seenGetters.add(method.getName() + method.getReturnType().getName())) continue;
            Object value;
            try {
                value = method.invoke(block);
            } catch (Throwable t) {
                continue;
            }
            for (Object element : asIterable(value)) {
                if (element == null) continue;
                Object tts;
                try {
                    tts = element.getClass().getMethod("getTextToSpeech").invoke(element);
                } catch (Throwable t) {
                    continue;
                }
                if (tts == null) continue;
                Item item = fromTts(tts, publicationMillis(element));
                if (item != null && !byUrn.containsKey(item.urn)) byUrn.put(item.urn, item);
            }
        }
    }

    /** Maps one OverviewContentTextToSpeech onto a spoken headline row. */
    static Item fromTts(Object tts, long publishedAtMs) {
        if (tts == null) return null;
        try {
            String urn = stringGetter(tts, "getArticleUrn");
            String title = stringGetter(tts, "getTitle");
            if (urn == null || urn.isEmpty() || title == null || title.isEmpty()) return null;
            return new Item(urn, title, stringGetter(tts, "getImageUrl"),
                booleanGetter(tts), longGetter(tts, "getDurationMs"), publishedAtMs);
        } catch (Throwable t) {
            return null;
        }
    }

    private static long publicationMillis(Object contentItem) {
        try {
            Object dateTime = invokeGetter(contentItem, "getPublicationDateTime");
            if (dateTime == null) return 0L;
            Object instant = dateTime.getClass().getMethod("toInstant").invoke(dateTime);
            return (Long) instant.getClass().getMethod("toEpochMilli").invoke(instant);
        } catch (Throwable t) {
            return 0L;
        }
    }

    private static Object invokeGetter(Object target, String name) {
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String stringGetter(Object target, String name) {
        Object value = invokeGetter(target, name);
        return value instanceof String ? (String) value : null;
    }

    private static boolean booleanGetter(Object target) {
        Object value = invokeGetter(target, "getIsPremium");
        if (value == null) value = invokeGetter(target, "isPremium");
        return value instanceof Boolean && (Boolean) value;
    }

    private static long longGetter(Object target, String name) {
        Object value = invokeGetter(target, name);
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    // ---------------------------------------------------------------- car DTOs

    /** Builds the synthesized CarTabSdUiResponse component for the feed. */
    static Object buildComponent(List<Item> items) {
        try {
            Constructor<?> imageCtor = Class.forName(IMAGE_DTO)
                .getConstructor(String.class, String.class, String.class, Map.class);
            Class<?> show = Class.forName(PODCAST_SHOW);
            Class<?> disclaimer = Class.forName(TTS_DISCLAIMER);
            Class<?> vodcast = Class.forName(VODCAST);
            Constructor<?> itemCtor = Class.forName(AUDIO_ITEM_RESPONSE).getConstructor(
                String.class, String.class, String.class, long.class,
                Integer.class, Integer.class, String.class, Boolean.class, String.class,
                Class.forName(IMAGE_DTO), String.class, String.class, long.class,
                String.class, String.class, show, String.class, disclaimer,
                String.class, vodcast, List.class);
            List<Object> content = new ArrayList<Object>(items.size());
            for (Item item : items) {
                Object image = null;
                if (item.imageUrl != null && !item.imageUrl.isEmpty()) {
                    try {
                        image = imageCtor.newInstance("", "", item.imageUrl, Collections.emptyMap());
                    } catch (Throwable t) {
                        image = null;
                    }
                }
                content.add(itemCtor.newInstance(
                    "", "", "", item.durationMs,
                    null, null, "", Boolean.FALSE, "",
                    image, "", "", item.publishedAtMs,
                    item.title, "spoken_article", null,
                    item.premium ? "PAYWALL" : "FREE", null, item.urn, null,
                    Collections.emptyList()));
            }
            return Class.forName(CAR_TAB_COMPONENT)
                .getConstructor(String.class, List.class, Integer.class, String.class)
                .newInstance("Playlist", content, null, "Nieuws");
        } catch (Throwable t) {
            log("component synthesis failed", t);
            return null;
        }
    }

    /** The start tab renders only the Nieuws feed; a null component yields an empty tab. */
    static Object withOnlyComponent(Object component) throws Exception {
        List<Object> components = new ArrayList<Object>();
        if (component != null) components.add(component);
        return Class.forName(CAR_TAB_RESPONSE).getConstructor(List.class).newInstance(components);
    }

    private static Object success(Object value) throws Exception {
        return Class.forName(AMALIA_RESULT_SUCCESS).getConstructor(Object.class).newInstance(value);
    }

    // ---------------------------------------------------------------- utilities

    private static Iterable<Object> asIterable(Object value) {
        if (!(value instanceof List)) return Collections.emptyList();
        @SuppressWarnings("unchecked")
        List<Object> list = (List<Object>) value;
        return list;
    }

    private static void log(String message, Throwable t) {
        try {
            android.util.Log.w(TAG, message, t);
        } catch (Throwable ignored) {
            // JVM unit tests run without android.util.Log.
        }
    }

    private static void logInfo(String message, Throwable t) {
        log(message, t);
    }
}
