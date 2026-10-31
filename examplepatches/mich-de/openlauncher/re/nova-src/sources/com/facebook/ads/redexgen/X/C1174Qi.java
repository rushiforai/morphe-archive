package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Qi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1174Qi extends Exception {
    public static byte[] A03;
    public static String[] A04 = {"vRe6fiZS0RxUfa", "Y9NyCcaPiLfSx202ix56", "5dgi3FY0pKi5WUVAp8toYu7LChGwTIVw", "tFDx84bJTnph9pp1FpFKHXG1ZsUu", "WBJpB195bhVerm", "6VtKlL6FVQrBQ7og9ReYilr1LHRL", "tJVQdfGQc04A9hPPtjK4zuv1vKfhvDKu", "orkzauAEDb4FhdM36SjggODARdIqIiTX"};
    public final int A00;
    public final VC A01;
    public final boolean A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        String[] strArr = A04;
        if (strArr[3].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[3] = "3UEaw10qnAN9Bb8Jv8f6U7418FGY";
        strArr2[5] = "ELjH8boEPtaACOqG42UrIzDs5Hyo";
        A03 = new byte[]{1, 68, 76, 22, 1, 7, 11, 18, 1, 22, 5, 6, 8, 1, 77, 66, 71, 75, 5, 30, 6, 36, 13, 42, 30, 15, 2, 4, 63, 25, 10, 8, 0, 42, 7, 7, 4, 8, 10, 31, 14, 15, 86, 34, 46, 7, 51, 34, 47, 41, 18, 52, 39, 37, 45, 102, 47, 40, 47, 50, 102, 32, 39, 47, 42, 35, 34, 102, 80, 124, 125, 117, 122, 116, 59};
    }

    static {
        A01();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    @MetaExoPlayerCustomization
    public C1174Qi(int i5, int i11, int i12, int i13, VC vc, boolean z11, Exception exc, int i14) {
        StringBuilder sbAppend = new StringBuilder().append(A00(45, 23, 14)).append(i5);
        String strA00 = A00(0, 1, 105);
        StringBuilder sbAppend2 = sbAppend.append(strA00).append(A00(68, 7, 91)).append(i11);
        String strA002 = A00(43, 2, 70);
        super(sbAppend2.append(strA002).append(i12).append(strA002).append(i13).append(A00(15, 28, 35)).append(i14).append(strA00).append(vc).append(z11 ? A00(1, 14, 44) : A00(0, 0, 60)).toString(), exc);
        this.A00 = i5;
        this.A02 = z11;
        this.A01 = vc;
    }
}
