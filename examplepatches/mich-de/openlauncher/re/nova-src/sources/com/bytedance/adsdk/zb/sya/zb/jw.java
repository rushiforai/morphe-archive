package com.bytedance.adsdk.zb.sya.zb;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class jw implements sya {
    private final boolean sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx f23056zb;

    public enum ycx {
        MERGE,
        ADD,
        SUBTRACT,
        INTERSECT,
        EXCLUDE_INTERSECTIONS;

        public static ycx ycx(int i5) {
            return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? MERGE : EXCLUDE_INTERSECTIONS : INTERSECT : SUBTRACT : ADD : MERGE;
        }
    }

    public jw(String str, ycx ycxVar, boolean z11) {
        this.ycx = str;
        this.f23056zb = ycxVar;
        this.sya = z11;
    }

    public boolean sya() {
        return this.sya;
    }

    public String toString() {
        return "MergePaths{mode=" + this.f23056zb + AbstractJsonLexerKt.END_OBJ;
    }

    public String ycx() {
        return this.ycx;
    }

    public ycx zb() {
        return this.f23056zb;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new com.bytedance.adsdk.zb.ycx.ycx.ok(this);
    }
}
