package com.bytedance.sdk.component.fby.ycx;

import android.os.Handler;
import com.bytedance.sdk.component.utils.fby;
import com.bytedance.sdk.component.utils.tru;

/* loaded from: classes2.dex */
public class ycx {
    private final dj<zb> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Handler f23746zb;

    /* renamed from: com.bytedance.sdk.component.fby.ycx.ycx$ycx, reason: collision with other inner class name */
    public static class C0037ycx {
        private static final ycx ycx = new ycx();
    }

    public Handler zb() {
        if (this.f23746zb == null) {
            synchronized (ycx.class) {
                try {
                    if (this.f23746zb == null) {
                        this.f23746zb = ycx("csj_io_handler");
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f23746zb;
    }

    private ycx() {
        this.ycx = dj.ycx(2);
    }

    public static ycx ycx() {
        return C0037ycx.ycx;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(final Handler handler, final Handler handler2) {
        if (handler.getLooper().getQueue().isIdle()) {
            handler.removeCallbacksAndMessages(null);
            handler.getLooper().quit();
        } else {
            handler2.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.fby.ycx.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.ycx(handler, handler2);
                }
            }, 1000L);
        }
    }

    private zb zb(tru.ycx ycxVar, String str) {
        return new zb(fby.ycx(str), ycxVar);
    }

    public tru ycx(tru.ycx ycxVar, final String str) {
        zb zbVar = (zb) this.ycx.ycx();
        if (zbVar != null) {
            zbVar.ycx(ycxVar);
            zbVar.post(new Runnable() { // from class: com.bytedance.sdk.component.fby.ycx.ycx.2
                @Override // java.lang.Runnable
                public void run() {
                    Thread.currentThread().setName(str);
                }
            });
            return zbVar;
        }
        return zb(ycxVar, str);
    }

    public tru ycx(String str) {
        return ycx((tru.ycx) null, str);
    }

    public boolean ycx(tru truVar) {
        if (!(truVar instanceof zb)) {
            return false;
        }
        zb zbVar = (zb) truVar;
        if (this.ycx.ycx((dj<zb>) zbVar)) {
            return true;
        }
        zbVar.zb();
        return true;
    }
}
