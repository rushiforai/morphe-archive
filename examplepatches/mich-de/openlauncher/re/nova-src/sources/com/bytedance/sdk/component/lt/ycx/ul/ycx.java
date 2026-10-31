package com.bytedance.sdk.component.lt.ycx.ul;

import android.os.Handler;
import android.os.HandlerThread;
import com.bytedance.sdk.component.lt.ycx.lud;
import com.bytedance.sdk.component.lt.ycx.ul;

/* loaded from: classes2.dex */
public class ycx {
    private static int sya = 3000;
    private static volatile HandlerThread ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile Handler f23863zb;

    static {
        sya();
    }

    private static void sya() {
        HandlerThread handlerThreadYcx;
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc != null && (handlerThreadYcx = ludVarSyc.ycx("csj_ad_log", 10)) != null) {
            ycx = handlerThreadYcx;
            return;
        }
        HandlerThread handlerThread = new HandlerThread("csj_ad_log", 10);
        ycx = handlerThread;
        handlerThread.start();
    }

    public static Handler ycx() {
        if (ycx == null || !ycx.isAlive()) {
            synchronized (ycx.class) {
                try {
                    if (ycx == null || !ycx.isAlive()) {
                        sya();
                        f23863zb = new Handler(ycx.getLooper());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else if (f23863zb == null) {
            synchronized (ycx.class) {
                try {
                    if (f23863zb == null) {
                        f23863zb = new Handler(ycx.getLooper());
                    }
                } finally {
                }
            }
        }
        return f23863zb;
    }

    public static int zb() {
        if (sya <= 0) {
            sya = 3000;
        }
        return sya;
    }
}
