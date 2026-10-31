package com.facebook.ads.redexgen.X;

import android.graphics.PointF;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.bv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1532bv {
    public static byte[] A02;
    public static String[] A03 = {"kW1hDeNUtC10tqWJP3kbzfKlhjVFHikh", "phn6Qh3zA2H9XBtM6W9ZZ8JCFp5sv", "lkpgTxM7MOA4iC9TmWryDFWtGOdOqOFL", "7UyNPDcne8Q0yRa025pCMg2HdCA5Dbez", "3Kx5IGch5tgSdy5M7bYxpCLUwpyZwknX", "z2w3aRxGr2SVMLOZGPUrF1YfiYRiOJHA", "7haUnRF2jWU0H8OvFrVCTPnNTVf2pYkO", "PPb2ojmgml1Rr7V32yKrumDvrKyyOdFK"};
    public static final Pattern A04;
    public static final Pattern A05;
    public static final Pattern A06;
    public static final Pattern A07;
    public final int A00;
    public final PointF A01;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 59);
            if (A03[2].charAt(9) == '5') {
                throw new RuntimeException();
            }
            A03[2] = "6qz2bz4OX7RDs3QoRSkwDXP6RYd92hSp";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A02 = new byte[]{32, 44, 21, 6, 17, 17, 10, 7, 6, 67, 11, 2, 16, 67, 1, 12, 23, 11, 67, 63, 19, 12, 16, 75, 27, 79, 26, 74, 67, 2, 13, 7, 67, 63, 14, 12, 21, 6, 75, 27, 82, 79, 26, 82, 79, 27, 81, 79, 26, 81, 74, 88, 67, 22, 16, 10, 13, 4, 67, 63, 19, 12, 16, 67, 21, 2, 15, 22, 6, 16, 77, 67, 12, 21, 6, 17, 17, 10, 7, 6, 94, 68, 74, 106, 120, 74, 109, 96, 117, 124, 55, 86, 111, 124, 107, 107, 112, 125, 124, 106, 59, 59, 6, 9, 79, 59, 3, 76, 78, 48, 48, 1, 3, 26, 9, 48, 68, 73, 93, 72, 31, 64, 73, 93, 72, 31, 64, 68, 73, 93, 72, 31, 69, 64, 68, 73, 93, 72, 31, 69, 68, 83, 86, 64, 73, 93, 72, 31, 64, 73, 93, 72, 31, 69, 83, 48, 69, 48, 48, 28, 3, 31, 48, 68, 68, 73, 93, 72, 31, 69, 64, 68, 73, 93, 72, 31, 69, 48, 69, 45, 2, 91, 45, 21, 90, 89, 78, 75, 45, 95, 45, 21, 90, 88, 78, 45, 2, 91, 57, 30, 77, 62, 59, 24, 56, 79, 76, 57, 24};
    }

    static {
        A05();
        A05 = Pattern.compile(A03(198, 11, 94));
        String strA03 = A03(179, 19, 74);
        A07 = Pattern.compile(N1.A0n(A03(157, 22, 87), strA03));
        A06 = Pattern.compile(N1.A0n(A03(109, 48, 87), strA03));
        A04 = Pattern.compile(A03(100, 9, 92));
    }

    public C1532bv(int i5, PointF pointF) {
        this.A00 = i5;
        this.A01 = pointF;
    }

    public static int A00(String str) {
        Matcher matcher = A04.matcher(str);
        if (!matcher.find()) {
            return -1;
        }
        return C1535by.A01((String) AbstractC1062Ln.A01(matcher.group(1)));
    }

    public static PointF A01(String str) {
        String strGroup;
        String strGroup2;
        Matcher matcher = A07.matcher(str);
        Matcher matcher2 = A06.matcher(str);
        boolean zFind = matcher.find();
        boolean zFind2 = matcher2.find();
        if (zFind) {
            if (zFind2) {
                MV.A06(A03(82, 18, 34), A03(1, 81, 88) + str + A03(0, 1, 60));
            }
            strGroup = matcher.group(1);
            strGroup2 = matcher.group(2);
        } else if (zFind2) {
            strGroup = matcher2.group(1);
            strGroup2 = matcher2.group(2);
        } else {
            return null;
        }
        return new PointF(Float.parseFloat(((String) AbstractC1062Ln.A01(strGroup)).trim()), Float.parseFloat(((String) AbstractC1062Ln.A01(strGroup2)).trim()));
    }

    public static C1532bv A02(String str) {
        int parsedAlignment = -1;
        PointF pointF = null;
        Matcher matcher = A05.matcher(str);
        while (true) {
            boolean zFind = matcher.find();
            if (A03[1].length() == 27) {
                throw new RuntimeException();
            }
            A03[3] = "5j4W49oWo7V2aba71yHq1gnFYjcOXEId";
            if (zFind) {
                String str2 = (String) AbstractC1062Ln.A01(matcher.group(1));
                try {
                    PointF pointFA01 = A01(str2);
                    if (pointFA01 != null) {
                        pointF = pointFA01;
                    }
                } catch (RuntimeException unused) {
                }
                try {
                    int iA00 = A00(str2);
                    if (iA00 != -1) {
                        parsedAlignment = iA00;
                    }
                } catch (RuntimeException unused2) {
                }
            } else {
                return new C1532bv(parsedAlignment, pointF);
            }
        }
    }

    public static String A04(String str) {
        return A05.matcher(str).replaceAll(A03(0, 0, 71));
    }
}
