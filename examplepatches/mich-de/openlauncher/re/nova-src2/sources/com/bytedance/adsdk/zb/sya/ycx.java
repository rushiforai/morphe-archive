package com.bytedance.adsdk.zb.sya;

import android.annotation.SuppressLint;
import android.graphics.PointF;

/* loaded from: classes2.dex */
public class ycx {
    private final PointF sya;
    private final PointF ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final PointF f23021zb;

    public ycx() {
        this.ycx = new PointF();
        this.f23021zb = new PointF();
        this.sya = new PointF();
    }

    public void sya(float f11, float f12) {
        this.sya.set(f11, f12);
    }

    @SuppressLint({"DefaultLocale"})
    public String toString() {
        return String.format("v=%.2f,%.2f cp1=%.2f,%.2f cp2=%.2f,%.2f", Float.valueOf(this.sya.x), Float.valueOf(this.sya.y), Float.valueOf(this.ycx.x), Float.valueOf(this.ycx.y), Float.valueOf(this.f23021zb.x), Float.valueOf(this.f23021zb.y));
    }

    public void ycx(float f11, float f12) {
        this.ycx.set(f11, f12);
    }

    public void zb(float f11, float f12) {
        this.f23021zb.set(f11, f12);
    }

    public PointF sya() {
        return this.sya;
    }

    public PointF ycx() {
        return this.ycx;
    }

    public PointF zb() {
        return this.f23021zb;
    }

    public ycx(PointF pointF, PointF pointF2, PointF pointF3) {
        this.ycx = pointF;
        this.f23021zb = pointF2;
        this.sya = pointF3;
    }
}
