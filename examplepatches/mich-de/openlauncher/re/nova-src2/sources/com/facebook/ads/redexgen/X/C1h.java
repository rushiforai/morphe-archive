package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.1h, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C1h {
    public static byte[] A00;

    static {
        A04();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 4);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{-119, -42, -34, -36, -35, -119, -41, -40, -35, -119, -53, -50, -119, -41, -34, -43, -43, -87, -99, -19, -34, -17, -34, -22, -30, -15, -30, -17, -99, 74, -52, -35, -18, -35, -23, -31, -16, -31, -18, -100, -17, -20, -31, -33, -27, -30, -27, -31, -32, -100, -35, -17, -100, -22, -21, -22, -87, -22, -15, -24, -24, -100, -27, -17, -100, -22, -15, -24, -24, -74, -100, -23, -31, -16, -28, -21, -32, -100};
    }

    public static String A01(String str) {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        String name = C1h.class.getName();
        int i5 = 0;
        while (!stackTrace[i5].getClassName().equals(name)) {
            i5++;
        }
        while (stackTrace[i5].getClassName().equals(name)) {
            i5++;
        }
        StackTraceElement stackTraceElement = stackTrace[i5];
        String methodName = stackTraceElement.getClassName();
        String className = stackTraceElement.getMethodName();
        return A00(30, 48, 120) + methodName + A00(29, 1, 24) + className + A00(17, 12, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + str;
    }

    public static <T extends Throwable> T A02(T t6) {
        return (T) A03(t6, C1h.class.getName());
    }

    public static <T extends Throwable> T A03(T throwable, String str) {
        StackTraceElement[] stackTrace = throwable.getStackTrace();
        int i5 = stackTrace.length;
        int lastIntrinsic = -1;
        for (int size = 0; size < i5; size++) {
            if (str.equals(stackTrace[size].getClassName())) {
                lastIntrinsic = size;
            }
        }
        StackTraceElement[] stackTrace2 = (StackTraceElement[]) Arrays.copyOfRange(stackTrace, lastIntrinsic + 1, i5);
        throwable.setStackTrace(stackTrace2);
        return throwable;
    }

    public static void A05() {
        throw ((NullPointerException) A02(new NullPointerException()));
    }

    public static void A06(Object obj) {
        if (obj == null) {
            A05();
            throw null;
        }
    }

    public static void A07(Object obj, String str) {
        if (obj == null) {
            A0A(str);
            throw null;
        }
    }

    public static void A08(Object obj, String str) {
        if (obj != null) {
        } else {
            throw ((NullPointerException) A02(new NullPointerException(str + A00(0, 17, 101))));
        }
    }

    public static void A09(Object obj, String str) {
        if (obj == null) {
            A0B(str);
            throw null;
        }
    }

    public static void A0A(String str) {
        throw ((NullPointerException) A02(new NullPointerException(str)));
    }

    public static void A0B(String str) {
        throw ((NullPointerException) A02(new NullPointerException(A01(str))));
    }

    public static boolean A0C(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }
}
