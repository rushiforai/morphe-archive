package nl.johninnl.medium.reader;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/** Owns one bounded worker operation and exactly one terminal notification. */
public final class ReaderTask<T> {
    public interface Work<T> { T run(Cancellation cancellation) throws Exception; }
    public interface Completion<T> { void complete(Result<T> result); }
    public static final class Result<T> {
        public final T value;
        public final Throwable failure;
        public Result(T value, Throwable failure) { this.value = value; this.failure = failure; }
    }
    private final ExecutorService executor;
    private final Work<T> work;
    private final Cancellation cancellation;
    private final Completion<T> completion;
    private final AtomicBoolean started = new AtomicBoolean();
    private final AtomicBoolean terminal = new AtomicBoolean();
    private final AtomicReference<Future<?>> future = new AtomicReference<>();
    private volatile Cancellation.Registration registration;

    public ReaderTask(ExecutorService executor, Work<T> work, Cancellation cancellation, Completion<T> completion) {
        this.executor = executor; this.work = work; this.cancellation = cancellation; this.completion = completion;
    }

    public void start() {
        if (!started.compareAndSet(false, true)) throw new IllegalStateException("Reader task already started");
        registration = cancellation.onCancel(() -> {
            Future<?> submitted = future.get();
            if (submitted != null) submitted.cancel(true);
            if (executor instanceof ThreadPoolExecutor) ((ThreadPoolExecutor) executor).purge();
            finish(new Result<>(null, new ArticleException("CANCELLED", "Article operation was cancelled")));
        });
        if (terminal.get()) { registration.close(); return; }
        try {
            Future<?> submitted = executor.submit(() -> {
                Result<T> result;
                try {
                    cancellation.check();
                    T value = work.run(cancellation);
                    cancellation.check();
                    result = new Result<>(value, null);
                } catch (Throwable failure) { result = new Result<>(null, failure); }
                // A completion failure belongs to the continuation, not to the work result.
                finish(result);
            });
            future.set(submitted);
            if (cancellation.isCancelled()) {
                submitted.cancel(true);
                if (executor instanceof ThreadPoolExecutor) ((ThreadPoolExecutor) executor).purge();
            }
        } catch (RuntimeException rejected) { finish(new Result<>(null, rejected)); }
    }

    private void finish(Result<T> result) {
        if (!terminal.compareAndSet(false, true)) return;
        Cancellation.Registration current = registration;
        if (current != null) current.close();
        // Interrupting the worker can race its cancellation callback. Preserve
        // one cancellation result even when InterruptedException reaches us first.
        completion.complete(cancellation.isCancelled() ?
            new Result<>(null, new ArticleException("CANCELLED", "Article operation was cancelled")) : result);
    }
}
