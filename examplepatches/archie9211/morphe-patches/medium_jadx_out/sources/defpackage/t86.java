package defpackage;

import android.os.Process;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t86 implements Runnable {
    public final /* synthetic */ int a;
    public final Runnable b;

    public /* synthetic */ t86(int i, Runnable runnable) {
        this.a = i;
        this.b = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Runnable runnable = this.b;
        switch (i) {
            case 0:
                Thread.currentThread().setName("JavaCronetEngine");
                Process.setThreadPriority(0);
                runnable.run();
                break;
            case 1:
                try {
                    runnable.run();
                } catch (Exception e) {
                    n01.U(e, "Executor", "Background execution failure.");
                    return;
                }
                break;
            case 2:
                runnable.run();
                break;
            default:
                Process.setThreadPriority(0);
                runnable.run();
                break;
        }
    }

    public String toString() {
        switch (this.a) {
            case 2:
                return this.b.toString();
            default:
                return super.toString();
        }
    }
}
