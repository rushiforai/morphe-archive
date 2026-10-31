package com.bytedance.adsdk.zb.sya.zb;

import com.bytedance.adsdk.zb.ycx.ycx.thx;

/* loaded from: classes2.dex */
public class uh implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23092dj;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23093lt;
    private final com.bytedance.adsdk.zb.sya.ycx.zb lud;
    private final com.bytedance.adsdk.zb.sya.ycx.zb sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx f23094zb;

    public enum ycx {
        SIMULTANEOUSLY,
        INDIVIDUALLY;

        public static ycx ycx(int i5) {
            if (i5 == 1) {
                return SIMULTANEOUSLY;
            }
            if (i5 == 2) {
                return INDIVIDUALLY;
            }
            throw new IllegalArgumentException("Unknown trim path type ".concat(String.valueOf(i5)));
        }
    }

    public uh(String str, ycx ycxVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2, com.bytedance.adsdk.zb.sya.ycx.zb zbVar3, boolean z11) {
        this.ycx = str;
        this.f23094zb = ycxVar;
        this.sya = zbVar;
        this.f23092dj = zbVar2;
        this.lud = zbVar3;
        this.f23093lt = z11;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb dj() {
        return this.sya;
    }

    public boolean lt() {
        return this.f23093lt;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb lud() {
        return this.lud;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb sya() {
        return this.f23092dj;
    }

    public String toString() {
        return "Trim Path: {start: " + this.sya + ", end: " + this.f23092dj + ", offset: " + this.lud + "}";
    }

    public String ycx() {
        return this.ycx;
    }

    public ycx zb() {
        return this.f23094zb;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new thx(ycxVar, this);
    }
}
