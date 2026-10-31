package com.facebook.ads.redexgen.X;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class NF {
    public static byte[] A00;
    public static String[] A01 = {"KgCm6W2elLLZb0kLSCRIMIZIMt", "tzFwHHyrLqnIVhlBhrnLmq9jcs", "Dvwl2PDhKYSeIEHpVeewSiyXfi5uyeGS", "Z7ViszcMclBZj", "URVSwx4oRQjVAhuJ0fCKAaSmLbJJnkw4", "q2EatZWDXsw5ex2Swx", "YggFO2406BNuk7mxe4tC6dlSnrHv4h6h", "Jhqg7vWPGKpZ2KaSVA1BKgOLhaMAysK2"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static int A00(SQLiteDatabase sQLiteDatabase, int i5, String str) throws NC {
        try {
            if (!N1.A19(sQLiteDatabase, A01(159, 17, 85))) {
                return -1;
            }
            Cursor cursorQuery = sQLiteDatabase.query(A01(159, 17, 85), new String[]{A01(244, 7, 108)}, A01(183, 32, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), A05(i5, str), null, null, null);
            try {
                if (cursorQuery.getCount() == 0) {
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return -1;
                }
                cursorQuery.moveToNext();
                int i11 = cursorQuery.getInt(0);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return i11;
            } finally {
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[1].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[7] = "K3mSfW6ZaDJyERBWeusPDDDtkHvUypbC";
            strArr2[2] = "QT09LhxLn0O919cOkmk7SYqwUT8kyBfb";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 83);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{-17, -2, -15, -19, 0, -15, -52, 0, -19, -18, -8, -15, -52, -11, -14, -52, -6, -5, 0, -52, -15, 4, -11, -1, 0, -1, -52, -15, 36, 27, -4, 24, 13, 37, 17, 30, 2, 17, 30, 31, 21, 27, 26, 31, -52, -44, 18, 17, 13, 32, 33, 30, 17, -52, -11, -6, 0, -15, -13, -15, -2, -52, -6, -5, 0, -52, -6, 1, -8, -8, -40, 21, 26, 31, 32, 13, 26, 15, 17, 11, 33, 21, 16, -52, 0, -15, 4, 0, -52, -6, -5, 0, -52, -6, 1, -8, -8, -40, 34, 17, 30, 31, 21, 27, 26, -52, -11, -6, 0, -15, -13, -15, -2, -52, -6, -5, 0, -52, -6, 1, -8, -8, -40, -4, -2, -11, -7, -19, -2, 5, -52, -9, -15, 5, -52, -44, 18, 17, 13, 32, 33, 30, 17, -40, -52, 21, 26, 31, 32, 13, 26, 15, 17, 11, 33, 21, 16, -43, -43, -19, 32, 23, -8, 20, 9, 33, 13, 26, -2, 13, 26, 27, 17, 23, 22, 27, 47, 46, 42, 61, 62, 59, 46, 48, 47, 43, 62, 63, 60, 47, -22, 7, -22, 9, -22, 11, 24, 14, -22, 51, 56, 61, 62, 43, 56, 45, 47, 41, 63, 51, 46, -22, 7, -22, 9, 46, 54, 54, 46, -11, 44, 63, 54, -11, 43, 40, 59, 40, 41, 40, 58, 44, 5, 10, 15, 16, -3, 10, -1, 1, -5, 17, 5, 0, 53, 36, 49, 50, 40, 46, 45};
    }

    static {
        A02();
        C1045Ku.A03(A01(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 17, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
    }

    public static void A03(SQLiteDatabase sQLiteDatabase, int i5, String str) throws NC {
        String strA01 = A01(159, 17, 85);
        try {
            if (!N1.A19(sQLiteDatabase, strA01)) {
                return;
            }
            sQLiteDatabase.delete(strA01, A01(183, 32, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), A05(i5, str));
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public static void A04(SQLiteDatabase sQLiteDatabase, int i5, String str, int i11) throws NC, SQLException {
        try {
            sQLiteDatabase.execSQL(A01(0, 159, 89));
            ContentValues contentValues = new ContentValues();
            contentValues.put(A01(176, 7, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), Integer.valueOf(i5));
            contentValues.put(A01(232, 12, 73), str);
            contentValues.put(A01(244, 7, 108), Integer.valueOf(i11));
            sQLiteDatabase.replaceOrThrow(A01(159, 17, 85), null, contentValues);
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public static String[] A05(int i5, String str) {
        return new String[]{Integer.toString(i5), str};
    }
}
