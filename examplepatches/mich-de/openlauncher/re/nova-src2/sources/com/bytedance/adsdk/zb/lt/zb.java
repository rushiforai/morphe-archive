package com.bytedance.adsdk.zb.lt;

import a2.c;

/* loaded from: classes2.dex */
public class zb {
    private static float ycx(float f11) {
        return f11 <= 0.0031308f ? f11 * 12.92f : (float) ((Math.pow(f11, 0.4166666567325592d) * 1.0549999475479126d) - 0.054999999701976776d);
    }

    private static float zb(float f11) {
        return f11 <= 0.04045f ? f11 / 12.92f : (float) Math.pow((f11 + 0.055f) / 1.055f, 2.4000000953674316d);
    }

    public static int ycx(float f11, int i5, int i11) {
        if (i5 == i11) {
            return i5;
        }
        float f12 = ((i5 >> 24) & 255) / 255.0f;
        float f13 = ((i11 >> 24) & 255) / 255.0f;
        float fZb = zb(((i5 >> 16) & 255) / 255.0f);
        float fZb2 = zb(((i5 >> 8) & 255) / 255.0f);
        float fZb3 = zb((i5 & 255) / 255.0f);
        float fZb4 = zb(((i11 >> 16) & 255) / 255.0f);
        float fZb5 = zb(((i11 >> 8) & 255) / 255.0f);
        float fZb6 = zb((i11 & 255) / 255.0f);
        float fA = c.a(f13, f12, f11, f12);
        float fA2 = c.a(fZb4, fZb, f11, fZb);
        float fA3 = c.a(fZb5, fZb2, f11, fZb2);
        float fA4 = c.a(fZb6, fZb3, f11, fZb3);
        float fYcx = ycx(fA2) * 255.0f;
        float fYcx2 = ycx(fA3) * 255.0f;
        return Math.round(ycx(fA4) * 255.0f) | (Math.round(fYcx) << 16) | (Math.round(fA * 255.0f) << 24) | (Math.round(fYcx2) << 8);
    }
}
