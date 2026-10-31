package com.bytedance.sdk.openadsdk.core.xkz.zb;

import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;

/* loaded from: classes2.dex */
public class zb extends sya implements Comparable<zb> {
    private final float ycx;

    public static class ycx {
        private final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final float f26506zb;
        private sya.EnumC0092sya sya = sya.EnumC0092sya.TRACKING_URL;

        /* renamed from: dj, reason: collision with root package name */
        private boolean f26505dj = false;

        public ycx(String str, float f11) {
            this.ycx = str;
            this.f26506zb = f11;
        }

        public zb ycx() {
            return new zb(this.f26506zb, this.ycx, this.sya, Boolean.valueOf(this.f26505dj));
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.xkz.zb.sya
    public void n_() {
        super.n_();
    }

    public String toString() {
        return super.toString();
    }

    public boolean ycx(float f11) {
        return this.ycx <= f11 && !dj();
    }

    private zb(float f11, String str, sya.EnumC0092sya enumC0092sya, Boolean bool) {
        super(str, enumC0092sya, bool);
        this.ycx = f11;
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(zb zbVar) {
        if (zbVar == null) {
            return 1;
        }
        float f11 = this.ycx;
        float f12 = zbVar.ycx;
        if (f11 > f12) {
            return 1;
        }
        return f11 < f12 ? -1 : 0;
    }
}
