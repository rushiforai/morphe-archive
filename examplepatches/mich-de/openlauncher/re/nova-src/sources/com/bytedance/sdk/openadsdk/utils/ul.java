package com.bytedance.sdk.openadsdk.utils;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.SystemClock;

/* loaded from: classes2.dex */
public class ul {
    private static long sya = 0;
    static int ycx = -1;

    /* renamed from: zb, reason: collision with root package name */
    static float f27179zb;

    public static class ycx {
        public final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final float f27180zb;

        public ycx(int i5, float f11) {
            this.ycx = i5;
            this.f27180zb = f11;
        }
    }

    private static void ycx(Intent intent) {
        if (intent.getIntExtra("status", -1) == 2) {
            ycx = 1;
        } else {
            ycx = 0;
        }
        f27179zb = (intent.getIntExtra("level", -1) * 100) / intent.getIntExtra("scale", -1);
    }

    public static ycx ycx() {
        Intent intentRegisterReceiver;
        if ((sya == 0 || SystemClock.elapsedRealtime() - sya > 60000) && (intentRegisterReceiver = com.bytedance.sdk.openadsdk.core.pmi.ycx().registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"))) != null) {
            ycx(intentRegisterReceiver);
            sya = SystemClock.elapsedRealtime();
        }
        return new ycx(ycx, f27179zb);
    }
}
