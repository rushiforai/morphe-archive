package com.facebook.ads.redexgen.X;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1o, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C1o {
    public static byte[] A00;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{9, 7, 27, 25, 11, -24, -5, -26, -24, -13, -9, -20, -14, -15};
    }

    public void A05(Throwable th2, Throwable th3) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        C1h.A09(th2, A03(0, 5, 79));
        C1h.A09(th3, A03(5, 9, 44));
        Method method = C1p.A01;
        if (method != null) {
            method.invoke(th2, th3);
        }
    }
}
