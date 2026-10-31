package com.facebook.ads.redexgen.X;

import java.lang.reflect.Method;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1p, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C1p {
    public static byte[] A00;
    public static final Method A01;
    public static final Method A02;
    public static final C1p A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 85);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-26, -23, -23, -40, -6, -11, -11, -9, -22, -8, -8, -22, -23, -10, -12, 3, -33, -16, 1, -16, -4, -12, 3, -12, 1, -29, 8, -1, -12, 2, -73, -67, -67, -67, -72, 37, 35, 50, 17, 51, 46, 46, 48, 35, 49, 49, 35, 34};
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0073  */
    static {
        Method method;
        Method method2;
        A01();
        A03 = new C1p();
        Method[] methods = Throwable.class.getMethods();
        C1h.A06(methods);
        int length = methods.length;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            method = null;
            if (i11 < length) {
                method2 = methods[i11];
                if (C1h.A0C(method2.getName(), A00(0, 13, 48))) {
                    Class<?>[] parameterTypes = method2.getParameterTypes();
                    C1h.A08(parameterTypes, A00(13, 22, 58));
                    boolean z11 = C1h.A0C(C0N.A00(parameterTypes), Throwable.class);
                    if (z11) {
                        break;
                    } else {
                        i11++;
                    }
                }
            } else {
                method2 = null;
                break;
            }
        }
        A01 = method2;
        int length2 = methods.length;
        while (true) {
            if (i5 >= length2) {
                break;
            }
            Method method3 = methods[i5];
            if (C1h.A0C(method3.getName(), A00(35, 13, 105))) {
                method = method3;
                break;
            }
            i5++;
        }
        A02 = method;
    }
}
