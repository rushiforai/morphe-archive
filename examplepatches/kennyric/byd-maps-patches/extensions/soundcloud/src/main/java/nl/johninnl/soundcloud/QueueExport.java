package nl.johninnl.soundcloud;

import android.media.MediaDescription;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Exports the actual player queue to the same platform session used by Android Auto. */
public final class QueueExport {
    private static final String TAG = "MorpheSoundCloudQueue";
    private static final int UPCOMING = 24;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, QueueExport> SERVICES = new IdentityHashMap<>();
    private static final Map<MediaSession, QueueExport> SESSIONS = new IdentityHashMap<>();
    private static long nextId = 1;

    private final MediaSession session;
    private final Object provider;
    private final Object metadata;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final List<Object> subscriptions = new ArrayList<>();
    private final List<Object> metadataSubscriptions = new ArrayList<>();
    private List<Occurrence> occurrences = new ArrayList<>();
    private final List<Occurrence> window = new ArrayList<>();
    private final Map<Long, MediaDescription> descriptions = new HashMap<>();
    private int current = -1;
    private volatile long generation;
    private volatile boolean closed;

    private static final class Occurrence {
        final Object entry;
        final Object item;
        final long id;
        Occurrence(Object entry, Object item, long id) { this.entry = entry; this.item = item; this.id = id; }
    }

    private QueueExport(Object service, MediaSession session) {
        this.session = session;
        provider = provider(service);
        metadata = metadata(provider);
    }

    /** Runs after MediaService has created its session and injected PlayQueueUpdates. */
    public static void attach(Object service, Object compat) {
        try {
            MediaSession session = frameworkSession(compat, 0);
            if (session == null) throw new IllegalStateException("Platform media session missing");
            detach(service);
            QueueExport export = new QueueExport(service, session);
            SERVICES.put(service, export);
            SESSIONS.put(session, export);
            Object updates = updates(service);
            Object observable = updates.getClass().getMethod("getPlayQueueObservable").invoke(updates);
            export.subscriptions.add(subscribe(observable,
                queue -> { if (Looper.myLooper() == Looper.getMainLooper()) export.queueChanged(queue); else MAIN.post(() -> export.queueChanged(queue)); },
                failure -> MAIN.post(() -> export.failed("Queue subscription failed", failure))));
        } catch (Exception failure) {
            Log.w(TAG, "Queue export unavailable", failure);
            detach(service);
        }
    }

    public static void detach(Object service) {
        QueueExport export = SERVICES.remove(service);
        if (export == null) return;
        export.closed = true;
        export.generation++;
        SESSIONS.remove(export.session);
        dispose(export.subscriptions);
        dispose(export.metadataSubscriptions);
        export.worker.shutdownNow();
        export.occurrences.clear();
        export.window.clear();
        export.descriptions.clear();
        export.session.setQueue(null);
    }

    /** Called after the app publishes playback state so its actions/timing/error fields survive. */
    public static void stateChanged(Object compat) {
        try {
            QueueExport export = SESSIONS.get(frameworkSession(compat, 0));
            if (export != null && !export.closed) export.publishState();
        } catch (Exception failure) {
            Log.w(TAG, "Queue state update unavailable", failure);
        }
    }

    public static void select(Object callback, long queueId) {
        try {
            MediaSession session = frameworkSession(callbackSession(callback), 0);
            QueueExport export = SESSIONS.get(session);
            if (export == null || export.closed) return;
            for (int i = 0; i < export.occurrences.size(); i++) {
                Occurrence occurrence = export.occurrences.get(i);
                if (occurrence.id == queueId && export.descriptions.containsKey(queueId) && eligible(export.provider, occurrence.item)) {
                    if (i == export.current) return;
                    // The UI command is resolved against the current queue, never a stale array index.
                    selectPosition(export.provider, i);
                    return;
                }
            }
        } catch (Exception failure) {
            Log.w(TAG, "Queue selection unavailable", failure);
        }
    }

    private void queueChanged(Object queue) {
        if (closed) return;
        try {
            Object entries = queue.getClass().getMethod("getEntries").invoke(queue);
            Object position = queue.getClass().getMethod("getCurrentPosition").invoke(queue);
            if (!(entries instanceof List) || !(position instanceof Number))
                throw new IllegalStateException("Player queue model changed");
            List<Occurrence> previous = new ArrayList<>(occurrences);
            List<Occurrence> updated = new ArrayList<>();
            for (Object entry : (List<?>) entries) {
                Object item = entry.getClass().getMethod("getPlayQueueItem").invoke(entry);
                Occurrence match = null;
                for (Occurrence old : previous) if (old.entry == entry) { match = old; break; }
                if (match == null) {
                    // withNewPosition/shuffle may recreate context wrappers while retaining items.
                    for (Occurrence old : previous) if (old.item == item) { match = old; break; }
                }
                if (match != null) previous.remove(match);
                updated.add(new Occurrence(entry, item, match == null ? nextId++ : match.id));
            }
            occurrences = updated;
            current = ((Number) position).intValue();
            window.clear();
            if (current >= 0 && current < occurrences.size()) for (int i = current; i < occurrences.size() && window.size() <= UPCOMING; i++) {
                Occurrence occurrence = occurrences.get(i);
                if (i == current || eligible(provider, occurrence.item)) window.add(occurrence);
            }
            generation++;
            dispose(metadataSubscriptions);
            descriptions.keySet().removeIf(id -> updated.stream().noneMatch(o -> o.id == id));
            publish();
            if (current < 0 || current >= occurrences.size()) return;
            long request = generation;
            for (Occurrence occurrence : window) {
                // Ads remain in the internal sequence. They are neither fabricated songs nor jump targets.
                if (!occurrence.item.getClass().getName().endsWith("PlayQueueItem$Playable$Track") || descriptions.containsKey(occurrence.id)) continue;
                worker.execute(() -> resolve(occurrence, request));
            }
        } catch (Exception failure) {
            failed("Queue update failed", failure);
        }
    }

    private void resolve(Occurrence occurrence, long request) {
        if (closed || generation != request) return;
        try {
            Object observable = resolveMetadata(metadata, occurrence.item);
            Object disposable = subscribe(observable,
                value -> MAIN.post(() -> {
                    if (closed || generation != request) return;
                    MediaDescription description = description(value);
                    if (description != null) descriptions.put(occurrence.id, description);
                    publish();
                }),
                failure -> MAIN.post(() -> {
                    if (!closed && generation == request) Log.w(TAG, "Queued metadata unavailable");
                }));
            MAIN.post(() -> {
                if (closed || generation != request) disposeOne(disposable);
                else metadataSubscriptions.add(disposable);
            });
        } catch (Exception failure) {
            MAIN.post(() -> { if (!closed && generation == request) Log.w(TAG, "Queued metadata resolution failed", failure); });
        }
    }

    private void publish() {
        if (closed) return;
        List<MediaSession.QueueItem> published = new ArrayList<>();
        if (current >= 0 && current < occurrences.size()) {
            for (Occurrence occurrence : window) {
                MediaDescription description = descriptions.get(occurrence.id);
                if (description != null) published.add(new MediaSession.QueueItem(description, occurrence.id));
            }
        }
        session.setQueue(published);
        publishState();
    }

    private void publishState() {
        PlaybackState state = session.getController().getPlaybackState();
        if (state == null) return;
        long active = current >= 0 && current < occurrences.size() ? occurrences.get(current).id : -1;
        long actions = state.getActions() & ~PlaybackState.ACTION_SKIP_TO_QUEUE_ITEM;
        if (!descriptions.isEmpty()) actions |= PlaybackState.ACTION_SKIP_TO_QUEUE_ITEM;
        session.setPlaybackState(new PlaybackState.Builder(state).setActiveQueueItemId(active).setActions(actions).build());
    }

    private void failed(String message, Object failure) {
        if (closed) return;
        Log.w(TAG, message, failure instanceof Throwable ? (Throwable) failure : null);
        generation++;
        dispose(metadataSubscriptions);
        occurrences.clear();
        window.clear();
        descriptions.clear();
        current = -1;
        publish();
    }

    private interface Receive { void accept(Object value); }

    private static Object subscribe(Object observable, Receive value, Receive error) throws Exception {
        Class<?> consumer = Class.forName("io.reactivex.rxjava3.functions.Consumer");
        Object onValue = consumer(consumer, value);
        Object onError = consumer(consumer, error);
        Method subscribe = Class.forName("io.reactivex.rxjava3.core.Observable").getMethod("subscribe", consumer, consumer);
        return subscribe.invoke(observable, onValue, onError);
    }

    private static Object consumer(Class<?> type, Receive receive) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            if (method.getName().equals("accept")) { receive.accept(args[0]); return null; }
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            return "SoundCloud queue consumer";
        });
    }

    private static void dispose(List<Object> subscriptions) {
        for (Object disposable : subscriptions) disposeOne(disposable);
        subscriptions.clear();
    }

    private static void disposeOne(Object disposable) {
        try { Class.forName("io.reactivex.rxjava3.disposables.Disposable").getMethod("dispose").invoke(disposable); }
        catch (Exception failure) { Log.w(TAG, "Queue subscription disposal failed", failure); }
    }

    private static MediaDescription description(Object compat) {
        Bundle bundle = (Bundle) field(compat, Bundle.class);
        if (bundle == null) return null;
        String title = bundle.getString("android.media.metadata.TITLE");
        if (title == null || title.isEmpty()) return null;
        String artwork = bundle.getString("android.media.metadata.ALBUM_ART_URI");
        return new MediaDescription.Builder().setMediaId(bundle.getString("android.media.metadata.MEDIA_ID"))
            .setTitle(title).setSubtitle(bundle.getString("android.media.metadata.ARTIST"))
            .setIconUri(artwork == null ? null : Uri.parse(artwork)).build();
    }

    private static Object field(Object owner, Class<?> type) {
        if (owner == null) return null;
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) for (Field field : c.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != type) continue;
            try { field.setAccessible(true); return field.get(owner); }
            catch (Exception failure) { return null; }
        }
        return null;
    }

    private static MediaSession frameworkSession(Object owner, int depth) throws IllegalAccessException {
        if (owner == null || depth > 2) return null;
        if (owner instanceof MediaSession) return (MediaSession) owner;
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) for (Field field : c.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            if (field.getType() != MediaSession.class && !field.getType().getName().contains("MediaSessionImpl")) continue;
            field.setAccessible(true);
            MediaSession result = frameworkSession(field.get(owner), depth + 1);
            if (result != null) return result;
        }
        return null;
    }

    // Bound to the exact producer types/methods by the patch.
    static Object provider(Object service) { return null; }
    static Object updates(Object service) { return null; }
    static Object metadata(Object provider) { return null; }
    static Object resolveMetadata(Object source, Object item) { return null; }
    static Object callbackSession(Object callback) { return null; }
    static void selectPosition(Object provider, int index) {}
    static boolean eligible(Object provider, Object item) { return false; }
}
