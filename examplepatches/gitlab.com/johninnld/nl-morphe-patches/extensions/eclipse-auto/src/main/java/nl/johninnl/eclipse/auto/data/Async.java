package nl.johninnl.eclipse.auto.data;

/** A result that arrives later, always on the main thread: a value, or the failure that prevented one. */
public interface Async<T> {
    void done(T value, Throwable failure);
}
