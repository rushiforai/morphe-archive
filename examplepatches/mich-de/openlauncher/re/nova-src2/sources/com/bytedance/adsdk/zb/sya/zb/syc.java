package com.bytedance.adsdk.zb.sya.zb;

import a2.c;
import android.graphics.Path;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class syc implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.ycx f23089dj;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23090lt;
    private final com.bytedance.adsdk.zb.sya.ycx.dj lud;
    private final String sya;
    private final boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Path.FillType f23091zb;

    public syc(String str, boolean z11, Path.FillType fillType, com.bytedance.adsdk.zb.sya.ycx.ycx ycxVar, com.bytedance.adsdk.zb.sya.ycx.dj djVar, boolean z12) {
        this.sya = str;
        this.ycx = z11;
        this.f23091zb = fillType;
        this.f23089dj = ycxVar;
        this.lud = djVar;
        this.f23090lt = z12;
    }

    public Path.FillType dj() {
        return this.f23091zb;
    }

    public boolean lud() {
        return this.f23090lt;
    }

    public com.bytedance.adsdk.zb.sya.ycx.dj sya() {
        return this.lud;
    }

    public String toString() {
        return c.p(new StringBuilder("ShapeFill{color=, fillEnabled="), this.ycx, AbstractJsonLexerKt.END_OBJ);
    }

    public String ycx() {
        return this.sya;
    }

    public com.bytedance.adsdk.zb.sya.ycx.ycx zb() {
        return this.f23089dj;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.ul(jwVar, ycxVar, this);
    }
}
