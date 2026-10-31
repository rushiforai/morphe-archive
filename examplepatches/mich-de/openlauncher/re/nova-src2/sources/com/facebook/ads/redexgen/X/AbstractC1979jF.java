package com.facebook.ads.redexgen.X;

import android.view.View;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.jF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1979jF {
    public static String[] A00 = {"UqypfisWbLbbWLDfIVvpiaUsz0iS", "wEiCJDeLGzLJebV", "cX", "dRMEhdR7kDOm9Ob", "SmhGT229bW5LAFpAZzaxeRYqKvMDeGhX", "QcSoUKFtoryhyFMFYIfDI81ChPsDlMu7", "SBvSWfqovIH0ljTVzoffsyrdWCNw", "n"};

    public static int A00(@Nullable C1975jB c1975jB, @Nullable AbstractC1944ig abstractC1944ig, View view, View view2, AbstractC1960iw abstractC1960iw, boolean z11) {
        if (abstractC1960iw.A1T() == 0 || c1975jB.A03() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z11) {
            return Math.abs(abstractC1960iw.A1o(view) - abstractC1960iw.A1o(view2)) + 1;
        }
        int iA0D = abstractC1944ig.A0D(view2);
        int iA0G = abstractC1944ig.A0G(view);
        String[] strArr = A00;
        if (strArr[4].charAt(28) == strArr[5].charAt(28)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A00;
        strArr2[3] = "xd2oZUwi45Npmqe";
        strArr2[1] = "1k2xoHfklbXXQiR";
        int extend = abstractC1944ig.A0C();
        return Math.min(extend, iA0D - iA0G);
    }

    public static int A01(@Nullable C1975jB c1975jB, @Nullable AbstractC1944ig abstractC1944ig, View view, View view2, AbstractC1960iw abstractC1960iw, boolean z11) {
        if (abstractC1960iw.A1T() == 0 || c1975jB.A03() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z11) {
            return c1975jB.A03();
        }
        int iA0D = abstractC1944ig.A0D(view2) - abstractC1944ig.A0G(view);
        int iA1o = abstractC1960iw.A1o(view);
        int laidOutArea = abstractC1960iw.A1o(view2);
        float fAbs = iA0D / (Math.abs(iA1o - laidOutArea) + 1);
        int laidOutArea2 = c1975jB.A03();
        return (int) (fAbs * laidOutArea2);
    }

    public static int A02(@Nullable C1975jB c1975jB, @Nullable AbstractC1944ig abstractC1944ig, View view, View view2, AbstractC1960iw abstractC1960iw, boolean z11, boolean z12) {
        int laidOutArea;
        if (abstractC1960iw.A1T() != 0) {
            int iA03 = c1975jB.A03();
            String[] strArr = A00;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A00;
            strArr2[6] = "xSzU3PMpL9LC7k2G9V08vNIV3nIP";
            strArr2[0] = "UsrmTbcEPDcBULmsiiLKltF5MwgK";
            if (iA03 != 0 && view != null && view2 != null) {
                int maxPosition = Math.min(abstractC1960iw.A1o(view), abstractC1960iw.A1o(view2));
                int iA1o = abstractC1960iw.A1o(view);
                int minPosition = abstractC1960iw.A1o(view2);
                int iMax = Math.max(iA1o, minPosition);
                if (z12) {
                    int minPosition2 = c1975jB.A03();
                    laidOutArea = Math.max(0, (minPosition2 - iMax) - 1);
                } else {
                    laidOutArea = Math.max(0, maxPosition);
                }
                if (!z11) {
                    return laidOutArea;
                }
                int itemsBefore = abstractC1944ig.A0D(view2);
                int minPosition3 = abstractC1944ig.A0G(view);
                int maxPosition2 = Math.abs(itemsBefore - minPosition3);
                int itemsBefore2 = abstractC1960iw.A1o(view);
                int minPosition4 = abstractC1960iw.A1o(view2);
                float fAbs = laidOutArea * (maxPosition2 / (Math.abs(itemsBefore2 - minPosition4) + 1));
                int itemsBefore3 = abstractC1944ig.A0B();
                int minPosition5 = abstractC1944ig.A0G(view);
                return Math.round(fAbs + (itemsBefore3 - minPosition5));
            }
        }
        return 0;
    }
}
