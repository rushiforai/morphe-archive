package com.bytedance.adsdk.zb.ul;

/* loaded from: classes2.dex */
public class sya {
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23124zb;

    public sya(float f11, float f12) {
        this.ycx = f11;
        this.f23124zb = f12;
    }

    public String toString() {
        return ycx() + "x" + zb();
    }

    public float ycx() {
        return this.ycx;
    }

    public float zb() {
        return this.f23124zb;
    }

    public void ycx(float f11, float f12) {
        this.ycx = f11;
        this.f23124zb = f12;
    }

    public boolean zb(float f11, float f12) {
        return this.ycx == f11 && this.f23124zb == f12;
    }

    public sya() {
        this(1.0f, 1.0f);
    }
}
