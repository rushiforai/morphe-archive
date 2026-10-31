package com.facebook.ads.redexgen.X;

import android.provider.Settings;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.af, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1454af {
    public static InterfaceC1534bx A00;
    public static byte[] A01;
    public static String[] A02 = {"b", "jWWIi2TrnHAAyoG5itvaKpzBpE6rwsKb", "4piz2zd6PBPCOA5LKuru6huyc0Gk9hmI", "ThWxRwfxtMClt6xxWNEGrvPqHoOGiBgN", "VC0ltrZe3ujZ5yBmE9F34w5pTHRf8GMT", "g0Z7XyqsbnnTrD4DkPgr08gcmreNHhpx", "VVYGWntGozQ2sTcwE1XxLnyTeGzWkyyX", "XVqTwdXEkxL4UUDwn3dakWK60VTsxJd5"};
    public static final Set<String> A03;
    public static final Set<String> A04;
    public static final AtomicBoolean A05;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 56);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A01 = new byte[]{36, 101, 110, 8, 85, 68, 11, 77, 77, 2, AbstractJsonLexerKt.TC_INVALID, 10, 123, 99, 73, 104, 8, 85, 98, 15, 86, 84, 94, 81, 8, 82, 77, 74, 8, 111, 85, 73, 81, 7, 48, AbstractJsonLexerKt.TC_INVALID, 32, 7, 58, 38, 2, 63, 42, 33, 62, 34, 103, 27, 33, 42, 8, 36, 58, 62, 126, 37, 26, 36, 99, 53, 30, 63, 113, 70, 13, AbstractJsonLexerKt.TC_INVALID, 119, 30, 59, 10, 123, 54, 3, 12, 43, 35, 38, 123, 61, 63, 59, 54, 62, 14, 10, 44, 53, 23, 0, 42, 14, 114, 69, 107, 64, 81, 82, 74, 87, 78, 76, 75, 66, 5, 71, 64, 67, 74, 87, 64, 5, 76, 75, 76, 81, 4, 113, 115, 113, 96, 31, 72, 71, 115, 75, 77, 98, 79, 2, 93, 72, 124, 123, 77, 71, 80, 124, 97, 28, 64, 89, 78, 100, 20, 35, 54, 62, 37, 39, 59, 54, 57, 50, 8, 58, 56, 51, 50, 8, 56, 57, 7, 12, 29, 30, 6, 27, 2, 19, 8, 61, 85, 32, 53, 9, 53, 13, 36, 94, 55, 82, 49, 49, 50, 3, 36, 23, 40, 21, 33, 47, 95, 11, 1, 54, 90, 109};
    }

    static {
        A07();
        A03 = new HashSet();
        A04 = new HashSet();
        A03.add(A05(6, 29, 2));
        A04.add(A05(168, 29, 95));
        A04.add(A05(35, 29, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        A04.add(A05(64, 29, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        A04.add(A05(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 29, 17));
        A05 = new AtomicBoolean();
    }

    public static InterfaceC1529bs A00(C2095lA c2095lA) {
        return A03(true, c2095lA);
    }

    public static InterfaceC1529bs A01(C2095lA c2095lA) {
        return A02(true, c2095lA);
    }

    public static InterfaceC1529bs A02(boolean z11, C2095lA c2095lA) {
        C1507bW c1507bW = new C1507bW();
        C1502bR c1502bRA04 = A04(c2095lA);
        if (A0B(c2095lA)) {
            c1507bW.A05(true);
        } else {
            c1507bW.A02(A04);
            c1507bW.A01(A03);
        }
        if (C2353pR.A04()) {
            Map<String, String> mapA02 = C2353pR.A02();
            String[] strArr = A02;
            if (strArr[2].charAt(7) == strArr[1].charAt(7)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[5] = "6CjO7LbqJIONUadrRHmx0RuGBypxStir";
            strArr2[3] = "VKsjD9ddp6JrHwn0FL0Df9QGs7RhJ4JT";
            c1502bRA04.A08(mapA02);
        }
        C0769Aa c0769AaA00 = AbstractC1526bp.A00();
        C1507bW networkModuleConfigurationBuilder = c1507bW.A00(c1502bRA04.A09());
        return c0769AaA00.A00(networkModuleConfigurationBuilder.A03(z11).A04(c2095lA.A05().AB6()).A06(), c2095lA.A08(), ExecutorC2431qh.A01());
    }

    public static InterfaceC1529bs A03(boolean z11, C2095lA c2095lA) {
        return AbstractC1526bp.A00().A00(new C1507bW().A03(z11).A00(A04(c2095lA).A09()).A04(c2095lA.A05().AB6()).A06(), c2095lA.A08(), ExecutorC2431qh.A01());
    }

    public static C1502bR A04(C2095lA c2095lA) {
        A08(c2095lA);
        C1502bR c1502bR = new C1502bR();
        if (A0B(c2095lA) || C2353pR.A04()) {
            c1502bR.A02(360000).A04(120000);
        } else {
            c1502bR.A02(C2203mv.A07(c2095lA)).A04(C2203mv.A09(c2095lA));
        }
        c1502bR.A03(C2203mv.A08(c2095lA)).A05(C2203mv.A0A(c2095lA)).A06(C2203mv.A0B(c2095lA));
        synchronized (C1454af.class) {
            if (A00 != null && (A00 instanceof InterfaceC1534bx)) {
                c1502bR.A07(A00);
            }
        }
        return c1502bR;
    }

    public static void A06() {
        A05.set(true);
    }

    public static void A08(C2095lA c2095lA) {
        if (!A05.get()) {
            c2095lA.A08().ABz(A05(161, 7, 81), AbstractC2126lf.A21, new C2127lg(A05(93, 23, 29)));
        }
    }

    public static synchronized void A09(InterfaceC1534bx interfaceC1534bx) {
        A00 = interfaceC1534bx;
    }

    public static boolean A0A(C2095lA c2095lA) {
        return Settings.Global.getInt(c2095lA.getContentResolver(), A05(145, 16, 111), 0) != 0;
    }

    public static boolean A0B(C2095lA c2095lA) {
        String strAA3 = c2095lA.A05().AA3();
        if (!TextUtils.isEmpty(strAA3)) {
            String urlPrefix = A05(3, 3, 30);
            if (!strAA3.endsWith(urlPrefix)) {
                String urlPrefix2 = A05(0, 3, 50);
                if (strAA3.endsWith(urlPrefix2)) {
                }
            }
            return true;
        }
        return false;
    }
}
