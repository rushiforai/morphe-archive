package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.gb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1820gb {
    public static C1819ga A00;
    public static byte[] A01;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 45);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{58, 54, 52, 119, 63, 56, 58, 60, 59, 54, 54, 50, 119, 56, 61, 42, 119, 24, 29, 6, 11, 28, 9, 22, 11, 13, 16, 23, 30, 6, 26, 22, 23, 31, 16, 30};
    }

    public static C1819ga A00(C0957Hh c0957Hh) {
        if (A00 == null) {
            synchronized (C1819ga.class) {
                if (A00 == null) {
                    A00 = new C1819ga(new JV(c0957Hh.getSharedPreferences(ProcessUtils.getProcessSpecificName(A01(0, 36, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), c0957Hh), 0)));
                }
            }
        }
        return A00;
    }
}
