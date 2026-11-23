package nl.johninnl.eclipse.app;

import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/** Stand-in for the app's already-completed future, created by {@link j62#n0(Object)}. */
public final class m54 implements ai5 {
    @Override public void a(Runnable listener, Executor executor) { }

    @Override public boolean cancel(boolean mayInterrupt) { return false; }

    @Override public Object get() { return null; }

    @Override public Object get(long timeout, TimeUnit unit) { return null; }

    @Override public boolean isCancelled() { return false; }

    @Override public boolean isDone() { return true; }
}
