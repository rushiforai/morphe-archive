package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.gr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1835gr extends Drawable {
    public static String[] A00 = {"YEFrjfwCEWu", b.f42142b, "GYovhjhdb5Je", "S1Fz", "LeiEw92n2EsObareFd", "xgqXw3gEiUgyln4SIM", "kGClknFKKNldAaaK4EgXWOsNKvCYjz7L", "I70UDyBH67pytg1dUxrP2KgAWNh3bG3K"};
    public static final double A01 = Math.cos(Math.toRadians(45.0d));

    public static float A00(float f11, float f12, boolean z11) {
        if (z11) {
            double d5 = f11;
            if (A00[2].length() == 3) {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[5] = "P9aPeBSvznAhF57KLP";
            strArr[4] = "W3RUpaMuYeMV1XeTAU";
            return (float) (d5 + ((1.0d - A01) * f12));
        }
        return f11;
    }

    public static float A01(float f11, float f12, boolean z11) {
        if (z11) {
            return (float) ((1.5f * f11) + ((1.0d - A01) * f12));
        }
        return 1.5f * f11;
    }
}
