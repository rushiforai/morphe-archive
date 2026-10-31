package com.bytedance.adsdk.zb.sya.zb;

import android.graphics.Path;

/* loaded from: classes2.dex */
public class lud implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.dj f23069dj;
    private final com.bytedance.adsdk.zb.sya.ycx.zb fby;

    /* renamed from: jc, reason: collision with root package name */
    private final boolean f23070jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23071jw;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.lt f23072lt;
    private final com.bytedance.adsdk.zb.sya.ycx.lt lud;
    private final com.bytedance.adsdk.zb.sya.ycx.sya sya;

    /* renamed from: ul, reason: collision with root package name */
    private final String f23073ul;
    private final ul ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Path.FillType f23074zb;

    public lud(String str, ul ulVar, Path.FillType fillType, com.bytedance.adsdk.zb.sya.ycx.sya syaVar, com.bytedance.adsdk.zb.sya.ycx.dj djVar, com.bytedance.adsdk.zb.sya.ycx.lt ltVar, com.bytedance.adsdk.zb.sya.ycx.lt ltVar2, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2, boolean z11) {
        this.ycx = ulVar;
        this.f23074zb = fillType;
        this.sya = syaVar;
        this.f23069dj = djVar;
        this.lud = ltVar;
        this.f23072lt = ltVar2;
        this.f23073ul = str;
        this.fby = zbVar;
        this.f23071jw = zbVar2;
        this.f23070jc = z11;
    }

    public com.bytedance.adsdk.zb.sya.ycx.sya dj() {
        return this.sya;
    }

    public boolean fby() {
        return this.f23070jc;
    }

    public com.bytedance.adsdk.zb.sya.ycx.lt lt() {
        return this.lud;
    }

    public com.bytedance.adsdk.zb.sya.ycx.dj lud() {
        return this.f23069dj;
    }

    public Path.FillType sya() {
        return this.f23074zb;
    }

    public com.bytedance.adsdk.zb.sya.ycx.lt ul() {
        return this.f23072lt;
    }

    public String ycx() {
        return this.f23073ul;
    }

    public ul zb() {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.fby(jwVar, ulVar, ycxVar, this);
    }
}
