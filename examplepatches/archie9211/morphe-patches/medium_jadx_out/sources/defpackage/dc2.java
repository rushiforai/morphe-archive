package defpackage;

import java.lang.Thread;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dc2 implements Thread.UncaughtExceptionHandler {
    public static final dq1 b = new dq1(15);
    public static dc2 c;
    public final Thread.UncaughtExceptionHandler a;

    public dc2(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.a = uncaughtExceptionHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th) {
        thread.getClass();
        th.getClass();
        Throwable th2 = null;
        Throwable cause = th;
        loop0: while (true) {
            if (cause == null || cause == th2) {
                break;
            }
            StackTraceElement[] stackTrace = cause.getStackTrace();
            stackTrace.getClass();
            for (StackTraceElement stackTraceElement : stackTrace) {
                stackTraceElement.getClass();
                if (xz5.b0(stackTraceElement)) {
                    flb.g0(th);
                    vv2.u(th, x36.CrashReport).b();
                    break loop0;
                }
            }
            th2 = cause;
            cause = cause.getCause();
        }
        Thread.UncaughtExceptionHandler uncaughtExceptionHandler = this.a;
        if (uncaughtExceptionHandler != null) {
            uncaughtExceptionHandler.uncaughtException(thread, th);
        }
    }
}
