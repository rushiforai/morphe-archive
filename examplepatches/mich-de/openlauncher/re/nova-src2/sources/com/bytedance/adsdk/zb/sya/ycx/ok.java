package com.bytedance.adsdk.zb.sya.ycx;

import android.graphics.PointF;
import com.bytedance.adsdk.zb.ycx.zb.dy;

/* loaded from: classes2.dex */
public class ok implements com.bytedance.adsdk.zb.sya.zb.sya {

    /* renamed from: dj, reason: collision with root package name */
    private final zb f23025dj;
    private final zb fby;

    /* renamed from: jw, reason: collision with root package name */
    private final zb f23026jw;

    /* renamed from: lt, reason: collision with root package name */
    private final zb f23027lt;
    private final dj lud;
    private final ul sya;

    /* renamed from: ul, reason: collision with root package name */
    private final zb f23028ul;
    private final lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ry<PointF, PointF> f23029zb;

    public ok() {
        this(null, null, null, null, null, null, null, null, null);
    }

    public zb dj() {
        return this.f23025dj;
    }

    public zb fby() {
        return this.f23027lt;
    }

    public dy jc() {
        return new dy(this);
    }

    public zb jw() {
        return this.f23028ul;
    }

    public zb lt() {
        return this.fby;
    }

    public dj lud() {
        return this.lud;
    }

    public ul sya() {
        return this.sya;
    }

    public zb ul() {
        return this.f23026jw;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return null;
    }

    public ry<PointF, PointF> zb() {
        return this.f23029zb;
    }

    public ok(lud ludVar, ry<PointF, PointF> ryVar, ul ulVar, zb zbVar, dj djVar, zb zbVar2, zb zbVar3, zb zbVar4, zb zbVar5) {
        this.ycx = ludVar;
        this.f23029zb = ryVar;
        this.sya = ulVar;
        this.f23025dj = zbVar;
        this.lud = djVar;
        this.fby = zbVar2;
        this.f23026jw = zbVar3;
        this.f23027lt = zbVar4;
        this.f23028ul = zbVar5;
    }

    public lud ycx() {
        return this.ycx;
    }
}
