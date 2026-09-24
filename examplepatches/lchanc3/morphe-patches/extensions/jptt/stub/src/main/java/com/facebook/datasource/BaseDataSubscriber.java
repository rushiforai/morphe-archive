package com.facebook.datasource;

/**
 * Stub of the class already present in the JPTT APK.
 *
 * <p>The bodies here are never compiled into the extension; only the signatures
 * matter. At runtime the real Fresco implementation is used, which closes the
 * data source after {@code onNewResultImpl} / {@code onFailureImpl} returns.
 *
 * <p>{@code onProgressUpdate} is deliberately left unimplemented, because the
 * class in the APK does not implement it either: R8 removed the empty override
 * since the only subclass it kept, {@code AbstractDraweeController$2},
 * overrides the method itself. A subscriber that inherits it instead of
 * declaring its own dies with {@link AbstractMethodError} as soon as Fresco
 * reports download progress. Leaving it abstract here makes the compiler say so.
 */
@SuppressWarnings("ALL")
public abstract class BaseDataSubscriber implements DataSubscriber {

    @Override
    public void onCancellation(DataSource dataSource) {
    }

    @Override
    public void onFailure(DataSource dataSource) {
    }

    @Override
    public void onNewResult(DataSource dataSource) {
    }

    protected abstract void onFailureImpl(DataSource dataSource);

    protected abstract void onNewResultImpl(DataSource dataSource);
}
