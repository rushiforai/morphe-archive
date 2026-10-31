package com.bytedance.adsdk.zb.sya;

/* loaded from: classes2.dex */
public class lt {
    private final String sya;
    public final float ycx;

    /* renamed from: zb, reason: collision with root package name */
    public final float f22945zb;

    public lt(String str, float f11, float f12) {
        this.sya = str;
        this.f22945zb = f12;
        this.ycx = f11;
    }

    public boolean ycx(String str) {
        if (this.sya.equalsIgnoreCase(str)) {
            return true;
        }
        if (this.sya.endsWith("\r")) {
            String str2 = this.sya;
            if (str2.substring(0, str2.length() - 1).equalsIgnoreCase(str)) {
                return true;
            }
        }
        return false;
    }
}
