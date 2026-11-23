package nl.johninnl.eclipse.auto.data;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.io.File;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/**
 * Builds the {@link Catalog} the car surfaces share the shape of: one background thread for the
 * requests, results posted to the main looper, the on-disk cache under {@code cacheDir/eclipse_auto}
 * (so the templated screens and the classic tree see the same cached feeds), real clocks.
 */
public final class CatalogFactory {
    /** A daemon thread for the feed requests; the caller shuts it down when its surface ends. */
    public static ExecutorService newExecutor() {
        return Executors.newSingleThreadExecutor(new ThreadFactory() {
            @Override public Thread newThread(Runnable task) {
                Thread thread = new Thread(task, "eclipse-auto-feed");
                thread.setDaemon(true);
                return thread;
            }
        });
    }

    public static Catalog create(Context context, AppPort app, ExecutorService executor, Runnable onChange) {
        final Handler main = new Handler(Looper.getMainLooper());
        ComposeCache.Clock clock = new ComposeCache.Clock() {
            @Override public long now() { return System.currentTimeMillis(); }

            @Override public String utcDay() { return LocalDate.now(ZoneOffset.UTC).toString(); }
        };
        return new Catalog(app, new ComposeClient(), new ComposeCache(new File(context.getCacheDir(), "eclipse_auto"), clock),
            executor, new Catalog.Poster() {
                @Override public void post(Runnable task) { main.post(task); }
            }, clock, onChange);
    }

    private CatalogFactory() { }
}
