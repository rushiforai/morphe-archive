package w20;

import java.lang.Thread;

/* loaded from: classes4.dex */
public final class g0 implements Thread.UncaughtExceptionHandler {

    /* renamed from: a, reason: collision with root package name */
    public final Thread.UncaughtExceptionHandler f93680a;

    /* renamed from: b, reason: collision with root package name */
    public final n00.d f93681b;

    /* renamed from: c, reason: collision with root package name */
    public final sx.d f93682c;

    public g0(Thread.UncaughtExceptionHandler uncaughtExceptionHandler, n00.d dVar) {
        sx.d dVar2 = new sx.d(29);
        this.f93680a = uncaughtExceptionHandler;
        this.f93681b = dVar;
        this.f93682c = dVar2;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th2) {
        Throwable th3 = th2;
        int i5 = 0;
        while (th3 != null && i5 < 10) {
            if (th3.getClass().getName().equals("org.chromium.base.process_launcher.ChildProcessConnection$ChildProcessMismatchException")) {
                this.f93681b.invoke();
                mc0.d.f76206a.p(th2, "WebView package updated mid-process; killing PID for AMS respawn", new Object[0]);
                this.f93682c.invoke();
                return;
            } else {
                Throwable cause = th3.getCause();
                if (cause == th3) {
                    break;
                }
                i5++;
                th3 = cause;
            }
        }
        Thread.UncaughtExceptionHandler uncaughtExceptionHandler = this.f93680a;
        if (uncaughtExceptionHandler != null) {
            uncaughtExceptionHandler.uncaughtException(thread, th2);
        }
    }
}
