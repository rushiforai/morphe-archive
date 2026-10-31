package com.facebook.ads.redexgen.X;

import android.text.TextUtils;

/* loaded from: assets/audience_network/classes.dex */
public final class TJ {
    public static String[] A03 = {"cU9wbmFWm9eInW87iG", "TPEi", "RmHvfzw3Q1j2LrsgoQRv", "ofho", "CzttNzHlyD", "EMXD8ZHxvhY9w38qAPHvlYvOUiWn", "gC6ipoHRIGvDVccm2", "lvksxcd4ov"};
    public final String A00;
    public final boolean A01;
    public final boolean A02;

    public TJ(String str, boolean z11, boolean z12) {
        this.A00 = str;
        this.A01 = z11;
        this.A02 = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || obj.getClass() != TJ.class) {
            return false;
        }
        TJ tj2 = (TJ) obj;
        if (TextUtils.equals(this.A00, tj2.A00) && this.A01 == tj2.A01) {
            boolean z11 = this.A02;
            String[] strArr = A03;
            if (strArr[4].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[1] = "T30M";
            strArr2[3] = "mKvN";
            if (z11 == tj2.A02) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int result = 1 * 31;
        int prime = this.A00.hashCode();
        int result2 = (result + prime) * 31;
        int prime2 = this.A01 ? 1231 : 1237;
        int result3 = (result2 + prime2) * 31;
        int result4 = this.A02 ? 1231 : 1237;
        return result3 + result4;
    }
}
