package com.bytedance.sdk.component.lt.ycx.dj.zb;

/* loaded from: classes2.dex */
public class ycx {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23833zb;

    public ycx(int i5, int i11, long j11) {
        if (i11 < i5) {
            throw new IllegalStateException("atMostBatchSendCount should meet a condition (atMostBatchSendCount >= maxCacheCount)");
        }
        this.ycx = i5;
        this.f23833zb = i11;
    }

    public static ycx sya() {
        return new ycx(1, 100, 172800000L);
    }

    public int ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f23833zb;
    }

    public static ycx ycx(int i5, int i11) {
        return new ycx(i5, i11, 172800000L);
    }
}
