package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.ov, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2324ov {
    public static String[] A01 = {"vWOWhJ9TqiA1ty478f", "MWb8A3Nd6tPLcAimCp0hVAmYX6QHiaZm", "Xd3YBUkiMhOleC4V056rVyOXhinwtSii", "tT8mJINbcEXXPPmKiWyTepfA0JHaFg93", "WoudJsrKOqRuVhNYSdRTZjqc00A0B3WY", "YTheXaZSxrm1KPF5Yd", "huHeChgRkwF7QVPgKoMeW6tLhEc13T9K", "ASVM8zHOtJrSOKsDwpZwweqDqvgS8KFW"};
    public static final ThreadLocal<C2324ov> A02 = new ThreadLocal<>();
    public final C2307oe A00 = new C2307oe();

    public static C2307oe A00() {
        return A02().A00;
    }

    public static C2307oe A01(C2323ou c2323ou) {
        C2307oe currentStackTraces = new C2307oe(A00());
        currentStackTraces.add(c2323ou);
        return currentStackTraces;
    }

    public static C2324ov A02() {
        C2324ov c2324ov = A02.get();
        String[] strArr = A01;
        if (strArr[6].charAt(1) == strArr[2].charAt(1)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[7] = "JnfSkSuIf6osqUQGv4Nkh0Vi2QZsQFPV";
        strArr2[4] = "e9u3CRl6fKpCeCDR9nRPR0cml03xK1Bs";
        if (c2324ov == null) {
            C2324ov c2324ov2 = new C2324ov();
            A02.set(c2324ov2);
            return c2324ov2;
        }
        return c2324ov;
    }

    public static void A03(AbstractRunnableC2319oq abstractRunnableC2319oq) {
        C2307oe c2307oeA06 = abstractRunnableC2319oq.A06();
        if (c2307oeA06 != null) {
            C2307oe createRunnableAsyncStackTrace = A02().A00;
            createRunnableAsyncStackTrace.addAll(c2307oeA06);
        }
    }

    public static void A04(AbstractRunnableC2319oq abstractRunnableC2319oq) {
        C2307oe c2307oeA06 = abstractRunnableC2319oq.A06();
        if (c2307oeA06 != null) {
            C2307oe createRunnableAsyncStackTrace = A02().A00;
            createRunnableAsyncStackTrace.removeAll(c2307oeA06);
        }
    }
}
