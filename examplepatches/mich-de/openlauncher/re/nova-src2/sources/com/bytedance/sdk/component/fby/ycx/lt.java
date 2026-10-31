package com.bytedance.sdk.component.fby.ycx;

import android.os.Handler;

/* loaded from: classes2.dex */
public abstract class lt {
    public final Handler ycx;

    public lt(Handler handler) {
        this.ycx = handler;
    }

    public void sya(Runnable runnable) {
        lud.ycx().ycx(runnable);
    }

    public void ycx(final Runnable runnable) {
        if (ycx()) {
            sya(new Runnable() { // from class: com.bytedance.sdk.component.fby.ycx.lt.1
                @Override // java.lang.Runnable
                public void run() {
                    Handler handler = lt.this.ycx;
                    if (handler != null) {
                        handler.post(runnable);
                    }
                }
            });
            return;
        }
        Handler handler = this.ycx;
        if (handler != null) {
            handler.post(runnable);
        }
    }

    public abstract boolean ycx();

    public void zb(final Runnable runnable) {
        if (ycx()) {
            sya(new Runnable() { // from class: com.bytedance.sdk.component.fby.ycx.lt.2
                @Override // java.lang.Runnable
                public void run() {
                    Handler handler = lt.this.ycx;
                    if (handler != null) {
                        handler.removeCallbacks(runnable);
                    }
                }
            });
            return;
        }
        Handler handler = this.ycx;
        if (handler != null) {
            handler.removeCallbacks(runnable);
        }
    }

    public void ycx(final Runnable runnable, final long j11) {
        if (ycx()) {
            sya(new Runnable() { // from class: com.bytedance.sdk.component.fby.ycx.lt.3
                @Override // java.lang.Runnable
                public void run() {
                    Handler handler = lt.this.ycx;
                    if (handler != null) {
                        handler.postDelayed(runnable, j11);
                    }
                }
            });
            return;
        }
        Handler handler = this.ycx;
        if (handler != null) {
            handler.postDelayed(runnable, j11);
        }
    }
}
