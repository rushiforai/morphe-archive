package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1351Xm {
    public static byte[] A02;
    public static String[] A03 = {"YMyukGOZbElzYCjXswiDasEnRUtQuAqy", "JnVs1XQ6w91", "NsTJUgSwloTuhweQ5ivOL2wOLZzbzgff", "VAH1kqIZVJnfwmSiKCDdiZaRqhNQ1XLZ", "NLmrBkjBx0Hyu", "ljpN0VclCovmUpo6ImdBt", "bpuRdzSpwxjKrXfgwcnzsCSb7A4SkKum", "1ExyBUrzeSL54Qw63WkKw8rE2Y6GRgHz"};
    public final String A00;
    public final String A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 67;
            String[] strArr = A03;
            if (strArr[0].charAt(0) == strArr[7].charAt(0)) {
                throw new RuntimeException();
            }
            A03[1] = "5nMJwc7N0f";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{77, 115, 84, 73, 67, 75, 69, 82, 97, 83, 83, 69, 84, 105, 68, 89, 103, 64, 93, 87, 95, 81, 70, 96, 77, 68, 81};
    }

    static {
        A01();
    }

    public C1351Xm(String str, String str2) {
        C1h.A09(str, A00(15, 12, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        C1h.A09(str2, A00(0, 15, 99));
        this.A01 = str;
        this.A00 = str2;
    }
}
