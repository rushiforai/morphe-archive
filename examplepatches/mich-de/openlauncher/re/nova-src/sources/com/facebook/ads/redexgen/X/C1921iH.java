package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.iH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1921iH {
    public static byte[] A04;
    public static String[] A05 = {"QuaalhDpDah20LX2wxgS6m2LJMNg0MsY", "Kv65PDKGzQbP8opzJD3T0Bs4qFkMuEvW", "yAGu2U2W7yMlSo0lcdd0QNLvUGBJ2w5m", "aJo4Pz0hsbQrFibFt4ypJbnLPuINPYvA", "18JvwLOKolmi3RAuIpcsWcjyGiEhXJWG", "AlJwV0uWjEUfV5LlQyKVHG51mucaZZJu", "um2uWSM0iR5xPcbZFnmwGsQ9sHGc90", "QpR6AGAR"};
    public int A00;
    public int A01;
    public int A02;

    @Nullable
    public Object A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 115);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-77, -9, -63, -34, 37, -20, -62, -62, -35, -4, 18, 21, 21, 20, -21, 82, 91, 4, -1, 85, 80};
    }

    static {
        A02();
    }

    public C1921iH(@Nullable int i5, int i11, int i12, Object obj) {
        this.A00 = i5;
        this.A02 = i11;
        this.A01 = i12;
        this.A03 = obj;
    }

    private final String A00() {
        switch (this.A00) {
            case 1:
                return A01(10, 3, 62);
            case 2:
                String[] strArr = A05;
                if (strArr[4].charAt(8) == strArr[0].charAt(8)) {
                    throw new RuntimeException();
                }
                A05[1] = "xbTSMp8fvBEENljIQe5QRmpFAlAe0spq";
                return A01(17, 2, 31);
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                return A01(6, 2, 16);
            case 4:
                return A01(19, 2, 109);
            case 8:
                return A01(15, 2, 114);
        }
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1921iH c1921iH = (C1921iH) obj;
        if (this.A00 != c1921iH.A00) {
            return false;
        }
        if (this.A00 == 8 && Math.abs(this.A01 - this.A02) == 1 && this.A01 == c1921iH.A02 && this.A02 == c1921iH.A01) {
            return true;
        }
        if (this.A01 != c1921iH.A01 || this.A02 != c1921iH.A02) {
            return false;
        }
        if (this.A03 != null) {
            if (!this.A03.equals(c1921iH.A03)) {
                return false;
            }
        } else {
            Object obj2 = c1921iH.A03;
            if (A05[2].charAt(7) == 'q') {
                throw new RuntimeException();
            }
            A05[6] = "4VD3xUS92qaUHk8jcTCUJI3HU1kIkp";
            if (obj2 != null) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        int result = this.A00;
        int i5 = result * 31;
        int result2 = this.A02;
        return ((i5 + result2) * 31) + this.A01;
    }

    public final String toString() {
        return Integer.toHexString(System.identityHashCode(this)) + A01(8, 1, 15) + A00() + A01(3, 3, 63) + this.A02 + A01(13, 2, 62) + this.A01 + A01(0, 3, 20) + this.A03 + A01(9, 1, 44);
    }
}
