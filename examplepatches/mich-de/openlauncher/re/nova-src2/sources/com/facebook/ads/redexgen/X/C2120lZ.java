package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.SparseIntArray;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.lZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2120lZ {
    public static SparseIntArray A00;
    public static Executor A01;
    public static boolean A02;
    public static boolean A03;
    public static byte[] A04;
    public static String[] A05 = {"lfqbOpCQc8eNVWWSF0ti", "aQ5ZOD0I", "7f7up0GBGRCd1p0enpCjG4lcj76", "dHBYXWbpLBdqteinvxBO5bOixoP3oT04", "DPNUUQYEctncegz3shse9IBb8Vdl47", "4q0rwT09y0cbatV7Yp", "6l64E9SK9p5G", "edaEIeRSccYYgTnyelVwcwdzoe4C2sfO"};
    public static final List<Integer> A06;
    public static final List<C2121la> A07;
    public static final AtomicBoolean A08;
    public static final AtomicInteger A09;
    public static final AtomicReference<InterfaceC2118lX> A0A;
    public static final AtomicReference<InterfaceC2119lY> A0B;
    public static final AtomicReference<Boolean> A0C;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 39);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A04 = new byte[]{-93, -105, -40, -37, -37, -32, -21, -32, -26, -27, -40, -29, -64, -27, -35, -26, -105, -76, -105, -110, -122, -45, -53, -39, -39, -57, -51, -53, -122, -93, -122, 91, 79, -94, -92, -111, -93, -88, -97, -108, 114, -98, -109, -108, 79, 108, 79, 116, -66, -36, -23, -94, -17, -101, -25, -22, -30, -101, -65, -32, -35, -16, -30, -101, -64, -15, -32, -23, -17, -87, -101, -66, -22, -23, -17, -32, -13, -17, -101, -28, -18, -101, -23, -16, -25, -25, -87, 119, -93, -87, -94, -88, -103, -90, 110, 84, -79, -46, -49, -30, -44, -115, -48, -33, -50, -32, -43, -115, -49, -46, -48, -50, -30, -32, -46, -115, -36, -45, -115, -46, -29, -46, -37, -31, -115, -28, -42, -31, -43, -115, -32, -30, -49, -31, -26, -35, -46, -115, -86, -115, 108, -97, -118, -116, -116, -117, -116, -117, 71, -112, -107, 84, -108, -116, -108, -106, -103, -96, 71, -109, -106, -114, 71, -109, -112, -108, -112, -101, 72, 71, 115, -120, -102, -101, 71, -116, -99, -116, -107, -101, 97, 71, -108, -57, -78, -76, -65, -61, -72, -66, -67, 111, -109, -76, -79, -60, -74, 111, -108, -59, -76, -67, -61, 111, -58, -72, -61, -73, 111, -62, -60, -79, -61, -56, -65, -76, 111, -116, 111, -97, -46, -67, -65, -54, -50, -61, -55, -56, 122, -66, -49, -52, -61, -56, -63, 122, -58, -55, -63, -63, -61, -56, -63, 122, -66, -65, -68, -49, -63, 122, -65, -48, -65, -56, -50, -120, -27, 24, 3, 5, 16, 20, 9, 15, 14, -64, 19, 8, 15, 21, 12, 4, -64, 14, 15, 20, -64, 8, 1, 16, 16, 5, 14, -64, 8, 5, 18, 5, -50, -101, -105, -106, -54, -71, -66, -70, -61, -72, -70, -93, -70, -55, -52, -60, -57, -64, -28, 9, 1, 10, -69, -33, 0, -3, 16, 2, -69, -32, 17, 0, 9, 15, -69, 18, 4, 15, 3, -69, 14, 16, -3, 15, 20, 11, 0, -69, -40, -69, -53, -26, -26, -105, -28, -40, -27, -16, -105, -36, -19, -36, -27, -21, -22, -105, -26, -35, -105, -22, -20, -39, -21, -16, -25, -36, -105, -38, -26, -37, -36, -79, -105, -101, -99, -104, -99, -102, -83, -102, -104, -91, -88, -96, -96, -94, -89, -96, -21, -8, -3, -24, -19, -18, -3, -18, -20, -3, -14, -8, -9, -24, 0, -8, -24, -4, -14, -16, -9, -22, -11, -24, -19, -22, -3, -22, -24, -11, -8, -16, -16, -14, -9, -16, -62, -64, -62, -57, -60, -57, -56, -62, -49, -46, -54, -54, -52, -47, -54, -2, 4, -7, 11, 0, -52, -37, -44, -44, -53, -46, -41, -34, -47, -51, -28, -49, -38, -41, -46, -49, -30, -41, -35, -36, 0, -9, 6, 9, 1, 4, -3};
    }

    static {
        A04();
        A00 = new SparseIntArray();
        A03 = false;
        A0B = new AtomicReference<>();
        A0A = new AtomicReference<>();
        A01 = Executors.newSingleThreadExecutor();
        A06 = Arrays.asList(10, 50, 100, 1000);
        A07 = Collections.synchronizedList(new ArrayList());
        A09 = new AtomicInteger();
        A08 = new AtomicBoolean();
        A0C = new AtomicReference<>(false);
        A02 = false;
    }

    public static int A00(String str, int i5, C2095lA c2095lA) {
        if ((A01(462, 7, 107).equals(str) && AbstractC2126lf.A20 == i5) || A01(422, 5, 56).equals(str) || A01(442, 6, 63).equals(str)) {
            return 200;
        }
        if (A01(386, 36, 98).equals(str)) {
            return 50;
        }
        if (A01(371, 15, 18).equals(str)) {
            return AbstractC2205mx.A05(c2095lA);
        }
        if (A05[3].charAt(3) != 'Y') {
            throw new RuntimeException();
        }
        A05[7] = "MSKlPe4okWTggpeViHGlBF3nlCraGBz9";
        return -1;
    }

    public static /* synthetic */ List A02() {
        List<C2121la> list = A07;
        String[] strArr = A05;
        if (strArr[4].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        A05[1] = "TV2BvPAOYvnRV0R5I88rwwfNZOOU8";
        return list;
    }

    public static void A05(C2095lA c2095lA, int i5, int i11) {
        c2095lA.A08().ABz(A01(427, 10, 60), AbstractC2126lf.A2Z, new C2127lg(A01(338, 33, 80) + i5, A01(87, 9, 13) + i11));
    }

    @Deprecated
    public static void A06(C2095lA c2095lA, String str, int i5, C2127lg c2127lg) {
        if (c2095lA == null) {
            A0F(new RuntimeException(A01(48, 39, 84)));
            return;
        }
        AbstractC2094l9.A01(c2095lA.A02());
        if (A02 && c2127lg.A01() == 0) {
            A0D(new RuntimeException(A01(96, 44, 70) + str + A01(31, 16, 8) + i5, c2127lg));
        }
        try {
            if (A0J(c2095lA, str, i5, Math.random(), c2127lg)) {
                A09(c2095lA, str, i5, c2127lg);
            }
        } catch (Throwable t6) {
            A0F(t6);
        }
    }

    @Deprecated
    public static void A07(C2095lA c2095lA, String str, int i5, C2127lg c2127lg) {
        try {
            c2127lg.A05(2);
            c2127lg.A0A(false);
            c2127lg.A06(1);
            if (AbstractC2205mx.A0Q(c2095lA)) {
                c2127lg.A08(true);
            } else {
                c2127lg.A08(false);
            }
            A06(c2095lA, str, i5, c2127lg);
        } catch (Throwable t6) {
            A0F(t6);
        }
    }

    @Deprecated
    public static void A08(C2095lA c2095lA, String str, int i5, C2127lg c2127lg) {
        try {
            c2127lg.A05(2);
            c2127lg.A08(false);
            A06(c2095lA, str, i5, c2127lg);
        } catch (Throwable t6) {
            A0F(t6);
        }
    }

    public static void A09(C2095lA c2095lA, String str, int i5, C2127lg c2127lg) {
        synchronized (C2120lZ.class) {
            if (!A03) {
                int iA01 = AbstractC2205mx.A01(c2095lA);
                int threshold = A09.getAndIncrement();
                if (threshold < iA01 - 1) {
                    A07.add(new C2121la(str, i5, c2127lg));
                } else if (A09.get() == iA01) {
                    A07.add(new C2121la(A01(427, 10, 60), AbstractC2126lf.A2W, new C2127lg(A01(140, 42, 0) + str + A01(47, 1, 19) + i5)));
                }
            } else {
                A0A(c2095lA, str, i5, c2127lg, true);
            }
        }
    }

    public static void A0A(C2095lA c2095lA, String str, int i5, C2127lg c2127lg, boolean z11) throws Throwable {
        InterfaceC2119lY interfaceC2119lY = A0B.get();
        boolean z12 = interfaceC2119lY != null && interfaceC2119lY.ABQ();
        if (A08.get() || z12) {
            int iA01 = c2127lg.A01();
            String strA01 = A01(289, 17, 46);
            String strA012 = A01(31, 16, 8);
            if (iA01 == 0) {
                Log.e(strA01, A01(182, 37, 40) + str + strA012 + i5, c2127lg);
            } else {
                Log.i(strA01, A01(306, 32, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + str + strA012 + i5 + A01(19, 12, 63) + c2127lg.getMessage() + A01(0, 19, 80) + c2127lg.A03());
            }
        }
        HZ hz = new HZ(c2095lA, str, i5, c2127lg, interfaceC2119lY);
        if (z11) {
            A01.execute(hz);
        } else {
            hz.run();
        }
    }

    public static void A0C(C0957Hh c0957Hh, InterfaceC2119lY interfaceC2119lY, InterfaceC2118lX interfaceC2118lX, boolean z11) {
        A0A.set(interfaceC2118lX);
        A0B.set(interfaceC2119lY);
        A08.set(z11);
        synchronized (C2120lZ.class) {
            if (!A03) {
                A03 = true;
                A01.execute(new C0950Ha(c0957Hh));
            }
        }
    }

    public static void A0D(RuntimeException runtimeException) {
        if (A02) {
            new Handler(Looper.getMainLooper()).post(new RunnableC2117lW(runtimeException));
        }
    }

    @Deprecated
    public static void A0E(Throwable th2) {
        if (A02) {
            A0D(new RuntimeException(A01(256, 33, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), th2));
        }
    }

    public static void A0F(Throwable th2) {
        Log.e(A01(289, 17, 46), A01(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 37, 51), th2);
        if (A02) {
            A0D(new RuntimeException(th2));
        }
    }

    public static boolean A0H(C2095lA c2095lA) {
        Boolean shouldSkipFunnelEventsForSession = A0C.get();
        return (shouldSkipFunnelEventsForSession == null || !shouldSkipFunnelEventsForSession.booleanValue()) && AbstractC2205mx.A0A(c2095lA) != 0;
    }

    public static boolean A0I(C2095lA c2095lA) {
        Boolean shouldSkipFunnelEventsForSession = A0C.get();
        if (shouldSkipFunnelEventsForSession != null && shouldSkipFunnelEventsForSession.booleanValue()) {
            return false;
        }
        double funnelEventLogProbability = 1.0d / AbstractC2205mx.A0A(c2095lA);
        return c2095lA.A09().A00() <= funnelEventLogProbability;
    }

    public static boolean A0J(C2095lA c2095lA, String str, int i5, double d5, C2127lg c2127lg) {
        double d11;
        boolean z11;
        int additionalDebugLoggingSamplingPercentage;
        try {
            int iA04 = AbstractC2205mx.A04(c2095lA);
            if (iA04 < 1) {
                return false;
            }
            HashMap<String, Integer> mapA0M = AbstractC2205mx.A0M(c2095lA);
            Set<String> setKeySet = mapA0M.keySet();
            String str2 = str + A01(47, 1, 19) + i5;
            boolean zContains = setKeySet.contains(str2);
            if (zContains) {
                Integer num = mapA0M.get(str2);
                int additionalDebugLoggingSamplingPercentage2 = num != null ? num.intValue() : -1;
                if (additionalDebugLoggingSamplingPercentage2 == 0) {
                    return false;
                }
                if (additionalDebugLoggingSamplingPercentage2 > 0) {
                    return d5 <= 1.0d / ((double) additionalDebugLoggingSamplingPercentage2);
                }
                if (AbstractC2205mx.A03(c2095lA) < 1) {
                    return false;
                }
                d11 = (iA04 * r0) / 10000.0d;
            } else if (!c2127lg.A0B()) {
                d11 = 0.0d;
            } else {
                d11 = iA04 / 100.0d;
            }
            double dA00 = c2095lA.A09().A00();
            if (A01(422, 5, 56).equals(str)) {
                if (c2095lA.A05().AB6()) {
                    return true;
                }
                int additionalDebugLoggingSamplingPercentage3 = AbstractC2205mx.A06(c2095lA);
                if (additionalDebugLoggingSamplingPercentage3 == 0) {
                    return false;
                }
                if (additionalDebugLoggingSamplingPercentage3 > 0) {
                    double cacheEventLogProbability = 1.0d / additionalDebugLoggingSamplingPercentage3;
                    return zContains ? dA00 <= cacheEventLogProbability * d11 : dA00 <= cacheEventLogProbability;
                }
            }
            if (A01(462, 7, 107).equals(str) && AbstractC2126lf.A20 == i5) {
                if (!A08.get()) {
                    additionalDebugLoggingSamplingPercentage = AbstractC2205mx.A0E(c2095lA);
                } else {
                    additionalDebugLoggingSamplingPercentage = 1;
                }
                if (additionalDebugLoggingSamplingPercentage == 0) {
                    return false;
                }
                if (additionalDebugLoggingSamplingPercentage > 0) {
                    double networkEventLogProbability = 1.0d / additionalDebugLoggingSamplingPercentage;
                    return zContains ? dA00 <= networkEventLogProbability * d11 : dA00 <= networkEventLogProbability;
                }
            }
            if (A01(437, 5, 113).equals(str)) {
                return true;
            }
            if (A01(442, 6, 63).equals(str)) {
                if ((!AbstractC2205mx.A0S(c2095lA) || !c2127lg.A0C()) && c2127lg.A00() != 1) {
                    if (c2127lg.A00() == 2) {
                        return false;
                    }
                    Boolean bool = A0C.get();
                    if (bool != null && bool.booleanValue()) {
                        return false;
                    }
                    int additionalDebugLoggingSamplingPercentage4 = AbstractC2205mx.A0A(c2095lA);
                    if (additionalDebugLoggingSamplingPercentage4 == 0) {
                        A0C.set(true);
                        return false;
                    }
                    if (additionalDebugLoggingSamplingPercentage4 > 0) {
                        double d12 = additionalDebugLoggingSamplingPercentage4;
                        if (A05[7].charAt(14) == 'T') {
                            throw new RuntimeException();
                        }
                        A05[1] = b.f42142b;
                        double funnelEventLogProbability = 1.0d / d12;
                        return zContains ? dA00 <= funnelEventLogProbability * d11 : dA00 <= funnelEventLogProbability;
                    }
                }
                if (zContains) {
                    return d5 >= 1.0d - d11;
                }
                if (A05[3].charAt(3) != 'Y') {
                    throw new RuntimeException();
                }
                String[] strArr = A05;
                strArr[4] = "KJjq974XMuOG6VE2UuXyW1KY5FJsZ9";
                strArr[0] = "oDF6i4FckldRw4UZ8099";
                return true;
            }
            if (A01(448, 14, 71).equals(str)) {
                if (c2095lA.A05().AB6()) {
                    return true;
                }
                z11 = true;
                int additionalDebugLoggingSamplingPercentage5 = AbstractC2205mx.A0B(c2095lA);
                if (additionalDebugLoggingSamplingPercentage5 == 0) {
                    return false;
                }
                if (additionalDebugLoggingSamplingPercentage5 > 0) {
                    double ipcValidationEventLogProbability = 1.0d / additionalDebugLoggingSamplingPercentage5;
                    return zContains ? dA00 <= ipcValidationEventLogProbability * d11 : dA00 <= ipcValidationEventLogProbability;
                }
            } else {
                z11 = true;
            }
            if (d5 >= 1.0d - d11) {
                return z11;
            }
            return false;
        } catch (Throwable t6) {
            A0F(t6);
            return false;
        }
    }

    public static boolean A0K(C2095lA c2095lA, String str, int i5, C2127lg c2127lg) {
        if (!AbstractC2205mx.A0P(c2095lA)) {
            return true;
        }
        int customLimit = A00.get(i5);
        int eventsLimit = AbstractC2205mx.A00(c2095lA);
        if (c2127lg.A02() != -1) {
            eventsLimit = c2127lg.A02();
        } else {
            int currentCounter = A00(str, i5, c2095lA);
            if (eventsLimit < currentCounter) {
                eventsLimit = currentCounter;
            }
        }
        if (customLimit >= eventsLimit) {
            if (A06.contains(Integer.valueOf(customLimit))) {
                boolean zA0D = c2127lg.A0D();
                if (A05[3].charAt(3) != 'Y') {
                    throw new RuntimeException();
                }
                String[] strArr = A05;
                strArr[5] = "DtDXz8TrFQQZw1pkgy";
                strArr[2] = "wKGFu6BM2pQR03pr0dyvmA98nTz";
                if (zA0D) {
                    A05(c2095lA, i5, customLimit);
                }
            }
            A00.put(i5, customLimit + 1);
            return true;
        }
        A00.put(i5, customLimit + 1);
        return false;
    }
}
