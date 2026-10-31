package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.kb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2063kb {
    public static byte[] A00;
    public static String[] A01 = {"zJ7sRo3sU3MwvYkxVq5sKXU", "uwqdBBQkb", "sk1pAaPClwmr1DZFuM4XEVJDjMgj4luU", "2DEAuAVf", "LM1sVeBw6DNfIdZzIYsj5hqYQDPEhJFy", "hYSBjzGCwuKpFZFqojmwIwdxMJLMCyYz", "BWOi5Qn34m6VEGTMmYfzcDYeX0GTjOOy", "rscTiGR64sMWr7IEiXLU0M2EjoTwZlLg"};
    public static final AtomicReference<C2061kZ> A02;
    public static final AtomicReference<String> A03;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{-98, -90, -95, -100, -84, -77, -94, -81, -81, -90, -95, -94, -95, -97, -88, -97, -84, -93, -99, -20, -25, -23, -28, -30, -14, -7, -24, -11, -11, -20, -25, -24};
    }

    static {
        A05();
        A02 = new AtomicReference<>();
        A03 = new AtomicReference<>(A04(0, 0, 68));
    }

    public static C2061kZ A00() {
        C2061kZ c2061kZ = A02.get();
        if (A01[6].charAt(15) == 'M') {
            String[] strArr = A01;
            strArr[3] = "GQnQs3ZS";
            strArr[1] = "yTwJu7KeR";
            C2061kZ c2061kZ2 = c2061kZ;
            if (c2061kZ2 == null) {
                C2061kZ c2061kZA00 = C2061kZ.A00();
                String[] strArr2 = A01;
                if (strArr2[3].length() != strArr2[1].length()) {
                    A01[0] = "yvynwBtI7EoQ7kGRkYf58OE";
                    return c2061kZA00;
                }
            } else {
                return c2061kZ2;
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Code restructure failed: missing block: B:4:0x000a, code lost:
    
        if (android.text.TextUtils.isEmpty(r6.A03()) != false) goto L5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C2061kZ A01(C2095lA c2095lA, C2061kZ c2061kZ) {
        if (c2061kZ != null) {
            try {
            } catch (Throwable t6) {
                c2095lA.A08().ABz(A04(12, 7, 6), AbstractC2126lf.A1Q, new C2127lg(t6));
            }
        }
        return AbstractC2068kh.A00(c2095lA);
        return c2061kZ;
    }

    public static C2061kZ A02(C2095lA c2095lA, C2061kZ c2061kZ, C2062ka c2062ka) {
        C2064kc c2064kcA00 = null;
        try {
            if (AbstractC2201mt.A06(c2095lA) && (c2061kZ == null || TextUtils.isEmpty(c2061kZ.A03()))) {
                c2064kcA00 = AbstractC2065kd.A00(c2095lA.getContentResolver());
            }
        } catch (Throwable th2) {
            c2095lA.A08().ABz(A04(12, 7, 6), AbstractC2126lf.A1S, new C2127lg(th2));
        }
        if (c2064kcA00 != null && c2064kcA00.A01 != null) {
            A03.set(c2064kcA00.A01);
            c2062ka.A05(c2064kcA00.A01);
        }
        if (c2061kZ == null && c2064kcA00 != null && !TextUtils.isEmpty(c2064kcA00.A00)) {
            return new C2061kZ(c2064kcA00.A00, c2064kcA00.A02, EnumC2060kY.A05);
        }
        return c2061kZ;
    }

    public static String A03() {
        String attributionId = A03.get();
        if (attributionId == null) {
            return A04(0, 0, 68);
        }
        return attributionId;
    }

    public static void A06(C2062ka c2062ka) {
        A02.set(c2062ka.A02());
        A03.set(c2062ka.A03());
    }

    public static void A07(C2095lA c2095lA) {
        long jA01;
        C2061kZ advertisingIdInfo;
        try {
            C2062ka c2062ka = new C2062ka(c2095lA);
            A06(c2062ka);
            if (A08()) {
                return;
            }
            C2061kZ advertisingIdInfo2 = A02.get();
            if (advertisingIdInfo2 != null && !TextUtils.isEmpty(advertisingIdInfo2.A03())) {
                jA01 = advertisingIdInfo2.A01();
            } else {
                jA01 = -1;
            }
            if (jA01 > 0 && System.currentTimeMillis() - jA01 < AbstractC2201mt.A00(c2095lA)) {
                return;
            }
            if (AbstractC2201mt.A07(c2095lA)) {
                advertisingIdInfo = A01(c2095lA, A02(c2095lA, null, c2062ka));
            } else {
                advertisingIdInfo = A02(c2095lA, A01(c2095lA, null), c2062ka);
            }
            if (advertisingIdInfo != null && !TextUtils.isEmpty(advertisingIdInfo.A03())) {
                A02.set(advertisingIdInfo);
                c2062ka.A04(advertisingIdInfo);
            }
        } catch (Throwable t6) {
            c2095lA.A08().ABz(A04(12, 7, 6), AbstractC2126lf.A1R, new C2127lg(t6));
        }
    }

    public static boolean A08() {
        boolean z11 = false;
        boolean updated = C2353pR.A04();
        if (updated) {
            if (A01[0].length() != 23) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = "OqjdKmMb";
            strArr[1] = "Sbvi0a9C0";
            String strA04 = A04(0, 12, 9);
            boolean updated2 = C2353pR.A05(strA04);
            if (updated2) {
                A03.set(C2353pR.A01(strA04));
                z11 = true;
            }
        }
        boolean zA04 = C2353pR.A04();
        String[] strArr2 = A01;
        if (strArr2[5].charAt(29) != strArr2[4].charAt(29)) {
            A01[6] = "1QSggKSi3jrfAw1MbHCsavUz8mNGSj1M";
            if (!zA04) {
                return z11;
            }
        } else {
            A01[6] = "SqTb5lTJEle7YRZML8ItyxwGEN07wws1";
            if (!zA04) {
                return z11;
            }
        }
        String strA042 = A04(19, 13, 79);
        boolean updated3 = C2353pR.A05(strA042);
        if (updated3) {
            String strA01 = C2353pR.A01(strA042);
            AtomicReference<C2061kZ> atomicReference = A02;
            if (strA01 == null) {
                strA01 = A04(0, 0, 68);
            }
            atomicReference.set(new C2061kZ(strA01, false, EnumC2060kY.A04));
            return true;
        }
        return z11;
    }
}
