package nl.johninnl.parool;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.SparseBooleanArray;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Connects the accepted Amalia queue to the existing session player. */
public final class NewsQueueBridge {
    private static final String MODEL = "nl.dpgmedia.mcdpg.amalia.player.audio.model.";
    private static volatile Object queuePlayer;
    private static volatile Snapshot latest = new Snapshot(Collections.emptyList(), null);

    private NewsQueueBridge() {}

    /** Metadata only: future audio is still resolved by the native queue player. */
    public static final class Entry {
        public final String uid;
        public final String title;
        public final String imageUrl;
        public final long durationMs;
        public final Object browseItem;

        public Entry(String uid, String title, String imageUrl, long durationMs, Object browseItem) {
            this.uid = uid;
            this.title = title;
            this.imageUrl = imageUrl;
            this.durationMs = durationMs;
            this.browseItem = browseItem;
        }
    }

    /** A fixed ordering of real queue occurrences, independent of browse refreshes. */
    public static final class Snapshot {
        public final List<Entry> entries;
        public final String currentUid;
        public final int currentIndex;

        public Snapshot(List<Entry> entries, String currentUid) {
            Set<String> ids = new HashSet<>();
            for (Entry entry : entries) {
                if (entry == null || entry.uid == null || entry.uid.isEmpty() || !ids.add(entry.uid)) {
                    throw new IllegalArgumentException("Queue occurrences require unique nonempty UIDs");
                }
            }
            this.entries = Collections.unmodifiableList(new ArrayList<>(entries));
            this.currentUid = currentUid;
            this.currentIndex = indexOf(currentUid);
        }

        public int indexOf(String uid) {
            if (uid != null) {
                for (int i = 0; i < entries.size(); i++) {
                    if (uid.equals(entries.get(i).uid)) return i;
                }
            }
            return -1;
        }
    }

    public static Snapshot snapshot() {
        return latest;
    }

    public static boolean isNewsUid(String uid) {
        return CarNieuws.isNewsUid(uid);
    }

    public static boolean canNavigate() {
        return queuePlayer != null;
    }

    /** The notification grant also limits Media3's global legacy session.
     * Grant the implemented queue operations; actual availability is still
     * intersected with the current player's truthful boundary/ad state. */
    public static Object controllerCommands(Object original) {
        try {
            Object flags = original.getClass().getField("flags").get(original);
            SparseBooleanArray values = ((SparseBooleanArray) flags.getClass().getField("flags").get(flags)).clone();
            for (int command : new int[]{6, 7, 8, 9, 10, 17}) values.put(command, true);
            Object updated = flags.getClass().getConstructor(SparseBooleanArray.class).newInstance(values);
            return original.getClass().getConstructor(flags.getClass()).newInstance(updated);
        } catch (ReflectiveOperationException | RuntimeException e) {
            warn("Cannot grant session queue commands", e);
            return original;
        }
    }

    /** Called after the native queue player finishes construction. */
    public static void capturePlayer(Object player) {
        queuePlayer = player;
        NewsQueuePlayer.queueChanged();
    }

    /** Called only after AudioQueueHolder actually commits a changed queue. */
    public static void onQueueChanged(Object currentQueue) {
        try {
            Object items = field(currentQueue, "items");
            if (!(items instanceof List)) throw new IllegalArgumentException("Missing native queue items");
            List<Entry> entries = new ArrayList<>();
            for (Object item : (List<?>) items) {
                Object media = field(item, "media");
                String uid = (String) field(media, "queueUid");
                Object duration = field(media, "totalDuration");
                entries.add(new Entry(uid, (String) field(media, "title"),
                    (String) field(media, "imageUrl"),
                    duration instanceof Number ? ((Number) duration).longValue() : 0L,
                    CarNieuws.browseItem(uid)));
            }
            Snapshot accepted = new Snapshot(entries, (String) field(currentQueue, "currentItemQueueUid"));
            List<String> uids = new ArrayList<>();
            for (Entry entry : entries) uids.add(entry.uid);
            CarNieuws.acceptNewsQueue(accepted.currentUid, uids);
            latest = accepted;
        } catch (ReflectiveOperationException | RuntimeException e) {
            latest = new Snapshot(Collections.emptyList(), null);
            warn("Cannot read the committed queue", e);
        }
        // The holder may commit on IO; wrappers marshal notifications to their player looper.
        NewsQueuePlayer.queueChanged();
    }

    public static void skipNext() {
        onMain(() -> invokeNavigation("playNextItem", null));
    }

    public static void skipPrevious() {
        onMain(() -> invokeNavigation("playPreviousItem", null));
    }

    public static void playUid(String uid) {
        onMain(() -> {
            Object player = queuePlayer;
            if (player == null) return;
            try {
                // Translate the original occurrence against the latest engine queue, never
                // reuse a UI index after the native queue has changed.
                Object calculator = field(player, "calculator");
                List<?> items = (List<?>) calculator.getClass().getMethod("getQueueItems").invoke(calculator);
                int index = -1;
                for (int i = 0; i < items.size(); i++) {
                    if (uid.equals(field(field(items.get(i), "media"), "queueUid"))) {
                        index = i;
                        break;
                    }
                }
                if (index >= 0) invokeNavigation("playItemAtAsContinuation", index);
            } catch (ReflectiveOperationException e) {
                warn("Cannot select the queue occurrence", e);
            }
        });
    }

    private static void invokeNavigation(String name, Integer index) {
        Object player = queuePlayer;
        if (player == null) return;
        try {
            Class<?> startingMethod = Class.forName(MODEL + "AmaliaAudioTrackingParameters$StartingMethod");
            Object manual = startingMethod.getField("ClickToPlay").get(null);
            Class<?> continuation = Class.forName("kotlin.coroutines.Continuation");
            Object empty = Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
            Object callback = Proxy.newProxyInstance(continuation.getClassLoader(), new Class<?>[]{continuation},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                    case "getContext": return empty;
                    case "resumeWith":
                        Object result = args[0];
                        if (result != null && "kotlin.Result$Failure".equals(result.getClass().getName())) {
                            warn("Native queue command failed", (Throwable) field(result, "exception"));
                        }
                        return null;
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    case "toString": return "NewsQueueContinuation";
                    default: return null;
                    }
                });
            if (index == null) {
                player.getClass().getMethod(name, startingMethod, continuation).invoke(player, manual, callback);
            } else {
                player.getClass().getMethod(name, int.class, startingMethod, continuation)
                    .invoke(player, index.intValue(), manual, callback);
            }
        } catch (ReflectiveOperationException e) {
            Throwable cause = e instanceof InvocationTargetException ? ((InvocationTargetException) e).getCause() : e;
            warn("Cannot dispatch the native queue command", cause);
        }
    }

    private static void onMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else new Handler(Looper.getMainLooper()).post(action);
    }

    static Object field(Object target, String name) throws ReflectiveOperationException {
        if (target == null) throw new NoSuchFieldException("Missing queue value");
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private static void warn(String message, Throwable error) {
        try { Log.w("NewsQueue", message, error); } catch (RuntimeException ignored) { }
    }
}
