package com.facebook.ads.redexgen.X;

import android.content.Context;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class IO {
    public static byte[] A00;
    public static String[] A01 = {"Yw98xlDxu7Gm7uZaUDcZWp9JeQeD", "jhrOklqYIMEykPIlFBHsHQ", "dX4WeuqkLefvu9bhPargj52SflqZn9A", "j2B9Ibdamtz9bzCrP44YwgVQMHmjWZ9a", "e0LuVdKaVts63ti6MkWAqTaToxR3Ckhj", "QbSq94Mn", "0A6imsUVtBduxhrh1ZFWC3", "ft3FYqqLf6oZD7QY58VTV72wWfA1"};
    public static final String[] A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{116, 123, 113, 103, 122, 124, 113, 59, 102, 96, 101, 101, 122, 103, 97, 59, 118, 96, 102, 97, 122, 120, 97, 116, 119, 102, 59, 92, 86, 96, 102, 97, 122, 120, 65, 116, 119, 102, 86, 116, 121, 121, 119, 116, 118, 126, 56, 55, 61, 43, 54, 48, 61, 119, 42, 44, 41, 41, 54, 43, 45, 119, 58, 44, 42, 45, 54, 52, 45, 56, 59, 42, 119, 16, 26, 44, 42, 45, 54, 52, 13, 56, 59, 42, 10, 60, 43, 47, 48, 58, 60};
    }

    static {
        A02();
        A02 = new String[]{A01(46, 45, 24), A01(0, 46, 84)};
    }

    public static int A00(Context context) throws Throwable {
        if (!A03()) {
            return 2;
        }
        try {
            String packageName = AbstractC0990Io.A03(context.getApplicationContext(), null);
            return packageName == null ? 1 : 0;
        } catch (Throwable unused) {
            if (A01[4].charAt(30) != 'h') {
                Throwable t6 = new RuntimeException();
                throw t6;
            }
            A01[3] = "QDrSxZzfr55AzKouW5H4NBVnOKvXJaeJ";
            return 3;
        }
    }

    public static boolean A03() {
        ClassLoader classLoader = IO.class.getClassLoader();
        for (String str : A02) {
            try {
                Class.forName(str, false, classLoader);
            } catch (Throwable unused) {
                return false;
            }
        }
        return true;
    }
}
