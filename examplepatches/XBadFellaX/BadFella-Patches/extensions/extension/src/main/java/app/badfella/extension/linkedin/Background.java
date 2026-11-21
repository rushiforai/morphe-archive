package app.badfella.extension.linkedin;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** One low-priority thread for work the feed must not wait for, such as parsing a post for its ⋯ menu. */
final class Background {
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(() -> {
            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
            task.run();
        }, "badfella-background");
        thread.setDaemon(true);
        return thread;
    });

    private Background() {
    }

    static void run(Runnable task) {
        try {
            EXECUTOR.execute(() -> {
                try {
                    task.run();
                } catch (Throwable t) {
                    Diagnostics.error("background task failed", t);
                }
            });
        } catch (RuntimeException rejected) {
            Diagnostics.error("background task rejected", rejected);
        }
    }
}
