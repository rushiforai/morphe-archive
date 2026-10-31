package com.bytedance.adsdk.zb.sya.zb;

import a2.c;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class wie implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f23097dj;
    private final com.bytedance.adsdk.zb.sya.ycx.fby sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f23098zb;

    public wie(String str, int i5, com.bytedance.adsdk.zb.sya.ycx.fby fbyVar, boolean z11) {
        this.ycx = str;
        this.f23098zb = i5;
        this.sya = fbyVar;
        this.f23097dj = z11;
    }

    public boolean sya() {
        return this.f23097dj;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("ShapePath{name=");
        sb2.append(this.ycx);
        sb2.append(", index=");
        return c.m(sb2, this.f23098zb, AbstractJsonLexerKt.END_OBJ);
    }

    public String ycx() {
        return this.ycx;
    }

    public com.bytedance.adsdk.zb.sya.ycx.fby zb() {
        return this.sya;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.pmi(jwVar, ycxVar, this);
    }
}
