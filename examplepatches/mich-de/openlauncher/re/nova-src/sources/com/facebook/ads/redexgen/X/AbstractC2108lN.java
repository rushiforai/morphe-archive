package com.facebook.ads.redexgen.X;

import android.database.sqlite.SQLiteDatabase;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.lN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2108lN {
    public static byte[] A01;
    public static String[] A02 = {"HVKZvR5UTjStDLOL9o4rPessbKuh0O7V", "lcBs6IulTDBXs0xMNwr7074HBb5CT680", "pp9", "08Pk9qbigTz1ItVQ0hAeiWjKqsV0Kke0", "IZPR1WSW", "qkmVdqnPN26Te8aFuQlNVKOt05q5LyYY", "adXBxD3OrJvPB32QQ8w", "pvdflY6bA4nr3ZgRZtp7kAtC3Qj6GBkc"};
    public final C2104lJ A00;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 59);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A01 = new byte[]{121, -127, 123, -104, 123, -102, -86, -48, -36, -39, -41, -86, -44, 11, -4, -7, 6, -7, -44, -108, -118, 126, -126, -111, -124, -128, -109, -124, 95, -109, -128, -127, -117, -124, 95, -95, -81, -84, -83, 125, -79, -98, -97, -87, -94, 125, -90, -93, 125, -94, -75, -90, -80, -79, -80, 125, -8, -22, -15, -22, -24, -7, -59};
    }

    public abstract String A08();

    public abstract C2102lH[] A0C();

    static {
        A06();
    }

    public AbstractC2108lN(C2104lJ c2104lJ) {
        this.A00 = c2104lJ;
    }

    private String A02() {
        C2102lH[] c2102lHArrA0C = A0C();
        if (c2102lHArrA0C.length < 1) {
            if (A02[4].length() != 8) {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[0] = "NTtbWHu0RetWI6yxki67w6X3knWPKgwD";
            strArr[1] = "wg0AU135P1OwlpIQrYrtBV6UQnwqkPhP";
            return null;
        }
        String result = A03(0, 0, 31);
        for (int i5 = 0; i5 < c2102lHArrA0C.length - 1; i5++) {
            result = result + c2102lHArrA0C[i5].A02() + A03(20, 2, 35);
        }
        return result + c2102lHArrA0C[c2102lHArrA0C.length - 1].A02();
    }

    public static String A04(String str, C2102lH[] c2102lHArr) {
        StringBuilder sb2 = new StringBuilder(A03(56, 7, 106));
        for (int i5 = 0; i5 < c2102lHArr.length - 1; i5++) {
            sb2.append(c2102lHArr[i5].A01);
            int i11 = A02[2].length();
            if (i11 != 3) {
                throw new RuntimeException();
            }
            A02[4] = "CXWyM2Ol";
            sb2.append(A03(20, 2, 35));
        }
        sb2.append(c2102lHArr[c2102lHArr.length - 1].A01);
        sb2.append(A03(6, 6, 79));
        sb2.append(str);
        return sb2.toString();
    }

    public static String A05(String str, C2102lH[] c2102lHArr, C2102lH c2102lH) {
        return A04(str, c2102lHArr) + A03(12, 7, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + c2102lH.A01 + A03(2, 4, 32);
    }

    public final SQLiteDatabase A07() {
        return this.A00.A0E();
    }

    public final void A09(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(A03(22, 13, 4) + A08() + A03(0, 2, 30) + A02() + A03(19, 1, 48));
    }

    public final void A0A(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(A03(35, 21, 34) + A08());
    }

    public final boolean A0B() {
        return A07().delete(A08(), null, null) > 0;
    }
}
