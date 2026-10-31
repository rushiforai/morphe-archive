package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.cV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1568cV {
    public static byte[] A04;
    public static String[] A05 = {"D0dXtGgXin3", "7nQrgzdjO7jRLraTW4nAKvh5tDBgYzp9", "wMq9ienP3lQK3ib7GY055MRfhMIp", "AMKJcKF431ywkvfCV25hNPgsdrXf", "osfNEYan4urd04zvWqfTTwvnDCxQsQKo", "8V8cp6PNtgCcEzTXHdpyymBlz2EEko", "0E7XsTVK4j29vCXDlAMOm9lQTPIH9hF2", "wy4yvRjj1Bly7wJuTgmemASOqG7Hv9n2"};
    public final int A00;
    public final String A01;
    public final String A02;
    public final Set<String> A03;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A04 = new byte[]{24, 32, 82};
    }

    static {
        A03();
    }

    public C1568cV(String str, int i5, String str2, Set<String> classes) {
        this.A00 = i5;
        this.A01 = str;
        this.A02 = str2;
        this.A03 = classes;
    }

    public static C1568cV A00() {
        Set setEmptySet = Collections.emptySet();
        String strA02 = A02(0, 0, 65);
        return new C1568cV(strA02, 0, strA02, setEmptySet);
    }

    public static C1568cV A01(String str, int i5) {
        String strTrim;
        String strTrim2 = str.trim();
        AbstractC1062Ln.A07(!strTrim2.isEmpty());
        int iIndexOf = strTrim2.indexOf(A02(0, 1, 115));
        if (iIndexOf != -1) {
            strTrim = strTrim2.substring(iIndexOf).trim();
            strTrim2 = strTrim2.substring(0, iIndexOf);
        } else {
            if (A05[7].charAt(18) != 'm') {
                throw new RuntimeException();
            }
            A05[1] = "OR07a21iGQGLSx93lkkPVi2GouDNNGDQ";
            strTrim = A02(0, 0, 65);
        }
        String[] strArrA1O = N1.A1O(strTrim2, A02(1, 2, 55));
        String str2 = strArrA1O[0];
        HashSet hashSet = new HashSet();
        int i11 = 1;
        while (true) {
            int length = strArrA1O.length;
            String voice = A05[7];
            if (voice.charAt(18) == 'm') {
                A05[7] = "tu5TMGrF0b3bhXScxCmUyOgKmgN3la4S";
                if (i11 >= length) {
                    break;
                }
                hashSet.add(strArrA1O[i11]);
                i11++;
            } else {
                if (i11 >= length) {
                    break;
                }
                hashSet.add(strArrA1O[i11]);
                i11++;
            }
        }
        return new C1568cV(str2, i5, strTrim, hashSet);
    }
}
