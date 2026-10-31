package com.bytedance.sdk.openadsdk.oty.ycx;

import android.os.Handler;
import android.os.HandlerThread;
import com.bytedance.sdk.component.utils.fby;

/* loaded from: classes2.dex */
public class ycx {
    private static Handler ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static HandlerThread f26947zb;

    public static Handler ycx() {
        try {
            HandlerThread handlerThread = f26947zb;
            if (handlerThread == null || !handlerThread.isAlive()) {
                synchronized (ycx.class) {
                    try {
                        HandlerThread handlerThread2 = f26947zb;
                        if (handlerThread2 == null || !handlerThread2.isAlive()) {
                            f26947zb = fby.ycx("pag_ev");
                            ycx = new Handler(f26947zb.getLooper());
                        }
                    } finally {
                    }
                }
            } else if (ycx == null) {
                synchronized (ycx.class) {
                    try {
                        if (ycx == null) {
                            ycx = new Handler(f26947zb.getLooper());
                        }
                    } finally {
                    }
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5gDoStQoCiD", "a88KsDWJfc6MWQ==", "XOs5vQKybcuFWA==", 31);
        }
        return ycx;
    }
}
