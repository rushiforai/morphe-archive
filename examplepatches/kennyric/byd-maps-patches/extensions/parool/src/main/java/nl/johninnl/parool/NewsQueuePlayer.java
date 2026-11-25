package nl.johninnl.parool;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.SparseBooleanArray;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;
import androidx.media3.common.Timeline;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/** Publishes Amalia's real news queue while leaving audio resolution and autoplay native. */
public final class NewsQueuePlayer implements InvocationHandler {
    private static final String TAG = "NewsQueuePlayer";
    private static final int GET_TIMELINE = 17;
    private static final int SEEK_TO_MEDIA_ITEM = 10;
    private static final int SEEK_TO_PREVIOUS_MEDIA_ITEM = 6;
    private static final int SEEK_TO_PREVIOUS = 7;
    private static final int SEEK_TO_NEXT_MEDIA_ITEM = 8;
    private static final int SEEK_TO_NEXT = 9;
    private static final List<WeakReference<NewsQueuePlayer>> wrappers = new ArrayList<>();

    private final Object delegate;
    private final Object proxy;
    private final Handler handler;
    private final Class<?> listenerType;
    private final Method currentItemMethod;
    private final Method currentTimelineMethod;
    private final Method currentIndexMethod;
    private final Method playingAdMethod;
    private final Method commandsMethod;
    private final Method removeListenerMethod;
    private final Method seekPositionMethod;
    private final Object nativeListener;
    private final Constructor<?> flagSetConstructor;
    private final Constructor<?> commandsConstructor;
    private final Constructor<?> eventsConstructor;
    private final Field commandFlags;
    private final Field sparseFlags;
    private final Map<Object, Object> listeners = new IdentityHashMap<>();

    private volatile boolean released;
    private boolean notificationPending;
    private NewsQueueBridge.Snapshot cachedSnapshot;
    private MediaItem cachedItem;
    private Timeline cachedNativeTimeline;
    private boolean cachedAd;
    private Projection cachedProjection;
    private boolean hadNewsProjection;
    private long projectionRevision;
    private Object cachedBaseCommands;
    private Projection cachedCommandProjection;
    private boolean cachedNavigation;
    private Object cachedCommands;
    private String pendingSeekUid;
    private long pendingSeekPositionMs;

    private static final class Projection {
        final NewsQueueBridge.Snapshot snapshot;
        final String currentUid;
        final int currentIndex;
        final int nativeIndex;
        final NewsTimeline timeline;

        Projection(NewsQueueBridge.Snapshot snapshot, String currentUid, int currentIndex,
                   int nativeIndex, NewsTimeline timeline) {
            this.snapshot = snapshot;
            this.currentUid = currentUid;
            this.currentIndex = currentIndex;
            this.nativeIndex = nativeIndex;
            this.timeline = timeline;
        }
    }

    /** Hooked at the native factory's return; the same player remains the audio owner. */
    public static Object wrap(Object originalFactoryPlayer) {
        if (originalFactoryPlayer == null) return null;
        if (Proxy.isProxyClass(originalFactoryPlayer.getClass())
                && Proxy.getInvocationHandler(originalFactoryPlayer) instanceof NewsQueuePlayer) {
            return originalFactoryPlayer;
        }
        try {
            NewsQueuePlayer wrapper = new NewsQueuePlayer(originalFactoryPlayer);
            synchronized (wrappers) {
                wrappers.add(new WeakReference<>(wrapper));
            }
            return wrapper.proxy;
        } catch (Throwable t) {
            Log.w(TAG, "Native queue publication unavailable", t);
            return originalFactoryPlayer;
        }
    }

    private NewsQueuePlayer(Object delegate) throws Throwable {
        this.delegate = delegate;
        ClassLoader loader = delegate.getClass().getClassLoader();
        Class<?> playerType = Class.forName("androidx.media3.common.Player", false, loader);
        listenerType = Class.forName("androidx.media3.common.Player$Listener", false, loader);
        currentItemMethod = playerType.getMethod("getCurrentMediaItem");
        currentTimelineMethod = playerType.getMethod("getCurrentTimeline");
        currentIndexMethod = playerType.getMethod("getCurrentMediaItemIndex");
        playingAdMethod = playerType.getMethod("isPlayingAd");
        commandsMethod = playerType.getMethod("getAvailableCommands");
        removeListenerMethod = playerType.getMethod("removeListener", listenerType);
        seekPositionMethod = playerType.getMethod("seekTo", long.class);
        handler = new Handler((Looper) call(playerType.getMethod("getApplicationLooper"), delegate, null));
        Class<?> flagSetType = Class.forName("androidx.media3.common.FlagSet", false, loader);
        Class<?> commandsType = Class.forName("androidx.media3.common.Player$Commands", false, loader);
        Class<?> eventsType = Class.forName("androidx.media3.common.Player$Events", false, loader);
        flagSetConstructor = flagSetType.getConstructor(SparseBooleanArray.class);
        commandsConstructor = commandsType.getConstructor(flagSetType);
        eventsConstructor = eventsType.getConstructor(flagSetType);
        commandFlags = commandsType.getField("flags");
        sparseFlags = flagSetType.getField("flags");
        proxy = Proxy.newProxyInstance(loader, new Class<?>[]{playerType}, this);
        nativeListener = Proxy.newProxyInstance(loader, new Class<?>[]{listenerType},
            (listenerProxy, method, args) -> {
                String name = method.getName();
                if (method.getDeclaringClass() == Object.class) return objectMethod(listenerProxy, method, args);
                if (name.equals("onPlayerError")) clearPendingSeek();
                if (name.equals("onMediaItemTransition")) {
                    applyPendingSeek(true);
                    scheduleQueueChanged();
                } else if (name.equals("onEvents")) {
                    applyPendingSeek(false);
                } else if (name.equals("onTimelineChanged") || name.equals("onPositionDiscontinuity")) {
                    scheduleQueueChanged();
                }
                return null;
            });
        call(playerType.getMethod("addListener", listenerType), delegate, new Object[]{nativeListener});
    }

    /** Native CurrentQueue commits arrive on IO; callbacks belong on the player looper. */
    public static void queueChanged() {
        synchronized (wrappers) {
            Iterator<WeakReference<NewsQueuePlayer>> iterator = wrappers.iterator();
            while (iterator.hasNext()) {
                NewsQueuePlayer wrapper = iterator.next().get();
                if (wrapper == null || wrapper.released) iterator.remove();
                else wrapper.scheduleQueueChanged();
            }
        }
    }

    @Override public Object invoke(Object ignoredProxy, Method method, Object[] args) throws Throwable {
        String name = method.getName();
        if (method.getDeclaringClass() == Object.class) return objectMethod(proxy, method, args);
        if (name.equals("addListener")) return addListener(method, args[0]);
        if (name.equals("removeListener")) return removeListener(method, args[0]);
        if (name.equals("release")) return release(method, args);
        if (!isQueueMethod(name)) return call(method, delegate, args);

        Projection projection = projection();
        if (projection == null) return call(method, delegate, args);
        switch (name) {
            case "getCurrentTimeline": return projection.timeline;
            case "getMediaItemCount": return projection.snapshot.entries.size();
            case "getMediaItemAt": return projection.timeline.itemAt((Integer) args[0]);
            case "getCurrentMediaItemIndex":
            case "getCurrentWindowIndex":
            case "getCurrentPeriodIndex": return projection.currentIndex;
            case "hasPreviousMediaItem":
            case "hasPreviousWindow": return projection.currentIndex > 0;
            case "hasNextMediaItem":
            case "hasNextWindow": return projection.currentIndex + 1 < projection.snapshot.entries.size();
            case "getPreviousMediaItemIndex":
            case "getPreviousWindowIndex": return projection.currentIndex > 0 ? projection.currentIndex - 1 : C.INDEX_UNSET;
            case "getNextMediaItemIndex":
            case "getNextWindowIndex": return projection.currentIndex + 1 < projection.snapshot.entries.size()
                ? projection.currentIndex + 1 : C.INDEX_UNSET;
            case "getAvailableCommands": return availableCommands(call(method, delegate, args), projection);
            case "isCommandAvailable": return flags(availableCommands(call(commandsMethod, delegate, null), projection))
                .get((Integer) args[0]);
            case "seekToNext":
            case "seekToNextMediaItem":
                clearPendingSeek();
                if (canNavigate(projection) && projection.currentIndex + 1 < projection.snapshot.entries.size()) {
                    NewsQueueBridge.skipNext();
                }
                return null;
            case "seekToPrevious":
            case "seekToPreviousMediaItem":
                clearPendingSeek();
                if (canNavigate(projection) && projection.currentIndex > 0) NewsQueueBridge.skipPrevious();
                return null;
            case "seekTo":
            case "seekToDefaultPosition":
                if (args != null && args.length > 0 && args[0] instanceof Integer) {
                    int index = (Integer) args[0];
                    NewsQueueBridge.Entry entry = projection.snapshot.entries.get(index);
                    if (index == projection.currentIndex) {
                        clearPendingSeek();
                        Object[] nativeArgs = args.clone();
                        nativeArgs[0] = projection.nativeIndex;
                        return call(method, delegate, nativeArgs);
                    }
                    if (canNavigate(projection)) {
                        long position = args.length == 2 ? (Long) args[1] : C.TIME_UNSET;
                        synchronized (this) {
                            pendingSeekUid = position >= 0L ? entry.uid : null;
                            pendingSeekPositionMs = position;
                        }
                        try { NewsQueueBridge.playUid(entry.uid); }
                        catch (Throwable t) { clearPendingSeek(); throw t; }
                    }
                    return null;
                }
                clearPendingSeek();
                return call(method, delegate, args);
            default: return call(method, delegate, args);
        }
    }

    private static boolean isQueueMethod(String name) {
        return name.equals("getCurrentTimeline") || name.equals("getMediaItemCount")
            || name.equals("getMediaItemAt") || name.equals("getCurrentMediaItemIndex")
            || name.equals("getCurrentWindowIndex") || name.equals("getCurrentPeriodIndex")
            || name.equals("hasPreviousMediaItem") || name.equals("hasPreviousWindow")
            || name.equals("hasNextMediaItem") || name.equals("hasNextWindow")
            || name.equals("getPreviousMediaItemIndex") || name.equals("getPreviousWindowIndex")
            || name.equals("getNextMediaItemIndex") || name.equals("getNextWindowIndex")
            || name.equals("getAvailableCommands") || name.equals("isCommandAvailable")
            || name.equals("seekToNext") || name.equals("seekToNextMediaItem")
            || name.equals("seekToPrevious") || name.equals("seekToPreviousMediaItem")
            || name.equals("seekTo") || name.equals("seekToDefaultPosition");
    }

    private Projection projection() throws Throwable {
        NewsQueueBridge.Snapshot snapshot = NewsQueueBridge.snapshot();
        MediaItem item = (MediaItem) call(currentItemMethod, delegate, null);
        Timeline nativeTimeline = (Timeline) call(currentTimelineMethod, delegate, null);
        boolean ad = (Boolean) call(playingAdMethod, delegate, null);
        if (snapshot == cachedSnapshot && item == cachedItem && nativeTimeline == cachedNativeTimeline && ad == cachedAd) {
            return cachedProjection;
        }
        cachedSnapshot = snapshot;
        cachedItem = item;
        cachedNativeTimeline = nativeTimeline;
        cachedAd = ad;
        cachedProjection = null;
        if (ad || item == null || snapshot == null) return null;
        String uid = queueUid(item);
        if (uid == null || !NewsQueueBridge.isNewsUid(uid)) return null;
        int index = indexOf(snapshot, uid);
        if (index == C.INDEX_UNSET) return null;
        int nativeIndex = (Integer) call(currentIndexMethod, delegate, null);
        Timeline.Window nativeWindow = null;
        if (nativeIndex >= 0 && nativeIndex < nativeTimeline.getWindowCount()) {
            nativeWindow = nativeTimeline.getWindow(nativeIndex, new Timeline.Window(), 0L);
        }
        List<MediaItem> items = new ArrayList<>(snapshot.entries.size());
        List<String> uids = new ArrayList<>(snapshot.entries.size());
        List<Long> durations = new ArrayList<>(snapshot.entries.size());
        for (int i = 0; i < snapshot.entries.size(); i++) {
            NewsQueueBridge.Entry entry = snapshot.entries.get(i);
            items.add(i == index ? item : entry.browseItem instanceof MediaItem
                ? (MediaItem) entry.browseItem : metadataItem(entry));
            uids.add(entry.uid);
            durations.add(entry.durationMs);
        }
        cachedProjection = new Projection(snapshot, uid, index, nativeIndex,
            new NewsTimeline(items, uids, durations, index, nativeWindow));
        hadNewsProjection = true;
        projectionRevision++;
        return cachedProjection;
    }

    private static boolean canNavigate(Projection projection) {
        return projection.currentUid.equals(projection.snapshot.currentUid)
            && projection.currentIndex == projection.snapshot.currentIndex && NewsQueueBridge.canNavigate();
    }

    private Object availableCommands(Object base, Projection projection) throws ReflectiveOperationException {
        if (projection == null) return base;
        boolean navigation = canNavigate(projection);
        if (base == cachedBaseCommands && projection == cachedCommandProjection && navigation == cachedNavigation) {
            return cachedCommands;
        }
        SparseBooleanArray copy = flags(base).clone();
        setCommand(copy, GET_TIMELINE, true);
        setCommand(copy, SEEK_TO_MEDIA_ITEM, navigation);
        boolean previous = navigation && projection.currentIndex > 0;
        boolean next = navigation && projection.currentIndex + 1 < projection.snapshot.entries.size();
        setCommand(copy, SEEK_TO_PREVIOUS_MEDIA_ITEM, previous);
        setCommand(copy, SEEK_TO_PREVIOUS, previous);
        setCommand(copy, SEEK_TO_NEXT_MEDIA_ITEM, next);
        setCommand(copy, SEEK_TO_NEXT, next);
        cachedCommands = commandsConstructor.newInstance(flagSetConstructor.newInstance(copy));
        cachedBaseCommands = base;
        cachedCommandProjection = projection;
        cachedNavigation = navigation;
        return cachedCommands;
    }

    private SparseBooleanArray flags(Object commands) throws IllegalAccessException {
        return (SparseBooleanArray) sparseFlags.get(commandFlags.get(commands));
    }

    private static void setCommand(SparseBooleanArray flags, int command, boolean enabled) {
        if (enabled) flags.put(command, true);
        else flags.delete(command);
    }

    private Object addListener(Method method, Object listener) throws Throwable {
        synchronized (listeners) {
            if (listeners.containsKey(listener)) return null;
            Object forwarding = Proxy.newProxyInstance(listenerType.getClassLoader(), new Class<?>[]{listenerType},
                (listenerProxy, callback, args) -> {
                    if (callback.getDeclaringClass() == Object.class) return objectMethod(listenerProxy, callback, args);
                    Object[] forwarded = args;
                    String name = callback.getName();
                    if (name.equals("onEvents")) {
                        forwarded = args.clone();
                        forwarded[0] = proxy;
                    } else if (name.equals("onTimelineChanged")) {
                        Projection projection = projection();
                        if (projection != null) {
                            forwarded = args.clone();
                            forwarded[0] = projection.timeline;
                        }
                    } else if (name.equals("onAvailableCommandsChanged")) {
                        forwarded = args.clone();
                        forwarded[0] = availableCommands(args[0], projection());
                    } else if (name.equals("onPositionDiscontinuity") && args.length == 3) {
                        Projection projection = projection();
                        if (projection != null) {
                            forwarded = args.clone();
                            forwarded[0] = positionInfo((Player.PositionInfo) args[0], projection.snapshot);
                            forwarded[1] = positionInfo((Player.PositionInfo) args[1], projection.snapshot);
                        }
                    }
                    return call(callback, listener, forwarded);
                });
            listeners.put(listener, forwarding);
            try {
                return call(method, delegate, new Object[]{forwarding});
            } catch (Throwable t) {
                listeners.remove(listener);
                throw t;
            }
        }
    }

    private Object removeListener(Method method, Object listener) throws Throwable {
        synchronized (listeners) {
            Object forwarding = listeners.remove(listener);
            return call(method, delegate, new Object[]{forwarding == null ? listener : forwarding});
        }
    }

    private static Player.PositionInfo positionInfo(Player.PositionInfo info, NewsQueueBridge.Snapshot snapshot) {
        if (info.adGroupIndex != C.INDEX_UNSET || info.adIndexInAdGroup != C.INDEX_UNSET) return info;
        String uid = queueUid(info.mediaItem);
        int index = uid == null ? C.INDEX_UNSET : indexOf(snapshot, uid);
        if (index == C.INDEX_UNSET) return info;
        return new Player.PositionInfo(uid, index, info.mediaItem, uid, index, info.positionMs,
            info.contentPositionMs, info.adGroupIndex, info.adIndexInAdGroup);
    }

    private void scheduleQueueChanged() {
        synchronized (this) {
            if (released || notificationPending) return;
            notificationPending = true;
        }
        if (!handler.post(() -> {
            synchronized (NewsQueuePlayer.this) { notificationPending = false; }
            if (released) return;
            try {
                boolean previouslyProjected = hadNewsProjection;
                invalidateProjection();
                Projection projection = projection();
                synchronized (NewsQueuePlayer.this) {
                    if (pendingSeekUid != null && (cachedSnapshot == null
                            || indexOf(cachedSnapshot, pendingSeekUid) == C.INDEX_UNSET)) {
                        pendingSeekUid = null;
                    }
                }
                if (projection == null && !previouslyProjected) return;
                long revision = projectionRevision;
                Timeline timeline = projection == null ? (Timeline) call(currentTimelineMethod, delegate, null) : projection.timeline;
                Object commands = availableCommands(call(commandsMethod, delegate, null), projection);
                SparseBooleanArray eventFlags = new SparseBooleanArray();
                eventFlags.put(0, true); // EVENT_TIMELINE_CHANGED
                eventFlags.put(13, true); // EVENT_AVAILABLE_COMMANDS_CHANGED
                Player.Events events = (Player.Events) eventsConstructor.newInstance(flagSetConstructor.newInstance(eventFlags));
                List<Object> originals;
                synchronized (listeners) { originals = new ArrayList<>(listeners.keySet()); }
                for (Object original : originals) {
                    synchronized (listeners) { if (released || !listeners.containsKey(original)) continue; }
                    Player.Listener listener = (Player.Listener) original;
                    listener.onTimelineChanged(timeline, 1); // TIMELINE_CHANGE_REASON_SOURCE_UPDATE
                    listener.onAvailableCommandsChanged((Player.Commands) commands);
                    listener.onEvents((Player) proxy, events);
                }
                // A getter can already have cached the native fallback before this task runs.
                // Keep the exposure receipt until every fallback callback has been delivered.
                if (projection == null && projectionRevision == revision) hadNewsProjection = false;
            } catch (Throwable t) {
                throw unchecked(t);
            }
        })) {
            synchronized (this) { notificationPending = false; }
        }
    }

    private void invalidateProjection() {
        cachedSnapshot = null;
        cachedItem = null;
        cachedNativeTimeline = null;
        cachedProjection = null;
        cachedBaseCommands = null;
        cachedCommandProjection = null;
        cachedCommands = null;
    }

    private Object release(Method method, Object[] args) throws Throwable {
        released = true;
        clearPendingSeek();
        synchronized (wrappers) {
            wrappers.removeIf(reference -> reference.get() == null || reference.get() == this);
        }
        List<Object> forwarding;
        synchronized (listeners) {
            forwarding = new ArrayList<>(listeners.values());
            listeners.clear();
        }
        forwarding.add(nativeListener);
        Throwable failure = null;
        for (Object listener : forwarding) {
            try { call(removeListenerMethod, delegate, new Object[]{listener}); }
            catch (Throwable t) { if (failure == null) failure = t; else failure.addSuppressed(t); }
        }
        Object result = null;
        try { result = call(method, delegate, args); }
        catch (Throwable t) { if (failure == null) failure = t; else failure.addSuppressed(t); }
        invalidateProjection();
        if (failure != null) throw failure;
        return result;
    }

    private void clearPendingSeek() {
        synchronized (this) { pendingSeekUid = null; }
    }

    /** Apply an explicit cross-item position only after native authorization/resolution. */
    private void applyPendingSeek(boolean itemTransition) throws Throwable {
        String expected;
        synchronized (this) { expected = pendingSeekUid; }
        if (expected == null || released || (Boolean) call(playingAdMethod, delegate, null)) return;
        String actual = queueUid((MediaItem) call(currentItemMethod, delegate, null));
        if (!expected.equals(actual)) {
            if (itemTransition) clearPendingSeek();
            return;
        }
        long position;
        synchronized (this) {
            if (!expected.equals(pendingSeekUid)) return;
            position = pendingSeekPositionMs;
            pendingSeekUid = null; // Native seek can synchronously emit another event.
        }
        call(seekPositionMethod, delegate, new Object[]{position});
    }

    /** mediaId is canonical content identity, not the opaque native queue occurrence. */
    private static String queueUid(MediaItem item) {
        if (item == null || item.mediaMetadata.extras == null) return null;
        Object playable = item.mediaMetadata.extras.getParcelable("playable");
        if (playable == null) return null;
        try {
            for (Class<?> type = playable.getClass(); type != null; type = type.getSuperclass()) {
                try {
                    Field field = type.getDeclaredField("queueUid");
                    field.setAccessible(true);
                    Object uid = field.get(playable);
                    return uid instanceof String ? (String) uid : null;
                } catch (NoSuchFieldException ignored) { }
            }
            Object uid = playable.getClass().getMethod("getQueueUid-EU6Fzmo").invoke(playable);
            return uid instanceof String ? (String) uid : null;
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }

    private static int indexOf(NewsQueueBridge.Snapshot snapshot, String uid) {
        for (int i = 0; i < snapshot.entries.size(); i++) {
            if (uid.equals(snapshot.entries.get(i).uid)) return i;
        }
        return C.INDEX_UNSET;
    }

    private MediaItem metadataItem(NewsQueueBridge.Entry entry) throws ReflectiveOperationException {
        ClassLoader loader = delegate.getClass().getClassLoader();
        Class<?> metadataBuilderType = Class.forName("androidx.media3.common.MediaMetadata$Builder", true, loader);
        Object metadataBuilder = metadataBuilderType.getConstructor().newInstance();
        metadataBuilderType.getField("title").set(metadataBuilder, entry.title);
        metadataBuilderType.getField("isPlayable").set(metadataBuilder, Boolean.TRUE);
        metadataBuilderType.getField("isBrowsable").set(metadataBuilder, Boolean.FALSE);
        if (entry.imageUrl != null && !entry.imageUrl.isEmpty()) {
            metadataBuilderType.getField("artworkUri").set(metadataBuilder, Uri.parse(entry.imageUrl));
        }
        if (entry.durationMs > 0L) metadataBuilderType.getField("durationMs").set(metadataBuilder, entry.durationMs);
        Class<?> metadataType = Class.forName("androidx.media3.common.MediaMetadata", true, loader);
        Constructor<?> metadataConstructor = metadataType.getDeclaredConstructor(metadataBuilderType);
        metadataConstructor.setAccessible(true);
        Object metadata = metadataConstructor.newInstance(metadataBuilder);
        Class<?> itemBuilderType = Class.forName("androidx.media3.common.MediaItem$Builder", true, loader);
        Object builder = itemBuilderType.getConstructor().newInstance();
        itemBuilderType.getField("mediaId").set(builder, entry.uid);
        itemBuilderType.getField("mediaMetadata").set(builder, metadata);
        return (MediaItem) itemBuilderType.getMethod("build").invoke(builder);
    }

    private Object objectMethod(Object identity, Method method, Object[] args) throws Throwable {
        switch (method.getName()) {
            case "equals": return identity == args[0];
            case "hashCode": return System.identityHashCode(identity);
            default: return call(method, delegate, args);
        }
    }

    private static Object call(Method method, Object target, Object[] args) throws Throwable {
        try { return method.invoke(target, args); }
        catch (InvocationTargetException e) { throw e.getCause(); }
    }

    private static RuntimeException unchecked(Throwable throwable) {
        if (throwable instanceof Error) throw (Error) throwable;
        return throwable instanceof RuntimeException ? (RuntimeException) throwable : new IllegalStateException(throwable);
    }
}
