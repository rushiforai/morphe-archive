package nl.johninnl.medium.reader;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.CopyOnWriteArrayList;

/** Process-local reader configuration/status only. No behavioral upload or account state. */
public final class ReaderRuntime {
    private static final ThreadPoolExecutor WORKERS = new ThreadPoolExecutor(2, 2, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(8), runnable -> { Thread thread = new Thread(runnable, "medium-reader-io"); thread.setDaemon(true); return thread; });
    private static final ConcurrentHashMap<String, ReaderStatus> STATES = new ConcurrentHashMap<>();
    public interface Retry { boolean request(); }
    private static final ConcurrentHashMap<String, Retry> RETRIES = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, CopyOnWriteArrayList<ReaderStatus.Sink>> LISTENERS = new ConcurrentHashMap<>();
    private static volatile ArticleLoader source = (request, cancellation) -> { throw new ArticleException("NOT_INITIALIZED", "Reader is not initialized"); };
    private ReaderRuntime() {}
    public static void configure(ArticleLoader loader) { source = java.util.Objects.requireNonNull(loader); }
    public static ArticleLoader loader() { return source; }
    public static ExecutorService workers() { return WORKERS; }
    public static ReaderStatus status(String postId) { return STATES.get(postId); }
    public static void bindRetry(String postId, Retry retry) {
        RETRIES.put(postId, retry);
        if (RETRIES.size() > 128) for (String id : RETRIES.keySet()) {
            if (!id.equals(postId)) { RETRIES.remove(id); break; }
        }
    }
    public static boolean retry(String postId) {
        Retry retry = RETRIES.get(postId);
        return retry != null && retry.request();
    }
    public static AutoCloseable listen(String postId, ReaderStatus.Sink listener) {
        CopyOnWriteArrayList<ReaderStatus.Sink> listeners = LISTENERS.computeIfAbsent(postId, ignored -> new CopyOnWriteArrayList<>());
        listeners.add(listener);
        return () -> { listeners.remove(listener); if (listeners.isEmpty()) LISTENERS.remove(postId, listeners); };
    }
    public static void publish(ReaderStatus status) {
        if ("UNAVAILABLE".equals(status.phase)) android.util.Log.w("MediumNativeReader", "post=" + status.postId + " code=" + status.code);
        STATES.put(status.postId, status);
        CopyOnWriteArrayList<ReaderStatus.Sink> listeners = LISTENERS.get(status.postId);
        if (listeners != null) for (ReaderStatus.Sink listener : listeners) listener.publish(status);
        if (STATES.size() > 128) for (String id : STATES.keySet()) { if (!id.equals(status.postId)) { STATES.remove(id); break; } }
    }
}
