package com.bytedance.adsdk.zb.sya.zb;

import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class dy implements sya {
    private final boolean sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final List<sya> f23040zb;

    public dy(String str, List<sya> list, boolean z11) {
        this.ycx = str;
        this.f23040zb = list;
        this.sya = z11;
    }

    public boolean sya() {
        return this.sya;
    }

    public String toString() {
        return "ShapeGroup{name='" + this.ycx + "' Shapes: " + Arrays.toString(this.f23040zb.toArray()) + AbstractJsonLexerKt.END_OBJ;
    }

    public String ycx() {
        return this.ycx;
    }

    public List<sya> zb() {
        return this.f23040zb;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.dj(jwVar, ycxVar, this, ulVar);
    }
}
