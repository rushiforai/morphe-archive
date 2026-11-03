package app.tikkamasalla.stremio.introskip;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Version-independent playback state for the Compose builds (TV 1.10.x / 1.12.x, phone 2.x).
 *
 * Fed by these patch hooks (see PortFingerprints.kt):
 *  - onCoreDispatch: every action the UI sends to stremio-core (Core.dispatch). Only the
 *    generated protobuf getters of com.stremio.core are used; they keep their names in every
 *    build because the library is JNI-bound.
 *  - onPlayerState: the decoded core Player model (PlayerKt.decodeWithImpl): meta type and title,
 *    episode title, next video.
 *  - onStremioPlayer: every construction of the app's own player (Exo / LibVLC / MPV /
 *    YouTube). Seek, time, duration and isPlaying go through stub methods whose bodies the patch
 *    generates against the resolved (possibly obfuscated) player interface.
 *  - wrapPlayerScreen: PlayerFragment's view, wrapped in a FrameLayout that anchors the skip session.
 *  - onMainActivity: MainActivity.onCreate.
 *
 * No Media3 type is referenced here, so this class loads on builds where Media3 is renamed.
 */
public final class PortHooks {
    private static final String TAG = "IntroSkipPort";

    private static volatile WeakReference<Object> player = new WeakReference<>(null);
    private static volatile WeakReference<Activity> activity = new WeakReference<>(null);
    private static volatile WeakReference<View> host = new WeakReference<>(null);
    private static volatile WeakReference<View> offeredHost = new WeakReference<>(null);
    private static volatile WeakReference<Object> offeredPlayer = new WeakReference<>(null);
    private static volatile boolean debugOn;
    private static volatile boolean patchDebug;

    // Stream identity from ActionLoad.Player(Selected); cleared by Unload.
    private static volatile boolean loaded;
    private static volatile String streamType = "";
    private static volatile String streamId = "";
    private static volatile String streamUrl = "";
    private static volatile long loadedAtMs;

    // From the decoded Player model (meta type/title, current and next video).
    private static volatile String metaType = "";
    private static volatile String metaTitle = "";
    private static volatile String videoTitle = "";
    private static volatile String nextVideoId = "";
    private static volatile String nextVideoLink = "";
    private static volatile String streamTransport = "";
    private static volatile String metaTransport = "";
    // Kept past Unload (an external player launch unloads the core player) and per video id: ExternalProgress
    // reads them when mpv/VLC return a bare end-of-file result without a duration (Compose builds).
    private static volatile String[] keptRuntime; // {video id, runtime text}: one volatile, no torn read
    private static volatile String keptNextFor = "";

    // Last time report from ActionPlayer.TimeChanged / SeekAction (throttled to ~3 s by the app).
    private static volatile long coreTimeMs = -1;
    private static volatile long coreDurationMs = -1;
    private static volatile long coreAtMs;
    private static volatile boolean paused;

    private static final ConcurrentHashMap<String, Method> METHODS = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Boolean> MISSING = new ConcurrentHashMap<>();

    private PortHooks() {
    }

    /** The view PlayerFragment returns, wrapped so the skip session has an anchor that lives as long as the screen. */
    public static final class PortHost extends FrameLayout {
        public PortHost(Context context) {
            super(context);
        }
    }

    // ---- hooks ----------------------------------------------------------------------------

    /** Core.dispatch(Action, Field), index 0. Never throws into the app. */
    public static void onCoreDispatch(Object action, Object field) {
        if (action == null) return;
        try {
            Object load = call(action, "getLoad");
            if (load != null) {
                Object selected = call(load, "getPlayer");
                if (selected != null) onStreamLoad(selected);
                return;
            }
            Object actionPlayer = call(action, "getPlayer");
            if (actionPlayer != null) {
                onPlayerAction(actionPlayer);
                return;
            }
            if (call(action, "getUnload") != null) {
                boolean ends = endsPlayer(field);
                if (loaded) Log.i(TAG, "unload " + (field == null ? "?" : field.getClass().getSimpleName()) + (ends ? "" : ": player kept"));
                if (ends) clearLoaded();
            }
        } catch (Throwable t) {
            Log.w(TAG, "dispatch parse failed", t);
        }
    }

    /**
     * Every model has its own Unload; only the player's ends the playback. A streams page or home row being
     * cleared while a player runs (phone: the view models of the activity a deep link replaced) is not an end.
     */
    private static boolean endsPlayer(Object field) {
        return field == null || field.getClass().getName().endsWith("$PLAYER");
    }

    /** End of every constructor of a class implementing the app's player interface. */
    public static void onStremioPlayer(Object instance) {
        if (instance == null) return;
        player = new WeakReference<>(instance);
        Log.i(TAG, "player " + instance.getClass().getName());
        maybeOffer();
    }

    /** PlayerFragment's onCreateView result, index before each return. Returns the view to hand back to the fragment. */
    public static View wrapPlayerScreen(View view) {
        return wrap(view, false);
    }

    public static View wrapPlayerScreenDebug(View view) {
        return wrap(view, true);
    }

    private static View wrap(View view, boolean debug) {
        if (view == null || view instanceof PortHost) return view;
        try {
            PortHost wrapper = new PortHost(view.getContext());
            wrapper.addView(view, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            host = new WeakReference<View>(wrapper);
            debugOn = debug || debugPref(view.getContext());
            Log.i(TAG, "player screen wrapped " + view.getClass().getName());
            maybeOffer();
            return wrapper;
        } catch (Throwable t) {
            Log.w(TAG, "wrap failed", t);
            return view;
        }
    }

    /** Runtime debug switch (Mod settings): boolean key introskip_debug in the Intro Skip prefs file, OR-ed with the patch-time option. */
    private static boolean debugPref(Context context) {
        try {
            return IntroSkipPrefs.prefs(context).getBoolean("introskip_debug", false);
        } catch (Throwable t) {
            return false;
        }
    }

    /** The decoded core Player model (PlayerKt.decodeWithImpl return value). Runs on the core thread. */
    public static void onPlayerState(Object model) {
        if (model == null) return;
        try {
            Object selected = call(model, "getSelected");
            if (selected == null) {
                if (loaded && SystemClock.elapsedRealtime() - loadedAtMs > 3000L) clearLoaded();
                return;
            }
            Object request = call(selected, "getStreamRequest");
            Object path = request == null ? null : call(request, "getPath");
            String id = path == null ? "" : str(call(path, "getId"));
            if (streamId.length() > 0 && id.length() > 0 && !id.equals(streamId)) return; // model of another item
            Object metaState = call(model, "getMetaItem");
            Object meta = metaState == null ? null : call(metaState, "getReady");
            if (meta != null) {
                metaType = str(call(meta, "getType"));
                String name = str(call(meta, "getName"));
                if (name.length() == 0) name = str(call(metaState, "getTitle"));
                metaTitle = name;
                videoTitle = videoTitleOf(call(meta, "getVideos"), streamId);
                String runtime = str(call(meta, "getRuntime"));
                if (runtime.length() > 0 && streamId.length() > 0) keptRuntime = new String[]{streamId, runtime};
            } else if (metaState != null) {
                String name = str(call(metaState, "getTitle"));
                if (name.length() > 0) metaTitle = name;
            }
            Object next = call(model, "getNextVideo");
            if (next != null) {
                nextVideoId = str(call(next, "getId"));
                if (nextVideoId.length() > 0 && streamId.length() > 0) keptNextFor = streamId;
                Object links = call(next, "getDeepLinks");
                nextVideoLink = links == null ? "" : str(call(links, "getMetaDetailsStreams"));
            } else {
                nextVideoId = "";
                nextVideoLink = "";
            }
        } catch (Throwable t) {
            Log.w(TAG, "player model parse failed", t);
        }
    }

    /** MainActivity.onCreate, index 0. */
    public static void onMainActivity(Object instance) {
        if (instance instanceof Activity) activity = new WeakReference<>((Activity) instance);
    }

    /** Phone (2.x) MainActivity.onCreate, index 0: there is no player Fragment, so {@link PhoneOverlay} owns the anchor. */
    public static void onPhoneActivity(Object instance) {
        onMainActivity(instance);
        if (instance instanceof Activity) PhoneOverlay.onMainActivity((Activity) instance);
    }

    public static void onPhoneActivityDebug(Object instance) {
        patchDebug = true;
        onPhoneActivity(instance);
    }

    /** PhoneOverlay: the phone's player anchor is attached; pairs it with the app's player. */
    static void setHost(View anchor, Context context) {
        host = new WeakReference<View>(anchor);
        debugOn = patchDebug || debugPref(context);
        Log.i(TAG, "phone player anchor " + (anchor == null ? "none" : anchor.getClass().getName()));
        maybeOffer();
    }

    /** PhoneOverlay: the anchor was removed (unload); a later load gets a new one. */
    static void clearHost(View anchor) {
        if (host.get() == anchor) host = new WeakReference<View>(null);
    }

    static Activity currentActivity() {
        return activity.get();
    }

    // ---- state for the skip logic ---------------------------------------------------------

    /** Current position in ms: the player when the interface is resolved, else core time + wall clock. */
    public static long positionMs() {
        Object p = player.get();
        if (p != null) {
            long t = timeImpl(p);
            if (t >= 0) return t;
        }
        return coreTimeEstimateMs();
    }

    public static long durationMs() {
        Object p = player.get();
        if (p != null) {
            long d = durationImpl(p);
            if (d > 0) return d;
        }
        return coreDurationMs;
    }

    /** Core TimeChanged / SeekAction time plus the wall clock while playing; -1 when unknown. */
    static long coreTimeEstimateMs() {
        long base = coreTimeMs;
        if (base < 0) return -1;
        return paused ? base : base + (SystemClock.elapsedRealtime() - coreAtMs);
    }

    static long coreDurationMs() {
        return coreDurationMs;
    }

    static boolean corePaused() {
        return paused;
    }

    /** Seeks the current player; false when this build has no resolved player interface. */
    public static boolean seekTo(long ms) {
        Object p = player.get();
        if (p == null) return false;
        try {
            return seekImpl(p, ms);
        } catch (Throwable t) {
            Log.w(TAG, "seek failed", t);
            return false;
        }
    }

    /** True from ActionLoad.Player until Unload (or a model without a selected stream). */
    public static boolean isLoaded() {
        return loaded;
    }

    public static String streamType() {
        return streamType;
    }

    /** Stremio video id, e.g. "tt0944947:1:2" for a series episode or "tt0111161" for a movie; "" when nothing is loaded. */
    public static String streamId() {
        return streamId;
    }

    public static String streamUrl() {
        return streamUrl;
    }

    /** Meta type from the core meta model ("series", "movie", ...), "" until the model arrived. */
    public static String metaType() {
        return metaType;
    }

    /** The current item's title from the core meta model (series or movie name), "" until the model arrived. */
    public static String metaTitle() {
        return metaTitle;
    }

    /** Title of the playing episode, "" when unknown. */
    public static String videoTitle() {
        return videoTitle;
    }

    public static String nextVideoId() {
        return nextVideoId;
    }

    /** Transport URLs of the addon that served the loaded stream and of its meta addon; "" when unknown. */
    static String streamTransport() {
        return streamTransport;
    }

    static String metaTransport() {
        return metaTransport;
    }

    /** Meta runtime text ("49 min", "PT49M") of the loaded item as last seen for this video id, "" when unknown. */
    public static String runtimeTextFor(String videoId) {
        String[] kept = keptRuntime;
        return kept != null && videoId != null && videoId.length() > 0 && videoId.equals(kept[0]) ? kept[1] : "";
    }

    /** True when the player model reported a next episode while this video id was loaded. */
    public static boolean hadNextVideoFor(String videoId) {
        return videoId != null && videoId.length() > 0 && videoId.equals(keptNextFor);
    }

    public static long loadedAtMs() {
        return loadedAtMs;
    }

    /** Opens the next episode's streams page through Stremio's own deep link; returns a log line. */
    static String playNext(Activity from) {
        String link = nextVideoLink;
        if (link.length() == 0) return "no next video";
        Activity target = from != null ? from : activity.get();
        if (target == null) return "no activity";
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(link));
            intent.setPackage(target.getPackageName());
            StreamAutoPick.noteNextEpisode(nextVideoId); // Auto-pick may pick this page's best stream at once
            NextPrep.expectNext(nextVideoId); // or start the stream prepared while this episode played
            target.startActivity(intent);
            return "opened " + link;
        } catch (Throwable t) {
            return "failed " + t;
        }
    }

    // ---- stubs: bodies generated by the patch (PortFingerprints.generatePlayerStubs) --------

    static boolean seekImpl(Object p, long ms) {
        return false;
    }

    static long timeImpl(Object p) {
        return -1L;
    }

    static long durationImpl(Object p) {
        return -1L;
    }

    /** The engine's isPlaying(); only meaningful when {@link #hasPlayingStub()}. */
    static boolean playingImpl(Object p) {
        return false;
    }

    /** True once the patch generated {@link #playingImpl}. */
    static boolean hasPlayingStub() {
        return false;
    }

    // ---- session wiring ------------------------------------------------------------------

    /** Hands (screen, player) to the skip engine once both exist; each pair only once. */
    private static void maybeOffer() {
        try {
            View h = host.get();
            Object p = player.get();
            if (h == null || p == null) return;
            if (offeredHost.get() == h && offeredPlayer.get() == p) return;
            offeredHost = new WeakReference<>(h);
            offeredPlayer = new WeakReference<>(p);
            IntroSkipBridge.onPortHost(h, new PortSkipPlayer(p), debugOn);
        } catch (Throwable t) {
            Log.w(TAG, "offer failed", t);
        }
    }

    // ---- parsing --------------------------------------------------------------------------

    private static void onStreamLoad(Object selected) {
        Object request = call(selected, "getStreamRequest");
        Object path = request == null ? null : call(request, "getPath");
        String type = path == null ? "" : str(call(path, "getType"));
        String id = path == null ? "" : str(call(path, "getId"));
        Object stream = call(selected, "getStream");
        String url = "";
        if (stream != null) {
            // Stream.getUrl() is the Url source object (null for other sources); its getUrl() is the string.
            Object source = call(stream, "getUrl");
            Object u = source instanceof String ? source : call(source, "getUrl");
            if (u instanceof String) url = (String) u;
        }
        streamType = type;
        streamId = id;
        streamUrl = url;
        streamTransport = request == null ? "" : str(call(request, "getBase"));
        Object metaRequest = call(selected, "getMetaRequest");
        metaTransport = metaRequest == null ? "" : str(call(metaRequest, "getBase"));
        loadedAtMs = SystemClock.elapsedRealtime();
        metaType = "";
        metaTitle = "";
        videoTitle = "";
        nextVideoId = "";
        nextVideoLink = "";
        coreTimeMs = -1;
        coreDurationMs = -1;
        paused = false;
        loaded = true;
        Log.i(TAG, "load type=" + type + " id=" + id);
        PhoneOverlay.onLoad();
    }

    private static void clearLoaded() {
        boolean was = loaded;
        loaded = false;
        streamType = "";
        streamId = "";
        streamUrl = "";
        metaType = "";
        metaTitle = "";
        videoTitle = "";
        nextVideoId = "";
        nextVideoLink = "";
        coreTimeMs = -1;
        coreDurationMs = -1;
        if (was) PhoneOverlay.onUnload();
    }

    private static String videoTitleOf(Object videos, String id) {
        if (!(videos instanceof List) || id.length() == 0) return "";
        for (Object video : (List<?>) videos) {
            if (id.equals(str(call(video, "getId")))) return str(call(video, "getTitle"));
        }
        return "";
    }

    private static void onPlayerAction(Object actionPlayer) {
        Object state = call(actionPlayer, "getTimeChanged");
        if (state == null) state = call(actionPlayer, "getSeekAction");
        if (state != null) {
            Object time = call(state, "getTime");
            Object duration = call(state, "getDuration");
            if (time instanceof Long) coreTimeMs = (Long) time;
            if (duration instanceof Long) coreDurationMs = (Long) duration;
            coreAtMs = SystemClock.elapsedRealtime();
            return;
        }
        Object pausedChanged = call(actionPlayer, "getPausedChanged");
        if (pausedChanged instanceof Boolean) {
            long now = SystemClock.elapsedRealtime();
            if (!paused && coreTimeMs >= 0) coreTimeMs += now - coreAtMs;
            coreAtMs = now;
            paused = (Boolean) pausedChanged;
        }
    }

    private static String str(Object value) {
        return value == null ? "" : String.valueOf(value);
    }

    /** Calls a public no-arg getter by name; null when absent or failing. Cached per class. */
    private static Object call(Object target, String name) {
        if (target == null) return null;
        String key = target.getClass().getName() + '#' + name;
        if (MISSING.containsKey(key)) return null;
        Method method = METHODS.get(key);
        if (method == null) {
            try {
                method = target.getClass().getMethod(name);
            } catch (Throwable t) {
                MISSING.put(key, Boolean.TRUE);
                return null;
            }
            METHODS.put(key, method);
        }
        try {
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }
}
