package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public class TR extends SQLiteOpenHelper implements ND {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{63, 86, 89, 63, 90, 71, 86, 76, 75, 76, 63, 95, 73, 84, 75, 59, 92, 107, 107, 118, 107, 57, 124, 97, 124, 122, 108, 109, 112, 119, 126, 57, 31, 13, 8, 45, 56, 45, 46, 45, 63, 41, 28, 62, 35, 58, 37, 40, 41, 62, 28, 1, 22, 9, 21, 24, 0, 28, 11, 38, 16, 23, 13, 28, 11, 23, 24, 21, 87, 29, 27, 7, 8, 4, 12, 110, 108, 113, 116, 105, 120, 66, 112, 124, 110, 105, 120, 111, 83, 81, 76, 73, 84, 69, AbstractJsonLexerKt.TC_INVALID, 83, 69, 81, 85, 69, 78, 67, 69, 18, 31, 22, 3};
    }

    public TR(Context context) {
        super(context.getApplicationContext(), A00(50, 21, 107), (SQLiteDatabase.CursorFactory) null, 1);
    }

    public static void A02(SQLiteDatabase sQLiteDatabase) {
        Cursor cursorQuery = sQLiteDatabase.query(A00(75, 13, 15), new String[]{A00(103, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), A00(71, 4, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)}, null, null, null, null, null);
        while (cursorQuery.moveToNext()) {
            try {
                String string = cursorQuery.getString(0);
                String string2 = cursorQuery.getString(1);
                if (!A00(88, 15, 50).equals(string2)) {
                    String str = A00(11, 5, 9) + string + A00(0, 11, 13) + string2;
                    try {
                        sQLiteDatabase.execSQL(str);
                    } catch (SQLException e3) {
                        String type = A00(32, 18, 94);
                        MV.A08(type, A00(16, 16, 11) + str, e3);
                    }
                }
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    try {
                        cursorQuery.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        A02(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
    }
}
