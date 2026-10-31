package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.View;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.hD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1856hD {
    public static String[] A00 = {"KQh8NaibOqVcWKDbydjGYd", "pO3TcBX", "yyXp7ZOIH", "DZ7VtnADTSXfFGhHMPjaCk657n7zA", "xwMtnxCHl4E9iU9LC7Dzph2elvPb8g8P", "qq45VOMOcMkvrnZFQ72633b93fgE8dY", "69NcQjKwISO2lhHIFA6eV4FOhp8e0rsq", "yTFhdQKldcOmOalqoUoP5M9cNy8jmXl"};

    public static int A00(DisplayMetrics displayMetrics) {
        int i5 = displayMetrics.widthPixels;
        if (i5 > 1700) {
            i5 = 1700;
        }
        int width = i5 / 448;
        return width;
    }

    public static void A01(@Nullable Context context, final View view, long j11, final View view2) {
        if (view2 != null) {
            view2.setVisibility(0);
        }
        view.setVisibility(8);
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.hG
            @Override // java.lang.Runnable
            public final void run() {
                AbstractC1856hD.A02(view2, view);
            }
        }, j11);
    }

    public static /* synthetic */ void A02(View view, View view2) {
        if (view != null) {
            String[] strArr = A00;
            if (strArr[2].length() == strArr[3].length()) {
                throw new RuntimeException();
            }
            A00[6] = "6gobsTNeM9N9MMs5Xbh6Ea6HZN8gZCgH";
            view.setVisibility(8);
        }
        view2.setVisibility(0);
    }
}
