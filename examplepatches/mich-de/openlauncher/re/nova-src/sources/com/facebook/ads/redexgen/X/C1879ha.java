package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import android.view.Display;
import android.view.View;
import java.lang.reflect.Field;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ha, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1879ha {
    public static Field A00;
    public static boolean A01;
    public static byte[] A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{26, 54, 20, 20, 18, 4, 4, 30, 21, 30, 27, 30, 3, 14, 51, 18, 27, 18, 16, 22, 3, 18};
    }

    public abstract int A02(View view);

    public abstract int A03(View view);

    public abstract int A04(View view);

    public abstract int A05(View view);

    public abstract Display A06(View view);

    public abstract C1896hs A07(View view, C1896hs c1896hs);

    public abstract C1896hs A08(View view, C1896hs c1896hs);

    public abstract void A09(View view);

    public abstract void A0A(View view);

    public abstract void A0B(View view, int i5);

    public abstract void A0C(View view, Drawable drawable);

    public abstract void A0E(View view, InterfaceC1864hL interfaceC1864hL);

    public abstract void A0F(View view, Runnable runnable);

    public abstract void A0G(View view, Runnable runnable, long j11);

    public abstract boolean A0I(View view);

    public abstract boolean A0J(View view);

    static {
        A01();
        A01 = false;
    }

    public final void A0D(View view, AbstractC1858hF abstractC1858hF) {
        view.setAccessibilityDelegate(abstractC1858hF == null ? null : abstractC1858hF.A00());
    }

    public final boolean A0H(View view) {
        if (A01) {
            return false;
        }
        if (A00 == null) {
            try {
                A00 = View.class.getDeclaredField(A00(0, 22, 63));
                A00.setAccessible(true);
            } catch (Throwable unused) {
                A01 = true;
                return false;
            }
        }
        try {
            return A00.get(view) != null;
        } catch (Throwable unused2) {
            A01 = true;
            return false;
        }
    }
}
