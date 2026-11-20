package org.mozilla.geckoview;

/** Stub of the GeckoResult members the extension uses (Focus 158.0 / GeckoView 158.0.1). */
public class GeckoResult<T> {
    public GeckoResult() {
        throw new RuntimeException("Stub!");
    }

    public static <U> GeckoResult<U> fromValue(U value) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<Void> accept(Consumer<T> valueConsumer, Consumer<Throwable> exceptionConsumer) {
        throw new RuntimeException("Stub!");
    }

    public synchronized void complete(T value) {
        throw new RuntimeException("Stub!");
    }

    public interface Consumer<T> {
        void accept(T t);
    }
}
