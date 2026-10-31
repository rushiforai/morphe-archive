package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public class JP<T> implements InterfaceC1851h7<T> {
    public static byte[] A02;
    public static String[] A03 = {"pRcBA4OWefysSNzvRxIkpBVTVwfc3AVE", "RPn4qv0f1UarsEXGS1XogTnrbpEJEmnV", "xmsaI0t9E", "ZcBN", "DIlRoYRb", "oKMZSswBXiC", "UEhtJ1eDnORTZ2wzgc9obnj9WqOhgFHK", "4xQT2X5Ea9Pr"};
    public int A00;
    public final Object[] A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            String[] strArr = A03;
            if (strArr[4].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A03[5] = "P1E265Ge3cQ";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 106);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{44, 1, 31, 8, 12, 9, 20, 77, 4, 3, 77, 25, 5, 8, 77, 29, 2, 2, 1, 76, 76, 112, 125, 56, 117, 121, 96, 56, 104, 119, 119, 116, 56, 107, 113, 98, 125, 56, 117, 109, 107, 108, 56, 122, 125, 56, 38, 56, 40};
    }

    static {
        A01();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.JP != com.facebook.ads.internal.androidx.support.v4.util.Pools$SimplePool<T> */
    public JP(int i5) {
        if (i5 > 0) {
            this.A01 = new Object[i5];
            return;
        }
        throw new IllegalArgumentException(A00(20, 29, 114));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.JP != com.facebook.ads.internal.androidx.support.v4.util.Pools$SimplePool<T> */
    /* JADX WARN: Incorrect condition in loop: B:4:0x0003 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A02(T t6) {
        for (int i5 = 0; i5 < i; i5++) {
            Object obj = this.A01[i5];
            String[] strArr = A03;
            String str = strArr[2];
            String str2 = strArr[3];
            int length = str.length();
            int i11 = str2.length();
            if (length == i11) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[4] = "IsiBXNP8";
            strArr2[7] = "yZIlFrLQCuaZ";
            if (obj == t6) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.JP != com.facebook.ads.internal.androidx.support.v4.util.Pools$SimplePool<T> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1851h7
    @Nullable
    public T A3X() {
        if (this.A00 <= 0) {
            return null;
        }
        int i5 = this.A00 - 1;
        T t6 = (T) this.A01[i5];
        this.A01[i5] = null;
        this.A00--;
        return t6;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.JP != com.facebook.ads.internal.androidx.support.v4.util.Pools$SimplePool<T> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1851h7
    public boolean AIt(T t6) {
        if (!A02(t6)) {
            if (this.A00 < this.A01.length) {
                this.A01[this.A00] = t6;
                this.A00++;
                return true;
            }
            return false;
        }
        throw new IllegalStateException(A00(0, 20, 7));
    }
}
