package com.bytedance.sdk.openadsdk.utils;

import android.os.SystemClock;

/* loaded from: classes2.dex */
public class dwi {
    public long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f27134zb;

    private dwi(boolean z11) {
        if (z11) {
            lud();
        }
    }

    public static dwi sya() {
        return new dwi(false);
    }

    public static dwi zb() {
        return new dwi(true);
    }

    public long dj() {
        return SystemClock.elapsedRealtime() - this.f27134zb;
    }

    public boolean lt() {
        return this.f27134zb > 0;
    }

    public void lud() {
        this.ycx = System.currentTimeMillis();
        this.f27134zb = SystemClock.elapsedRealtime();
    }

    public String toString() {
        return String.valueOf(this.ycx);
    }

    public long ycx() {
        return this.f27134zb;
    }

    public long ycx(dwi dwiVar) {
        return Math.abs(dwiVar.f27134zb - this.f27134zb);
    }
}
