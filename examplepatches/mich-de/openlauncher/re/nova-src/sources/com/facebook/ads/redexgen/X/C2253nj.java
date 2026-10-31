package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.NativeAdRatingApi;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.nj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2253nj implements NativeAdRatingApi {
    public static byte[] A02;
    public static String[] A03 = {"toY9r3GQ2V7oewvjptOzxrS3bXTXc0RA", "sNtoNgmSnc6mPwk", "sqn4euFoJMrOy6w1WzpNZbp0V46mSpuW", "EIfja0hemr4BNawwCcQfaPCPd3YJxnrU", "sMAw2w80fDiQYhU2W3UNXvphSzhcHd9d", "R2iCm9V8pMi0V4JYCgbimpTTwdawvKsh", "0MIfAaRYFlqcluCsT0Dbw6pT1oX0sCn1", "WyAiIZ6R26Fzk5qwkokaejcEGkdnjEqF"};
    public final double A00;
    public final double A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A03;
            if (strArr[3].charAt(20) == strArr[0].charAt(20)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[6] = "2hoOF1EBiwOhqbt1DT56iNDNNWb8yQHz";
            strArr2[2] = "W6hI53UtRDHSRmbx8lgXTECIFUbvBxjr";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 92);
            i13++;
        }
    }

    public static void A02() {
        A02 = new byte[]{113, 97, 99, 110, 103, 100, 115, 126, 103, 119};
    }

    static {
        A02();
    }

    public C2253nj(double d5, double d11) {
        this.A01 = d5;
        this.A00 = d11;
    }

    public static C2253nj A00(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        String strA01 = A01(5, 5, 78);
        if (A03[1].length() == 15) {
            A03[5] = "RjFVMQXNPaplscouVMfMFZlHjMQAuEdy";
            double dOptDouble = jSONObject.optDouble(strA01, 0.0d);
            double mValue = jSONObject.optDouble(A01(0, 5, 94), 0.0d);
            if (dOptDouble != 0.0d) {
                if (A03[5].charAt(0) == 'R') {
                    String[] strArr = A03;
                    strArr[6] = "dPMTjBEXFaKbbBBBm4MCfcS4F7X28Hbr";
                    strArr[2] = "0dli5ldtNE7riKXsyOdCpznATSfs344b";
                    if (mValue != 0.0d) {
                        return new C2253nj(dOptDouble, mValue);
                    }
                }
            }
            return null;
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.internal.api.NativeAdRatingApi
    public final double getScale() {
        return this.A00;
    }

    @Override // com.facebook.ads.internal.api.NativeAdRatingApi
    public final double getValue() {
        return this.A01;
    }
}
