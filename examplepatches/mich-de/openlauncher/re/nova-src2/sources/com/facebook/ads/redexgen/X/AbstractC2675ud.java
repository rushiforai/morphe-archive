package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.ud, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2675ud {
    public static float A00(C1735fE c1735fE) {
        int height = c1735fE.A0I().A01();
        int width = c1735fE.A0I().A00();
        if (width > 0) {
            return height / width;
        }
        return -1.0f;
    }

    public static int A01(double d5) {
        int availableWidth = (int) ((AbstractC2384pw.A00().widthPixels - (AbstractC2685un.A09 * 2)) / d5);
        return availableWidth;
    }

    public static int A02(int bottomMargin) {
        int ctaMargin = AbstractC2426qc.A01(16);
        int ctaTextHeight = AbstractC2652uG.A0B;
        int ctaSpacing = ctaTextHeight * 2;
        int ctaTextHeight2 = AbstractC2685un.A09;
        int ctaMargin2 = ctaMargin + ctaSpacing + (ctaTextHeight2 * 2);
        int ctaTextHeight3 = AbstractC2384pw.A00().heightPixels;
        return (ctaTextHeight3 - bottomMargin) - ctaMargin2;
    }

    public static ViewOnClickListenerC2674uc A03(ViewOnClickListenerC0884El viewOnClickListenerC0884El, String str) {
        return new ViewOnClickListenerC2674uc(viewOnClickListenerC0884El, str);
    }

    public static boolean A04(double d5) {
        return d5 < 0.9d;
    }

    public static boolean A05(double d5, int i5) {
        return A02(i5) < A01(d5);
    }

    public static boolean A06(int i5, int i11, double d5) {
        return i5 == 2 || A05(d5, i11);
    }
}
