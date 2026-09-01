package defpackage;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Semaphore;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mc7 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ rc7 b;

    public /* synthetic */ mc7(rc7 rc7Var, int i) {
        this.a = i;
        this.b = rc7Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        rc7 rc7Var = this.b;
        switch (i) {
            case 0:
                Semaphore semaphore = rc7Var.J;
                s22 s22Var = rc7Var.m;
                if (s22Var == null) {
                    return;
                }
                try {
                    semaphore.acquire();
                    s22Var.n(rc7Var.b.d());
                    if (rc7.O && rc7Var.H) {
                        Handler handler = rc7Var.K;
                        if (handler == null) {
                            handler = new Handler(Looper.getMainLooper());
                            rc7Var.K = handler;
                            rc7Var.L = new mc7(rc7Var, 1);
                        }
                        handler.post(rc7Var.L);
                    }
                    break;
                } catch (InterruptedException unused) {
                } catch (Throwable th) {
                    semaphore.release();
                    throw th;
                }
                semaphore.release();
                return;
            default:
                Drawable.Callback callback = rc7Var.getCallback();
                if (callback != null) {
                    callback.invalidateDrawable(rc7Var);
                    return;
                }
                return;
        }
    }
}
