package com.bytedance.sdk.component.fby.ycx;

import android.os.Handler;
import android.os.HandlerThread;
import com.bytedance.sdk.component.utils.htf;

/* loaded from: classes2.dex */
final class lud {
    private static volatile lud ycx;
    private volatile Handler sya;

    /* renamed from: zb, reason: collision with root package name */
    private volatile HandlerThread f23744zb;

    private lud() {
        zb();
    }

    private boolean sya() {
        return (this.f23744zb == null || this.sya == null || !this.f23744zb.isAlive()) ? false : true;
    }

    public static lud ycx() {
        if (ycx == null) {
            synchronized (lud.class) {
                try {
                    if (ycx == null) {
                        ycx = new lud();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    private void zb() {
        try {
            if (sya()) {
                return;
            }
            this.f23744zb = new HandlerThread("csj_dispatch_msg") { // from class: com.bytedance.sdk.component.fby.ycx.lud.1
                boolean ycx = false;

                @Override // java.lang.Thread
                public synchronized void start() {
                    if (this.ycx) {
                        return;
                    }
                    this.ycx = true;
                    super.start();
                }
            };
            this.f23744zb.start();
            this.sya = new Handler(this.f23744zb.getLooper());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOdArJty4VY", "b9oJnBCsaNODQuNVnhShLA==", "T/w0thG5aNOFYtZTiB2lOg==", 60);
            htf.ycx("TTDispatchThread", "new handlerThread error", th2);
        }
    }

    public void ycx(Runnable runnable) {
        Handler handler;
        if (sya() && (handler = this.sya) != null) {
            handler.post(runnable);
        } else {
            runnable.run();
        }
    }
}
