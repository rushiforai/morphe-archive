package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.hz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1903hz {
    public static byte[] A03;
    public static String[] A04 = {"cI8YZmQj72RYqWsUAvIEEjhxVICLAuw9", "e9nWxkqivpQViLhqbKAsvkaTTgCYzCdB", "aSR5fA70m7RQa74LrU", "LXYZzSzwiDdZicj1BWbev89Ac3Fngy4U", "orKh83XQ8XRV3b79a451TffZpZWnBNJ4", "l8fBO", "SxDYPjoNnF", "tAV0Nh0X6"};
    public final long A00;
    public final String A01;
    public final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 104);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {111, 99, 38, 49, 49, 44, 49, 7, 44, 46, 34, 42, 45, 126, 10, 6, 67, 84, 84, 73, 84, 107, 67, 85, 85, 71, 65, 67, 27, 35, 20, 20, 9, 20, 34, 7, 18, 7, 78, 3, 20, 20, 9, 20, 37, 9, 2, 3, 91, 125, 106, 106, 119, 106, 92, 119, 117, 121, 113, 118};
        if (A04[4].charAt(8) != '8') {
            throw new RuntimeException();
        }
        A04[4] = "w68Je9lL8rd3QMplmT86bHMhMkli6MyM";
        A03 = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        boolean z11 = obj instanceof C1903hz;
        if (A04[0].charAt(1) == 'I') {
            A04[2] = "fDW3lnGYNYGrglToSW";
            if (!z11) {
                return false;
            }
            C1903hz c1903hz = (C1903hz) obj;
            if (this.A00 != c1903hz.A00) {
                return false;
            }
            String str = this.A01;
            String str2 = c1903hz.A01;
            if (A04[6].length() != 30) {
                A04[3] = "eQM4jqa9Wj869C7YQtuVWmHEyooIpi7F";
                return C1h.A0C(str, str2) && C1h.A0C(this.A02, c1903hz.A02);
            }
        }
        throw new RuntimeException();
    }

    public final int hashCode() {
        return (((C1x.A00(this.A00) * 31) + this.A01.hashCode()) * 31) + (this.A02 == null ? 0 : this.A02.hashCode());
    }

    public final String toString() {
        return A00(29, 20, 14) + this.A00 + A00(0, 14, 43) + this.A01 + A00(14, 15, 78) + this.A02 + ')';
    }

    static {
        A01();
    }

    public C1903hz(long j11, String str, String str2) {
        C1h.A09(str, A00(49, 11, 112));
        this.A00 = j11;
        this.A01 = str;
        this.A02 = str2;
    }

    public final long A02() {
        return this.A00;
    }

    public final String A03() {
        return this.A01;
    }

    public final String A04() {
        return this.A02;
    }
}
