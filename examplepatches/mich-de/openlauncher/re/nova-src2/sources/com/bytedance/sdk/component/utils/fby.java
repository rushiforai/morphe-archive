package com.bytedance.sdk.component.utils;

import android.os.HandlerThread;

/* loaded from: classes2.dex */
public class fby {
    public static volatile boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static HandlerThread f24103zb;

    public static void ycx(HandlerThread handlerThread) {
        f24103zb = handlerThread;
    }

    public static HandlerThread ycx(String str) {
        return ycx(str, 0);
    }

    public static HandlerThread ycx(String str, int i5) {
        if (ycx) {
            return f24103zb;
        }
        try {
            HandlerThread handlerThread = new HandlerThread(str, i5) { // from class: com.bytedance.sdk.component.utils.fby.1
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
            handlerThread.start();
            return handlerThread;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "c+8jkQ+5e/OIWNJciCS0IVf9", "SO8rkCCubMaUT/9cghWsLUnaJYcGvW0=", 41);
            htf.ycx("HandlerThreadUtils", "new handlerThread error", th2);
            return f24103zb;
        }
    }
}
