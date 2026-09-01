package defpackage;

import android.os.Trace;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ja6 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ Runnable c;

    public /* synthetic */ ja6(int i, Runnable runnable, String str) {
        this.a = i;
        this.b = str;
        this.c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Runnable runnable = this.c;
        String str = this.b;
        switch (i) {
            case 0:
                grb.f("Cronet JavaUrlRequest#executeOnExecutor " + str + " running callback");
                try {
                    runnable.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th) {
                    try {
                        Trace.endSection();
                        break;
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            default:
                grb.f("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnUserExecutor " + str + " running callback");
                try {
                    runnable.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th3) {
                    try {
                        Trace.endSection();
                        break;
                    } catch (Throwable th4) {
                        th3.addSuppressed(th4);
                    }
                    throw th3;
                }
        }
    }
}
