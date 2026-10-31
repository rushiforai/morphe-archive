package com.bytedance.adsdk.zb.sya.zb;

import android.graphics.PointF;

/* loaded from: classes2.dex */
public class jc implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> f23047dj;

    /* renamed from: ea, reason: collision with root package name */
    private final boolean f23048ea;
    private final com.bytedance.adsdk.zb.sya.ycx.zb fby;

    /* renamed from: jc, reason: collision with root package name */
    private final boolean f23049jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23050jw;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23051lt;
    private final com.bytedance.adsdk.zb.sya.ycx.zb lud;
    private final com.bytedance.adsdk.zb.sya.ycx.zb sya;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23052ul;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx f23053zb;

    public enum ycx {
        STAR(1),
        POLYGON(2);

        private final int sya;

        ycx(int i5) {
            this.sya = i5;
        }

        public static ycx ycx(int i5) {
            for (ycx ycxVar : values()) {
                if (ycxVar.sya == i5) {
                    return ycxVar;
                }
            }
            return null;
        }
    }

    public jc(String str, ycx ycxVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2, com.bytedance.adsdk.zb.sya.ycx.zb zbVar3, com.bytedance.adsdk.zb.sya.ycx.zb zbVar4, com.bytedance.adsdk.zb.sya.ycx.zb zbVar5, com.bytedance.adsdk.zb.sya.ycx.zb zbVar6, boolean z11, boolean z12) {
        this.ycx = str;
        this.f23053zb = ycxVar;
        this.sya = zbVar;
        this.f23047dj = ryVar;
        this.lud = zbVar2;
        this.f23051lt = zbVar3;
        this.f23052ul = zbVar4;
        this.fby = zbVar5;
        this.f23050jw = zbVar6;
        this.f23049jc = z11;
        this.f23048ea = z12;
    }

    public com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> dj() {
        return this.f23047dj;
    }

    public boolean ea() {
        return this.f23048ea;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb fby() {
        return this.fby;
    }

    public boolean jc() {
        return this.f23049jc;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb jw() {
        return this.f23050jw;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb lt() {
        return this.f23051lt;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb lud() {
        return this.lud;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb sya() {
        return this.sya;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb ul() {
        return this.f23052ul;
    }

    public String ycx() {
        return this.ycx;
    }

    public ycx zb() {
        return this.f23053zb;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.xkz(jwVar, ycxVar, this);
    }
}
