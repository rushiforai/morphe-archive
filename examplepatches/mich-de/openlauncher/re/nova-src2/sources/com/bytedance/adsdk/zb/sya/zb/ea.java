package com.bytedance.adsdk.zb.sya.zb;

import android.graphics.PointF;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ea implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23041dj;
    private final boolean lud;
    private final com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> f23042zb;

    public ea(String str, com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVar, com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVar2, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, boolean z11) {
        this.ycx = str;
        this.f23042zb = ryVar;
        this.sya = ryVar2;
        this.f23041dj = zbVar;
        this.lud = z11;
    }

    public com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> dj() {
        return this.f23042zb;
    }

    public boolean lud() {
        return this.lud;
    }

    public com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> sya() {
        return this.sya;
    }

    public String toString() {
        return "RectangleShape{position=" + this.f23042zb + ", size=" + this.sya + AbstractJsonLexerKt.END_OBJ;
    }

    public String ycx() {
        return this.ycx;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb zb() {
        return this.f23041dj;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.syc(jwVar, ycxVar, this);
    }
}
