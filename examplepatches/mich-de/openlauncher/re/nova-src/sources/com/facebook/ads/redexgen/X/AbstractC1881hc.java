package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.ViewConfiguration;
import java.lang.reflect.Method;
import java.util.Arrays;
import javax.annotation.Nullable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Deprecated
/* renamed from: com.facebook.ads.redexgen.X.hc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1881hc {

    @Nullable
    public static Method A00;
    public static byte[] A01;
    public static String[] A02 = {"AQLjxK2FjJRwwoaJIN65VrZWNOsgzmXU", "Ge4igKMki", "nbNH2vhK9", "Sw9TLHolawUN9KVNZQEO3EMAiDKtc0hD", "dGfRjiYjSJpbyPiyGtO7b0cAlrZw4Mrv", "qM6uisHAC1V1e", "EjRY7zjKRQHhcQeKklTfg54KjcLoHLDU", "3qjUfSEuwtGBq6iLvq5s4uOmi"};

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A02[7].length() != 25) {
                throw new RuntimeException();
            }
            A02[5] = "REfXy77BkkgR1";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A01 = new byte[]{125, 81, 75, 82, 90, 30, 80, 81, 74, 30, 88, 87, 80, 90, 30, 83, 91, 74, 86, 81, 90, 30, 89, 91, 74, 109, 93, 95, 82, 91, 90, 109, 93, 76, 81, 82, 82, 120, 95, 93, 74, 81, 76, 22, 23, 30, 81, 80, 30, 104, 87, 91, 73, 125, 81, 80, 88, 87, 89, 75, 76, 95, 74, 87, 81, 80, 97, 94, 82, 64, 116, 88, 89, 81, 94, 80, 116, 88, 90, 71, 86, 67, 124, 126, 111, 72, 120, 122, 119, 126, AbstractJsonLexerKt.TC_INVALID, 72, 120, 105, 116, 119, 119, 93, 122, 120, 111, 116, 105};
    }

    static {
        A04();
        if (Build.VERSION.SDK_INT == 25) {
            try {
                A00 = ViewConfiguration.class.getDeclaredMethod(A03(82, 21, 45), new Class[0]);
            } catch (Exception unused) {
                Log.i(A03(66, 16, 1), A03(0, 66, 8));
            }
        }
    }

    public static float A00(ViewConfiguration viewConfiguration, Context context) {
        if (Build.VERSION.SDK_INT >= 26) {
            return viewConfiguration.getScaledHorizontalScrollFactor();
        }
        return A02(viewConfiguration, context);
    }

    public static float A01(ViewConfiguration viewConfiguration, Context context) {
        if (Build.VERSION.SDK_INT >= 26) {
            return viewConfiguration.getScaledVerticalScrollFactor();
        }
        return A02(viewConfiguration, context);
    }

    public static float A02(ViewConfiguration viewConfiguration, Context context) {
        if (Build.VERSION.SDK_INT >= 25 && A00 != null) {
            try {
                return ((Integer) A00.invoke(viewConfiguration, new Object[0])).intValue();
            } catch (Exception unused) {
                Log.i(A03(66, 16, 1), A03(0, 66, 8));
            }
        }
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(16842829, typedValue, true)) {
            return typedValue.getDimension(context.getResources().getDisplayMetrics());
        }
        return 0.0f;
    }
}
