package com.bytedance.adsdk.zb.sya;

import android.graphics.PointF;
import b.c0;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    public ycx f23030dj;

    /* renamed from: ea, reason: collision with root package name */
    public boolean f23031ea;
    public int fby;

    /* renamed from: jc, reason: collision with root package name */
    public float f23032jc;

    /* renamed from: jw, reason: collision with root package name */
    public int f23033jw;

    /* renamed from: lt, reason: collision with root package name */
    public float f23034lt;
    public int lud;

    /* renamed from: ok, reason: collision with root package name */
    public PointF f23035ok;

    /* renamed from: ry, reason: collision with root package name */
    public PointF f23036ry;
    public float sya;

    /* renamed from: ul, reason: collision with root package name */
    public float f23037ul;
    public String ycx;

    /* renamed from: zb, reason: collision with root package name */
    public String f23038zb;

    public enum ycx {
        LEFT_ALIGN,
        RIGHT_ALIGN,
        CENTER
    }

    public zb(String str, String str2, float f11, ycx ycxVar, int i5, float f12, float f13, int i11, int i12, float f14, boolean z11, PointF pointF, PointF pointF2) {
        ycx(str, str2, f11, ycxVar, i5, f12, f13, i11, i12, f14, z11, pointF, pointF2);
    }

    public int hashCode() {
        int iOrdinal = ((this.f23030dj.ordinal() + (((int) (c0.e(this.ycx.hashCode() * 31, 31, this.f23038zb) + this.sya)) * 31)) * 31) + this.lud;
        long jFloatToRawIntBits = Float.floatToRawIntBits(this.f23034lt);
        return (((iOrdinal * 31) + ((int) (jFloatToRawIntBits ^ (jFloatToRawIntBits >>> 32)))) * 31) + this.fby;
    }

    public void ycx(String str, String str2, float f11, ycx ycxVar, int i5, float f12, float f13, int i11, int i12, float f14, boolean z11, PointF pointF, PointF pointF2) {
        this.ycx = str;
        this.f23038zb = str2;
        this.sya = f11;
        this.f23030dj = ycxVar;
        this.lud = i5;
        this.f23034lt = f12;
        this.f23037ul = f13;
        this.fby = i11;
        this.f23033jw = i12;
        this.f23032jc = f14;
        this.f23031ea = z11;
        this.f23035ok = pointF;
        this.f23036ry = pointF2;
    }

    public zb() {
    }
}
