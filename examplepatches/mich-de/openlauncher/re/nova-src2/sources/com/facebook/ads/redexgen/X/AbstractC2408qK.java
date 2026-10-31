package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.qK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2408qK {
    public static byte[] A00;
    public static final Pattern A01;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A00 = new byte[]{89, 45, 2, 90, 16, 5, 45, 2, 90, 42, 16, 92, 11, 95, 44, 90, 88, 42, 48, 92, 43, 44, 95, 91, 120, 78, 73, 73, 94, 85, 79, 27, 72, 79, 90, 88, 80, 27, 79, 73, 90, 88, 94, 33, 45, 47, 108, 36, 35, 33, 39, 32, 45, 45, 41, 108, 35, 38, 49};
    }

    static {
        A07();
        A01 = Pattern.compile(A02(0, 24, 13));
    }

    public static String A00() {
        return A06(new Exception(A02(24, 19, 71)), -1, -1, false);
    }

    public static String A01(int i5) {
        if (i5 <= 0) {
            return null;
        }
        float rate = new Random().nextFloat();
        if (rate >= 1.0f / i5) {
            return null;
        }
        return A00();
    }

    public static String A03(Context context, Throwable th2) {
        int iA0K = C2203mv.A0K(context);
        int maxStacktraceLines = C2203mv.A01(context);
        return A06(th2, iA0K, maxStacktraceLines, C2203mv.A1h(context));
    }

    public static String A04(String str) {
        Matcher matcher = A01.matcher(str);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        return str;
    }

    public static String A06(Throwable th2, int i5, int i11, boolean z11) {
        String strA02 = A02(0, 0, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        if (th2 == null) {
            return strA02;
        }
        try {
            G8 g82 = new G8();
            InterfaceC2406qI g72 = g82;
            if (i11 >= 0) {
                g72 = new G6(g72, i11);
            }
            if (i5 >= 0) {
                g72 = new G5(g72, i5, i5);
            }
            if (z11) {
                g72 = new G7(g72);
            }
            G9 g92 = new G9(g82, 1, g72);
            th2.printStackTrace(new PrintWriter(new C2407qJ(g92)));
            g92.flush();
            return g82.toString();
        } catch (Exception unused) {
            return strA02;
        }
    }

    public static boolean A08(C2405qH c2405qH) {
        String middle = c2405qH.A02();
        if (middle == null) {
            return false;
        }
        if (A0A(middle)) {
            return true;
        }
        Iterator<String> it = c2405qH.A01().iterator();
        while (it.hasNext()) {
            if (A0A(it.next())) {
                return true;
            }
        }
        Iterator<String> it2 = c2405qH.A00().iterator();
        while (it2.hasNext()) {
            if (A0A(it2.next())) {
                return true;
            }
        }
        return false;
    }

    public static boolean A0A(String str) {
        return str.contains(A02(43, 16, 62));
    }
}
