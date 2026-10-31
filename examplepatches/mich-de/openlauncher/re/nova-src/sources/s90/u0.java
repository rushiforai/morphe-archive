package s90;

import android.os.Trace;

/* loaded from: classes5.dex */
public final /* synthetic */ class u0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87032a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f87033b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Runnable f87034c;

    public /* synthetic */ u0(int i5, String str, Runnable runnable) {
        this.f87032a = i5;
        this.f87033b = str;
        this.f87034c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f87032a) {
            case 0:
                Runnable runnable = this.f87034c;
                p90.a.a("Cronet JavaUrlRequest#executeOnExecutor " + this.f87033b + " running callback");
                try {
                    runnable.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th2) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            default:
                Runnable runnable2 = this.f87034c;
                p90.a.a("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnUserExecutor " + this.f87033b + " running callback");
                try {
                    runnable2.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th4) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th5) {
                        th4.addSuppressed(th5);
                    }
                    throw th4;
                }
        }
    }
}
