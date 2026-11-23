package nl.johninnl.eclipse.auto.app;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;
import nl.johninnl.eclipse.app.c12;
import nl.johninnl.eclipse.app.gy2;
import nl.johninnl.eclipse.app.hka;
import nl.johninnl.eclipse.app.q12;
import nl.johninnl.eclipse.app.tz1;
import nl.johninnl.eclipse.app.zv8;

/**
 * Calls the app's Kotlin suspend functions (design section 5.5). R8 narrowed the loaders'
 * continuation parameters to {@code vz1} or {@code hka}, so a plain Continuation is rejected by the
 * verifier; {@link Call} extends {@code hka}, which extends {@code vz1}, and one class satisfies
 * every loader signature. Invoke {@link #run} on the main thread; the result is always delivered on
 * the main thread.
 */
public final class Suspend {
    /** Receives the loader's value, or the failure it ended with. */
    public interface Callback {
        void done(Object value, Throwable failure);
    }

    /** One suspend call: pass the {@code call} as the loader's continuation argument. */
    public interface Loader {
        Object invoke(Call call);
    }

    /** The outermost continuation: it only forwards the final result to the callback's executor. */
    static final class Terminal implements tz1 {
        private final Callback callback;
        private final Executor executor;

        Terminal(Callback callback, Executor executor) {
            this.callback = callback;
            this.executor = executor;
        }

        @Override public c12 getContext() { return gy2.q; }

        @Override public void resumeWith(Object result) { deliver(result); }

        void deliver(final Object result) {
            executor.execute(new Runnable() {
                @Override public void run() {
                    try {
                        if (result instanceof zv8) callback.done(null, ((zv8) result).q);
                        else callback.done(result, null);
                    } catch (Throwable ignored) {
                        // A failing callback must not break the app's coroutine machinery.
                    }
                }
            });
        }
    }

    /** The continuation handed to the loader; resuming it runs {@link #invokeSuspend}. */
    public static final class Call extends hka {
        Call(Terminal terminal) { super(0, terminal); }

        @Override public Object invokeSuspend(Object result) {
            if (result instanceof zv8) Suspend.<RuntimeException>sneakyThrow(((zv8) result).q);
            return result;
        }
    }

    /** Run {@code loader}; {@code callback} runs on the main thread with its result or failure. */
    public static void run(Loader loader, Callback callback) { run(loader, callback, mainExecutor()); }

    static void run(Loader loader, Callback callback, Executor executor) {
        Terminal terminal = new Terminal(callback, executor);
        Object result;
        try {
            result = loader.invoke(new Call(terminal));
        } catch (Throwable failure) {
            terminal.deliver(new zv8(failure));
            return;
        }
        // A suspended call resumes through the Call and its Terminal later; anything else is the value.
        if (result != q12.COROUTINE_SUSPENDED) terminal.deliver(result);
    }

    private static Executor mainExecutor() {
        final Handler main = new Handler(Looper.getMainLooper());
        return new Executor() { @Override public void execute(Runnable command) { main.post(command); } };
    }

    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void sneakyThrow(Throwable failure) throws T { throw (T) failure; }

    private Suspend() { }
}
