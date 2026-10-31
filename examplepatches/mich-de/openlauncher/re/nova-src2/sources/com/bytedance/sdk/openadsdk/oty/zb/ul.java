package com.bytedance.sdk.openadsdk.oty.zb;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.bytedance.sdk.component.utils.htf;

/* loaded from: classes2.dex */
public class ul {
    private static ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static HandlerThread f26959zb;

    public static class ycx extends Handler {
        public ycx(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            zb zbVar = (zb) message.obj;
            if (zbVar == null) {
                return;
            }
            int iZb = zbVar.zb();
            if (iZb == 1) {
                zbVar.ul();
            } else {
                if (iZb != 2) {
                    lud.zb(zbVar.ea());
                    return;
                }
                zbVar.fby();
            }
            if (zbVar.jw()) {
                lud.zb(zbVar.ea());
            } else if (zbVar.ok()) {
                ycx(zbVar);
            }
        }

        public void ycx(zb zbVar) {
            if (zbVar == null) {
                return;
            }
            int iIntValue = zbVar.ea().intValue();
            if (hasMessages(iIntValue)) {
                return;
            }
            Message messageObtain = Message.obtain();
            messageObtain.what = iIntValue;
            messageObtain.obj = zbVar;
            sendMessageDelayed(messageObtain, zbVar.lt());
        }
    }

    public static void ycx() {
    }

    public static void zb(zb zbVar) {
        if (zbVar == null || ycx == null) {
            return;
        }
        try {
            int iIntValue = zbVar.ea().intValue();
            if (ycx.hasMessages(iIntValue)) {
                ycx.removeMessages(iIntValue);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5gDoStQoCCHAA==", "a88KoQqxbNWtS9lcixSy", "SesgmhW5XcaTQQ==", 44);
        }
    }

    public static void ycx(zb zbVar) {
        if (zbVar == null) {
            return;
        }
        zb();
        ycx ycxVar = ycx;
        if (ycxVar != null) {
            ycxVar.ycx(zbVar);
        }
    }

    public static void zb() {
        if (ycx != null) {
            return;
        }
        try {
            HandlerThread handlerThread = f26959zb;
            if (handlerThread != null && handlerThread.isAlive()) {
                return;
            }
            synchronized (ul.class) {
                try {
                    HandlerThread handlerThread2 = f26959zb;
                    if (handlerThread2 == null || !handlerThread2.isAlive()) {
                        f26959zb = com.bytedance.sdk.component.utils.fby.ycx("pag_MRC");
                        ycx = new ycx(f26959zb.getLooper());
                    }
                } finally {
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5gDoStQoCCHAA==", "a88KoQqxbNWtS9lcixSy", "UuAkgTe1ZMKSZ9ZTjRalOg==", 79);
            htf.sya("MRC", th2.getMessage());
        }
    }
}
