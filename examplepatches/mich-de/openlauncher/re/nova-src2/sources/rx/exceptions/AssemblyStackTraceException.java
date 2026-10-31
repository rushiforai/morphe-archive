package rx.exceptions;

/* loaded from: classes5.dex */
public final class AssemblyStackTraceException extends RuntimeException {
    @Override // java.lang.Throwable
    public final synchronized Throwable fillInStackTrace() {
        return this;
    }
}
