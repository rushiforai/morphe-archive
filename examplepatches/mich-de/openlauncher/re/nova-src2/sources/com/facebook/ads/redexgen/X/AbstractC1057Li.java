package com.facebook.ads.redexgen.X;

import android.text.Spannable;

/* renamed from: com.facebook.ads.redexgen.X.Li, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1057Li {
    public static String[] A00 = {"9v5PgwX8x7Qx9bE4vELp3dd2e", "eDqIawLngFv", "jCm7OqsBCbeRG2KPHukv0AF4xgSZdXJY", "SJPEjl0yPs4", "ESLtlVS0s1MdJITZmQLKZzO3arnCnvs1", "9Mca8Yt6V", "5ZSLXscyc54IGIy5kBtw0sTkEH2UzAvY", "aSPS7VfGodPcehEijXGKAFMgQHvTYY4K"};

    public static void A00(Spannable spannable, Object obj, int i5, int i11, int i12) {
        for (Object obj2 : spannable.getSpans(i5, i11, obj.getClass())) {
            if (spannable.getSpanStart(obj2) == i5 && spannable.getSpanEnd(obj2) == i11 && spannable.getSpanFlags(obj2) == i12) {
                spannable.removeSpan(obj2);
            }
        }
        spannable.setSpan(obj, i5, i11, i12);
        if (A00[4].charAt(1) == 'N') {
            throw new RuntimeException();
        }
        String[] strArr = A00;
        strArr[6] = "eE6uXPxArHxNGnmvvCudDILKvdYSJKtq";
        strArr[2] = "EDslWpdB1EO4GiKoaaN3CLWhJiVsosVy";
    }
}
