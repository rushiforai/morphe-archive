package com.bytedance.adsdk.zb.lt;

/* loaded from: classes2.dex */
public class dj {
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f22905zb;

    public void ycx(float f11) {
        float f12 = this.ycx + f11;
        this.ycx = f12;
        int i5 = this.f22905zb + 1;
        this.f22905zb = i5;
        if (i5 == Integer.MAX_VALUE) {
            this.ycx = f12 / 2.0f;
            this.f22905zb = i5 / 2;
        }
    }
}
