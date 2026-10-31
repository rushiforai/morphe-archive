package x4;

import android.os.Process;

/* loaded from: classes2.dex */
public final class i extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final int f95090a;

    public i(Runnable runnable) {
        super(runnable, "fonts-androidx");
        this.f95090a = 10;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        Process.setThreadPriority(this.f95090a);
        super.run();
    }
}
