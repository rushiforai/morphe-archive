package cl;

import android.os.Process;
import android.util.Log;

/* loaded from: classes3.dex */
public final class k1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20029a;

    /* renamed from: b, reason: collision with root package name */
    public final Runnable f20030b;

    public /* synthetic */ k1(Runnable runnable, int i5) {
        this.f20029a = i5;
        this.f20030b = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        switch (this.f20029a) {
            case 0:
                this.f20030b.run();
                break;
            case 1:
                try {
                    this.f20030b.run();
                    break;
                } catch (RuntimeException e3) {
                    Log.e("ServiceConnMgrImpl", "error caused by ", e3);
                    return;
                }
            case 2:
                Thread.currentThread().setName("JavaCronetEngine");
                Process.setThreadPriority(0);
                this.f20030b.run();
                break;
            default:
                Process.setThreadPriority(0);
                this.f20030b.run();
                break;
        }
    }

    public String toString() {
        switch (this.f20029a) {
            case 0:
                return this.f20030b.toString();
            default:
                return super.toString();
        }
    }
}
