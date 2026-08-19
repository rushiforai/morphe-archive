package de.robv.android.xposed;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 */
public class ClassNotFoundError extends Error {

    public ClassNotFoundError(Throwable cause) {
        super(cause);
    }

    public ClassNotFoundError(String detailMessage, Throwable cause) {
        super(detailMessage, cause);
    }
}
