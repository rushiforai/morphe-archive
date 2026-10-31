package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.Ne, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1104Ne {
    public static byte[] A00;
    public static final Pattern A01;
    public static final Pattern A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 37);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{27, 19, 47, 47, 43, 14, 47, 50, 55, 8, 47, 34, 46, 47, 50, 40, 50, 53, 36, 47, 53, 97, 41, 36, 32, 37, 36, 51, 50, 97, 26, 34, 25, 18, 15, 7, 18, 20, 3, 18, 19, 87, 52, 24, 25, 3, 18, 25, 3, 90, 59, 18, 25, 16, 3, 31, 87, 44, 108, 87, 92, 65, 73, 92, 90, 77, 92, 93, 25, 122, 86, 87, 77, 92, 87, 77, 20, 107, 88, 87, 94, 92, 25, 98, 62, 78, 51, 72, 119, 108, 97, 112, 102, 53, 61, 42, 47, 61, 42, 47, 73, 113, 62, 56, 73, 113, 62, 60, 105, 73, 63, 60, 58, 61, 73, 113, 62, 60, 43, 48, 61, 44, 58, 105, 97, 21, 45, 98, 96, 100, 97, 21, 45, 98, 96, 102, 97, 118, 115, 21, 45, 98, 53, 21, 99, 96, 66, 89, 84, 69, 83, 29};
    }

    static {
        A04();
        A02 = Pattern.compile(A02(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 28, 108));
        A01 = Pattern.compile(A02(88, 30, 48));
    }

    public static long A00(String str) {
        if (TextUtils.isEmpty(str)) {
            return -1L;
        }
        Matcher matcher = A01.matcher(str);
        if (matcher.matches()) {
            return Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(1)));
        }
        return -1L;
    }

    public static long A01(String str, String str2) throws NumberFormatException {
        long jMax = -1;
        boolean zIsEmpty = TextUtils.isEmpty(str);
        String strA02 = A02(84, 1, 70);
        String strA022 = A02(1, 8, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        if (!zIsEmpty) {
            try {
                jMax = Long.parseLong(str);
            } catch (NumberFormatException unused) {
                MV.A05(strA022, A02(31, 27, 82) + str + strA02);
            }
        }
        if (!TextUtils.isEmpty(str2)) {
            Matcher matcher = A02.matcher(str2);
            if (matcher.matches()) {
                try {
                    long j11 = (Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(2))) - Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(1)))) + 1;
                    if (jMax < 0) {
                        return j11;
                    }
                    if (jMax != j11) {
                        MV.A07(strA022, A02(9, 22, 100) + str + A02(85, 3, 54) + str2 + strA02);
                        jMax = Math.max(jMax, j11);
                        return jMax;
                    }
                    return jMax;
                } catch (NumberFormatException unused2) {
                    MV.A05(strA022, A02(58, 26, 28) + str2 + strA02);
                    return jMax;
                }
            }
            return jMax;
        }
        return jMax;
    }

    public static String A03(long j11, long j12) {
        if (j11 == 0 && j12 == -1) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(A02(146, 6, 5));
        sb2.append(j11);
        sb2.append(A02(0, 1, 19));
        if (j12 != -1) {
            sb2.append((j11 + j12) - 1);
        }
        return sb2.toString();
    }
}
