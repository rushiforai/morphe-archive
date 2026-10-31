package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* renamed from: com.facebook.ads.redexgen.X.oG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2284oG {
    public static boolean A00;
    public static byte[] A01;
    public static String[] A02 = {"WcKxqk7L6BbuUQ1o7qmtmX6WSmYBceUW", "BgR1wHMut0LLHWxcn1vNnqjOmnDpA7yk", "nofrFHfyJT7pmG0QketyEOeNZ4PDBNqx", "tJ6rTzDc1vJYhzSuFM6hiX1fKi0tAXSV", "zeDIr51bIn8XcOdXOM6dVjfvh9EOKJZZ", "x4ZdmXYSSnH60B6WOaypztUTceO04NF4", "XXJyOaEVU", "eLFDRkAKNxNhqN4Dib4JBju5Hz9f2MYZ"};
    public static final Map<String, Long> A03;
    public static final Map<String, Long> A04;
    public static final Map<String, String> A05;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 64);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A01 = new byte[]{-35, 43, -14, -35, 43, -14, -35, 28, -14, -35, 28, -14, -35, 28, -27, -24, -27, -24, 22, -23, -21, 21, -20, 10, 0, 5, -2, -73, 3, -8, 10, 11, -73, -8, -5, -73, 9, -4, 10, 7, 6, 5, 10, -4, 5, 3, 18, -22, -1, 17, 18, -16, 3, 17, 14, 13, 12, 17, 3};
    }

    static {
        A04();
        A04 = new ConcurrentHashMap();
        A03 = new ConcurrentHashMap();
        A05 = new ConcurrentHashMap();
        A00 = false;
    }

    public static long A00(String str, EnumC2265nx enumC2265nx) {
        if (A04.containsKey(str)) {
            return A04.get(str).longValue();
        }
        switch (enumC2265nx) {
            case A0D:
            case A0E:
            case A0F:
            case A0C:
                return 15000L;
            default:
                return -1000L;
        }
    }

    public static String A02(C2285oH c2285oH) {
        AbstractC2273o5.A05(A01(44, 15, 94), A01(22, 22, 87), A01(14, 8, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        return A05.get(A03(c2285oH));
    }

    public static String A03(C2285oH c2285oH) {
        return String.format(Locale.US, A01(0, 14, 120), c2285oH.A09(), c2285oH.A07(), Integer.valueOf(c2285oH.A08() == null ? 0 : c2285oH.A08().A00()), Integer.valueOf(c2285oH.A08() == null ? 0 : c2285oH.A08().A01()), Integer.valueOf(c2285oH.A04()));
    }

    public static void A05(long j11, C2285oH c2285oH) {
        A04.put(A03(c2285oH), Long.valueOf(j11));
    }

    public static void A06(C2285oH c2285oH) {
        A03.put(A03(c2285oH), Long.valueOf(System.currentTimeMillis()));
    }

    public static void A07(String str, C2285oH c2285oH) {
        A05.put(A03(c2285oH), str);
    }

    public static boolean A08(C2285oH c2285oH) {
        if (A00) {
            return false;
        }
        String strA03 = A03(c2285oH);
        if (!A03.containsKey(strA03)) {
            return false;
        }
        Long l9 = A03.get(strA03);
        if (A02[3].charAt(17) != 'M') {
            throw new RuntimeException();
        }
        A02[6] = "HNdF4hlEpt9Mz";
        return System.currentTimeMillis() - l9.longValue() < A00(strA03, c2285oH.A07());
    }
}
