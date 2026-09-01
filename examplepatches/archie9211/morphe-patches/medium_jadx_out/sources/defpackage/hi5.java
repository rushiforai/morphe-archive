package defpackage;

import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hi5 implements Runnable, sh3 {
    public final Handler a;
    public final Runnable b;

    public hi5(Handler handler, Runnable runnable) {
        this.a = handler;
        this.b = runnable;
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.a.removeCallbacks(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.b.run();
        } catch (Throwable th) {
            ok7.H(th);
        }
    }
}
