package com.facebook.ads.redexgen.X;

import android.content.ContentResolver;
import android.database.Cursor;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2065kd {
    public static byte[] A00;
    public static String[] A01 = {"BBXCQ1c8lWMx5iTCFSjBAsNmZ8", "uWpSMDe8Dl1QwAjraNXmi3HjN39WCwvV", "Nl77HN8SOPKSqciG8lmOC8DFY50qabgT", "qKAuPB5zte0w", "tHnAlNrx5zeOSNOAYBdYTMmeA", "muO01a58leOoeMmtxXp9cvgd3", "skgH0VF5dzwRL9wPv5", "Mbe4svBdXamA1BIwkYK5rcxDOVieSFVl"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[2].charAt(14) != 'i') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = "5u7aTW8yax3G";
            strArr[6] = "UvSwr6xgQWJsIweShl";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 109);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{118, 126, 115, 115, 124, 118, 96, 125, 123, 118, 123, 118, 40, 36, 37, 63, 46, 37, 63, 113, 100, 100, 40, 36, 38, 101, 45, 42, 40, 46, 41, 36, 36, 32, 101, 32, 42, 63, 42, 37, 42, 101, 59, 57, 36, 61, 34, 47, 46, 57, 101, 10, 63, 63, 57, 34, 41, 62, 63, 34, 36, 37, 2, 47, 27, 57, 36, 61, 34, 47, 46, 57, 37, 32, 36, 32, 61, 22, 61, 59, 40, 42, 34, 32, 39, 46};
    }

    static {
        A02();
    }

    public static C2064kc A00(ContentResolver contentResolver) {
        String strA01 = A01(72, 14, 36);
        String strA012 = A01(3, 9, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        String strA013 = A01(0, 3, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        Cursor c11 = null;
        try {
            c11 = contentResolver.query(AbstractC2351pP.A00(A01(12, 60, 38)), new String[]{strA013, strA012, strA01}, null, null, null);
            if (c11 == null || !c11.moveToFirst()) {
                return new C2064kc(null, null, false);
            }
            String string = c11.getString(c11.getColumnIndex(strA013));
            String attributionId = c11.getString(c11.getColumnIndex(strA012));
            C2064kc c2064kc = new C2064kc(string, attributionId, Boolean.valueOf(c11.getString(c11.getColumnIndex(strA01))).booleanValue());
            if (c11 != null) {
                c11.close();
            }
            return c2064kc;
        } finally {
            if (c11 != null) {
                c11.close();
            }
        }
    }
}
