package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public abstract class Lv {
    public static byte[] A00;
    public static final byte[] A01;
    public static final String[] A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 62);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{-115, -124, -113, -111, -73, -32, -109, -101, 22, 43, 24, -26, -29, -38, -27, -25, 13, -38, -27, -25, 13, -38, -27, -25, 13, 21, 35, 16, -34, -37, -46, 32, -46, 17, -37, -46, 5, -37, -46, 16, -46, 17};
    }

    static {
        A05();
        A01 = new byte[]{0, 0, 0, 1};
        A02 = new String[]{A02(0, 0, 67), A02(5, 1, 97), A02(6, 1, 19), A02(7, 1, 26)};
    }

    public static Pair<Integer, Integer> A00(byte[] bArr) {
        C1084Mk c1084Mk = new C1084Mk(bArr);
        c1084Mk.A0f(9);
        int sampleRate = c1084Mk.A0I();
        c1084Mk.A0f(20);
        return Pair.create(Integer.valueOf(c1084Mk.A0L()), Integer.valueOf(sampleRate));
    }

    public static String A01(int i5, int i11, int i12) {
        return String.format(A02(8, 17, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf(i12));
    }

    public static String A03(int i5, boolean z11, int i11, int i12, int[] iArr, int i13) {
        StringBuilder sb2 = new StringBuilder(N1.A0n(A02(25, 17, 111), A02[i5], Integer.valueOf(i11), Integer.valueOf(i12), Character.valueOf(z11 ? 'H' : 'L'), Integer.valueOf(i13)));
        int length = iArr.length;
        while (length > 0 && iArr[length - 1] == 0) {
            length--;
        }
        for (int i14 = 0; i14 < length; i14++) {
            sb2.append(String.format(A02(0, 5, 33), Integer.valueOf(iArr[i14])));
        }
        return sb2.toString();
    }

    public static List<byte[]> A04(boolean z11) {
        byte[] bArr = new byte[1];
        if (z11) {
            bArr[0] = 1;
        } else {
            bArr[0] = 0;
        }
        return Collections.singletonList(bArr);
    }

    public static boolean A06(List<byte[]> initializationData) {
        return initializationData.size() == 1 && initializationData.get(0).length == 1 && initializationData.get(0)[0] == 1;
    }

    public static byte[] A07(byte[] bArr, int i5, int i11) {
        byte[] bArr2 = new byte[A01.length + i11];
        byte[] bArr3 = A01;
        byte[] nalUnit = A01;
        System.arraycopy(bArr3, 0, bArr2, 0, nalUnit.length);
        byte[] nalUnit2 = A01;
        System.arraycopy(bArr, i5, bArr2, nalUnit2.length, i11);
        return bArr2;
    }
}
