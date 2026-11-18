package nl.johninnl.hln;

import android.content.Context;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Runtime half of the AD Android Auto nieuws patch. The bytecode patch in
 * patches/ad/CarNieuwsPatch.kt resolves every anchor structurally — AD 9.x
 * renames the car browse stack — so this class never addresses a minified
 * name: kept serialization models are used by their surviving names, and the
 * renamed result wrapper and feed-block fields are discovered from the live
 * objects themselves. Every failure path returns the Nieuws tab empty, never
 * the former Start content.
 */
public final class CarNieuws {
    private static final String TAG = "CarNieuws";

    /** Kept kotlinx-serialization models (verified @Keep in AD 9.22.0). */
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
    private static final String CAR_AUDIO_QUEUE =
        "nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue";
    /** Kept @Keep Moshi feed DTO with full getters. */
    private static final String FEED_ITEM =
        "com.popular.core.model.data.AudioBundleTeaserItem";
    private static final String FEED_ITEM_PICTURE =
        "com.popular.core.model.data.Picture";

    /**
     * Browse rows carry a bounded window so a large spoken-news lane cannot
     * overflow the browse transaction; the full queue is restored inside the
     * app when a row is selected.
     */
    static final int QUEUE_WINDOW = 20;
    /** The synthesized Nieuws lane title; also the browse tab title. */
    private static final String TAB_TITLE = "Nieuws";
    /** The car browse route of the replaced start tab. */
    private static final String START_ROUTE = "/start";
    /** Pathological feed bound only; delivery budget is handled per row window. */
    private static final int MAX_ITEMS = 200;
    /** Recent full lanes retained in memory; older ones fall back to disk. */
    private static final int RETAINED_LANES = 4;

    private static volatile Context app;
    private static volatile List<Item> feed = Collections.emptyList();
    /** uid -> original full CarAudioQueue, newest lane generation last. */
    private static final List<Map<String, Object>> playbackQueues = new ArrayList<>();
    /** uid -> durable feed token for process-recreation recovery. */
    private static final Map<String, String> feedIds = new LinkedHashMap<>();
    private static volatile String activeUid;

    /** One spoken headline exactly as the car DTO needs it. */
    static final class Item {
        final String urn;
        final String title;
        final String imageUrl;
        final boolean premium;
        final long durationMs;

        Item(String urn, String title, String imageUrl, boolean premium, long durationMs) {
            this.urn = urn;
            this.title = title;
            this.imageUrl = imageUrl;
            this.premium = premium;
            this.durationMs = durationMs;
        }
    }

    private CarNieuws() {}

    /** Hooked at the start of the media service the car connects to. */
    public static void init(Context context) {
        logInfo("init: service starting", null);
        if (context == null) return;
        Context application = context.getApplicationContext();
        if (application != null) app = application;
    }

    // ---------------------------------------------------------------- feed capture

    /**
     * Hooked where the app's own Moshi adapter returns an audio-bundle block.
     * The block's field names are minified, so its item lists are collected by
     * shape: every public List field whose elements expose the kept feed-item
     * getters. The freshest capture always wins; entries deduplicate by urn.
     */
    public static void rememberAudioBundle(Object block) {
        try {
            if (block == null) return;
            LinkedHashMap<String, Item> byUrn = new LinkedHashMap<String, Item>();
            for (Item existing : feed) byUrn.put(existing.urn, existing);
            int captured = 0;
            for (Field field : block.getClass().getFields()) {
                if (!List.class.isAssignableFrom(field.getType())) continue;
                Object value;
                try {
                    value = field.get(block);
                } catch (Throwable t) {
                    continue;
                }
                if (!(value instanceof List)) continue;
                for (Object element : (List<?>) value) {
                    Item item = fromFeedItem(element);
                    if (item != null && !byUrn.containsKey(item.urn)) {
                        byUrn.put(item.urn, item);
                        captured++;
                    }
                }
            }
            if (captured == 0) return;
            feed = cap(new ArrayList<Item>(byUrn.values()));
            logInfo("feed capture: +" + captured + " items, total " + feed.size(), null);
        } catch (Throwable t) {
            log("feed capture skipped", t);
        }
    }

    /** Maps one kept feed DTO onto a spoken headline row. */
    static Item fromFeedItem(Object element) {
        if (element == null || !FEED_ITEM.equals(element.getClass().getName())) return null;
        try {
            String urn = stringGetter(element, "getUrn");
            String title = stringGetter(element, "getTitle");
            if (urn == null || urn.isEmpty() || title == null || title.isEmpty()) return null;
            Boolean spoken = booleanGetter(element, "getTextToSpeechEnabled");
            if (spoken != null && !spoken.booleanValue()) return null;
            return new Item(urn, title, pictureUrl(element),
                Boolean.TRUE.equals(booleanGetter(element, "getPaidContent")),
                durationMillis(numberGetter(element, "getDuration")));
        } catch (Throwable t) {
            return null;
        }
    }

    private static String pictureUrl(Object element) {
        Object picture = invokeGetter(element, "getPicture");
        if (picture == null || !FEED_ITEM_PICTURE.equals(picture.getClass().getName())) return null;
        // The app's own UI reads the canonical getUrl(); the cropped and
        // domain variants are only fallbacks.
        String url = stringGetter(picture, "getUrl");
        if (url == null || url.isEmpty()) url = stringGetter(picture, "getCroppedUrl");
        if (url == null || url.isEmpty()) url = stringGetter(picture, "getImageDomainUrl");
        return url != null && !url.isEmpty() ? url : null;
    }

    /** Feed durations arrive in seconds; the car DTO wants milliseconds. */
    static long durationMillis(Number duration) {
        if (duration == null) return 0L;
        long value = duration.longValue();
        if (value <= 0L) return 0L;
        return value <= 24L * 60L * 60L ? value * 1000L : value;
    }

    static List<Item> cap(List<Item> items) {
        return items.size() <= MAX_ITEMS ? items : new ArrayList<Item>(items.subList(0, MAX_ITEMS));
    }

    // ---------------------------------------------------------------- start tab

    /**
     * Hooked immediately after the start-tab coroutine constructed its result
     * wrapper. The wrapper type is minified, so it is discovered from the
     * observed object; the tab always renders the Nieuws feed and never the
     * replaced server content.
     */
    public static Object withNieuws(Object result) {
        try {
            logInfo("withNieuws: invoked app=" + (app != null)
                + " result=" + (result == null ? "null" : result.getClass().getSimpleName()), null);
            if (result == null) return null;
            List<Object> content = new ArrayList<Object>();
            Object component = feed.isEmpty() ? null : buildComponent(feed);
            if (!feed.isEmpty() && component == null) feed = Collections.emptyList();
            if (component != null) content.add(component);
            return wrap(result, Class.forName(CAR_TAB_RESPONSE)
                .getConstructor(List.class).newInstance(content));
        } catch (Throwable t) {
            log("start tab left as an empty Nieuws tab", t);
            return emptyTab(result);
        }
    }

    /** A changed DTO contract must fail the browse, never show old Start content. */
    private static Object emptyTab(Object result) {
        try {
            return wrap(result, Class.forName(CAR_TAB_RESPONSE)
                .getConstructor(List.class).newInstance(Collections.emptyList()));
        } catch (Throwable t) {
            log("cannot construct the empty Nieuws tab", t);
            return result;
        }
    }

    /** Re-wraps a new response with the wrapper class observed on the result. */
    private static Object wrap(Object observed, Object response) throws Exception {
        Constructor<?> constructor = singleArgumentConstructor(observed.getClass());
        if (constructor == null) throw new IllegalStateException("No wrapper constructor");
        return constructor.newInstance(response);
    }

    static Constructor<?> singleArgumentConstructor(Class<?> type) {
        Constructor<?> found = null;
        for (Constructor<?> candidate : type.getConstructors()) {
            if (candidate.getParameterTypes().length != 1) continue;
            if (found != null) return null; // ambiguous shape
            found = candidate;
        }
        return found;
    }

    /** The wrapped response, discovered by shape: a no-arg method returning the response type. */
    static Object wrappedValue(Object wrapper) {
        if (wrapper == null) return null;
        try {
            Class<?> response = Class.forName(CAR_TAB_RESPONSE);
            for (Method method : wrapper.getClass().getMethods()) {
                if (method.getParameterCount() == 0 && method.getReturnType() == response) {
                    return method.invoke(wrapper);
                }
            }
        } catch (Throwable t) {
            return null;
        }
        return null;
    }

    // ---------------------------------------------------------------- queue delivery

    /**
     * Hooked at the entry of the playable-row builder with the row's route and
     * the full lane queue. Every row carries only its continuation window; the
     * full queue is retained for the in-app restore.
     */
    public static Object slimQueue(String route, Object queue) {
        try {
            if (route == null || queue == null) return queue;
            List<?> items = itemsOf(queue);
            if (items == null || items.size() <= QUEUE_WINDOW) return queue;
            int self = -1;
            for (int i = 0; i < items.size(); i++) {
                if (route.equals(uidOf(items.get(i)))) { self = i; break; }
            }
            if (self < 0) return queue;
            Object full = queue;
            String token = NewsFeedStore.save(app, jsonOf(full), pinnedUids());
            List<Object> window = new ArrayList<Object>(items.subList(self,
                Math.min(self + QUEUE_WINDOW, items.size())));
            Object windowed = Class.forName(CAR_AUDIO_QUEUE).getConstructor(List.class)
                .newInstance(window);
            synchronized (playbackQueues) {
                Map<String, Object> lane = new LinkedHashMap<String, Object>();
                for (Object item : items) {
                    String uid = uidOf(item);
                    if (uid != null) { lane.put(uid, full); if (token != null) feedIds.put(uid, token); }
                }
                playbackQueues.add(lane);
                while (playbackQueues.size() > RETAINED_LANES) playbackQueues.remove(0);
            }
            logInfo("queue window: row " + route + " carries " + window.size()
                + " of " + items.size() + " items", null);
            return windowed;
        } catch (Throwable t) {
            log("queue windowing skipped; native queue delivered", t);
            return queue;
        }
    }

    /**
     * Hooked right after the car callback decoded the row's browse queue. The
     * selected article is the window's first item; the retained full queue is
     * restored so native next/previous and Up next follow the whole feed.
     */
    public static Object restoreQueue(Object decoded) {
        try {
            if (decoded == null) return decoded;
            List<?> items = itemsOf(decoded);
            if (items == null || items.isEmpty()) return decoded;
            String selected = uidOf(items.get(0));
            if (selected == null) return decoded;
            synchronized (playbackQueues) {
                for (int i = playbackQueues.size() - 1; i >= 0; i--) {
                    Object full = playbackQueues.get(i).get(selected);
                    if (full != null) return full;
                }
            }
            String token;
            synchronized (playbackQueues) { token = feedIds.get(selected); }
            if (token != null && app != null) {
                String json = NewsFeedStore.load(app, token);
                if (json != null) {
                    Object full = decodeQueue(json);
                    if (full != null) {
                        Map<String, Object> lane = new LinkedHashMap<String, Object>();
                        for (Object item : asList(itemsOf(full))) {
                            String uid = uidOf(item);
                            if (uid != null) { lane.put(uid, full); feedIds.put(uid, token); }
                        }
                        synchronized (playbackQueues) {
                            playbackQueues.add(lane);
                            while (playbackQueues.size() > RETAINED_LANES) playbackQueues.remove(0);
                        }
                        return full;
                    }
                }
            }
            return decoded;
        } catch (Throwable t) {
            log("queue restore skipped; windowed queue delivered", t);
            return decoded;
        }
    }

    /**
     * Hooked when the app accepts a queue commit. The current queue's opaque
     * id pins its feed against retention pruning; playback itself is entirely
     * native.
     */
    public static void onQueueChanged(Object current) {
        try {
            if (current == null) return;
            for (Field field : current.getClass().getFields()) {
                if (field.getType() != String.class) continue;
                Object value = field.get(current);
                if (value instanceof String) { activeUid = (String) value; return; }
            }
        } catch (Throwable t) {
            log("queue observation skipped", t);
        }
    }

    private static Set<String> pinnedUids() {
        Set<String> pinned = new HashSet<String>();
        String active = activeUid;
        if (active != null) pinned.add(active);
        synchronized (playbackQueues) { pinned.addAll(feedIds.keySet()); }
        return pinned;
    }

    /**
     * Hooked at the tab builder's return: the Nieuws tab adopts the same
     * presentation as the other news patches — list rows under the tab — by
     * overriding the tab's playable hint to list style. The other tabs keep
     * the app's native grid hints.
     */
    public static void styleTab(Object tab) {
        try {
            Object bundle = bundleOf(tab);
            if (bundle == null) return;
            Object route = bundle.getClass().getMethod("getString", String.class)
                .invoke(bundle, "LIST_ITEM_ROUTE");
            if (!START_ROUTE.equals(route)) return;
            bundle.getClass().getMethod("putInt", String.class, int.class)
                .invoke(bundle, "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT", 1);
        } catch (Throwable t) {
            log("tab styling skipped", t);
        }
    }

    /**
     * Hooked at the row builder: the synthesized lane's group title would
     * render a titled section; the other news patches show the feed's rows
     * directly under the tab, so only the Nieuws lane title we synthesize is
     * dropped; every other lane title passes through untouched.
     */
    public static Object groupTitle(Object groupTitle) {
        try {
            return TAB_TITLE.equals(groupTitle) ? null : groupTitle;
        } catch (Throwable t) {
            return groupTitle;
        }
    }

    /** The first Android bundle exposed by the row object, found by shape. */
    private static Object bundleOf(Object row) {
        if (row == null) return null;
        try {
            Class<?> bundleType = Class.forName("android.os.Bundle");
            for (Field field : row.getClass().getFields()) {
                if (bundleType.isAssignableFrom(field.getType())) return field.get(row);
                Object value = field.get(row);
                if (value == null || field.getType().isPrimitive()) continue;
                for (Field inner : value.getClass().getFields()) {
                    if (bundleType.isAssignableFrom(inner.getType())) {
                        inner.setAccessible(true);
                        return inner.get(value);
                    }
                }
            }
        } catch (Throwable t) {
            return null;
        }
        return null;
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
                    image, "", "", 0L,
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

    // ---------------------------------------------------------------- reflective helpers

    private static List<?> itemsOf(Object queue) {
        Object items = queue == null ? null : invokeGetter(queue, "getItems");
        return items instanceof List ? (List<?>) items : null;
    }

    private static List<Object> asList(Object value) {
        if (!(value instanceof List)) return Collections.emptyList();
        @SuppressWarnings("unchecked")
        List<Object> list = (List<Object>) value;
        return list;
    }

    private static String jsonOf(Object queue) {
        Object json = queue == null ? null : invokeGetter(queue, "toJsonString");
        return json instanceof String ? (String) json : null;
    }

    private static Object decodeQueue(String json) {
        try {
            Object companion = Class.forName(CAR_AUDIO_QUEUE).getField("Companion").get(null);
            return companion.getClass().getMethod("fromJsonString", String.class).invoke(companion, json);
        } catch (Throwable t) {
            return null;
        }
    }

    /** The native queue-item id: the verified backing field, with getter fallbacks. */
    static String uidOf(Object target) {
        if (target == null) return null;
        try {
            Field field = target.getClass().getDeclaredField("queueUid");
            field.setAccessible(true);
            Object value = field.get(target);
            return value instanceof String ? (String) value : null;
        } catch (Throwable t) {
            Object value = invokeGetter(target, "getQueueUid");
            return value instanceof String ? (String) value : null;
        }
    }

    private static Object invokeGetter(Object target, String name) {
        if (target == null) return null;
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

    private static Boolean booleanGetter(Object target, String name) {
        Object value = invokeGetter(target, name);
        return value instanceof Boolean ? (Boolean) value : null;
    }

    private static Number numberGetter(Object target, String name) {
        Object value = invokeGetter(target, name);
        return value instanceof Number ? (Number) value : null;
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
