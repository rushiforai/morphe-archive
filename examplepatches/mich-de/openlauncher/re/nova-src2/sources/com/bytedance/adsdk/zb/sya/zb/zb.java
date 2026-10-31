package com.bytedance.adsdk.zb.sya.zb;

import android.graphics.PointF;

/* loaded from: classes2.dex */
public class zb implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f23102dj;
    private final boolean lud;
    private final com.bytedance.adsdk.zb.sya.ycx.lt sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> f23103zb;

    public zb(String str, com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVar, com.bytedance.adsdk.zb.sya.ycx.lt ltVar, boolean z11, boolean z12) {
        this.ycx = str;
        this.f23103zb = ryVar;
        this.sya = ltVar;
        this.f23102dj = z11;
        this.lud = z12;
    }

    public boolean dj() {
        return this.f23102dj;
    }

    public boolean lud() {
        return this.lud;
    }

    public com.bytedance.adsdk.zb.sya.ycx.lt sya() {
        return this.sya;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.lt(jwVar, ycxVar, this);
    }

    public com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> zb() {
        return this.f23103zb;
    }

    public String ycx() {
        return this.ycx;
    }
}
