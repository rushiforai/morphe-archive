package com.amplitude;

import android.graphics.Color;
import java.util.Arrays;
import kotlin.jvm.internal.StringCompanionObject;

/* loaded from: classes2.dex */
public abstract class R0 {
    public static final String a(int i5) {
        int iAlpha = Color.alpha(i5);
        if (iAlpha == 0) {
            return "transparent";
        }
        if (iAlpha == 255) {
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            return String.format("#%06X", Arrays.copyOf(new Object[]{Integer.valueOf(i5 & 16777215)}, 1));
        }
        int iRed = Color.red(i5);
        int iGreen = Color.green(i5);
        int iBlue = Color.blue(i5);
        StringBuilder sbT = b.c0.t(iRed, "rgba(", ", ", iGreen, ", ");
        sbT.append(iBlue);
        sbT.append(", ");
        sbT.append(iAlpha / 255.0f);
        sbT.append(")");
        return sbT.toString();
    }
}
