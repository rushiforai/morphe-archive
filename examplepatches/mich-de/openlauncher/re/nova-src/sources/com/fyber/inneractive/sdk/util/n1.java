package com.fyber.inneractive.sdk.util;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;

/* loaded from: classes.dex */
public abstract class n1 {
    public static void a(UnitDisplayType unitDisplayType, h1 h1Var, int i5, int i11, int i12, int i13) {
        if (i5 > 0 && i11 > 0) {
            float f11 = i5;
            float f12 = i11;
            float f13 = f11 / f12;
            if (unitDisplayType == UnitDisplayType.SQUARE) {
                i12 = (int) (i13 * f13);
            } else {
                float fMin = Math.min(i12 / f11, 10.0f);
                float f14 = i13;
                float f15 = fMin * f12;
                if (f14 > f15) {
                    i12 = (int) (fMin * f11);
                    i13 = (int) f15;
                } else {
                    float fMin2 = Math.min(f14 / f12, 10.0f);
                    i12 = (int) (f11 * fMin2);
                    i13 = (int) (fMin2 * f12);
                }
            }
        }
        h1Var.f31191a = i12;
        h1Var.f31192b = i13;
    }
}
