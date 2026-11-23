package nl.johninnl.eclipse.app;

import java.util.concurrent.Executor;
import java.util.concurrent.Future;

/** Stand-in for the app's listenable future: a Future that can notify a listener on an executor. */
public interface ai5 extends Future {
    void a(Runnable listener, Executor executor);
}
