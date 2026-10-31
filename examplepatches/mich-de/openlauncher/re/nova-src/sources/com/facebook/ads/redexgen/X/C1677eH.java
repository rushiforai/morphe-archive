package com.facebook.ads.redexgen.X;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.eH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1677eH {
    public static byte[] A02;
    public static final String[] A03;
    public String A00;
    public final ND A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A02 = new byte[]{-99, -29, 41, 28, 40, 32, -37, 15, 0, 19, 15, -37, 11, 13, 4, 8, -4, 13, 20, -37, 6, 0, 20, -37, 9, 10, 15, -37, 9, 16, 7, 7, -25, 39, 32, 41, 34, 47, 35, -37, 4, 9, 15, 0, 2, 0, 13, -37, 9, 10, 15, -37, 9, 16, 7, 7, -25, 39, 28, 46, 47, 26, 47, 42, 48, 30, 35, 26, 47, 36, 40, 32, 46, 47, 28, 40, 43, -37, 4, 9, 15, 0, 2, 0, 13, -37, 9, 10, 15, -37, 9, 16, 7, 7, -28, -9, 6, -7, -11, 8, -7, -44, 8, -11, -10, 0, -7, -44, -11, 3, 0, 1, -47, 5, -14, -13, -3, -10, -47, -6, -9, -47, -10, 9, -6, 4, 5, 4, -47, -64, -13, -22, -53, -25, -36, -12, -32, -19, -66, -36, -34, -29, -32, -63, -28, -25, -32, -56, -32, -17, -36, -33, -36, -17, -36, -9, -20, -2, -1, -22, -1, -6, 0, -18, -13, -22, -1, -12, -8, -16, -2, -1, -20, -8, -5, -18, -25, -16, -23, -10, -22, 36, 23, 35, 27, 35, 22, 34, 26, -43, -14, -43, -12};
    }

    static {
        A03();
        A03 = new String[]{A01(181, 4, 110), A01(175, 6, 58), A01(155, 20, 67)};
    }

    public C1677eH(ND nd2) {
        this.A01 = nd2;
    }

    private Cursor A00() {
        AbstractC1062Ln.A01(this.A00);
        return this.A01.getReadableDatabase().query(this.A00, A03, null, null, null, null, null);
    }

    public static String A02(String str) {
        return A01(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 26, 51) + str;
    }

    public static void A04(SQLiteDatabase sQLiteDatabase, String str) throws SQLException {
        sQLiteDatabase.execSQL(A01(108, 21, 105) + str);
    }

    public final Map<String, C1676eG> A05() throws NC {
        try {
            Cursor cursorA00 = A00();
            try {
                HashMap map = new HashMap(cursorA00.getCount());
                while (cursorA00.moveToNext()) {
                    map.put((String) AbstractC1062Ln.A01(cursorA00.getString(0)), new C1676eG(cursorA00.getLong(1), cursorA00.getLong(2)));
                }
                if (cursorA00 != null) {
                    cursorA00.close();
                }
                return map;
            } finally {
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public final void A06(long j11) throws NC {
        try {
            String hexString = Long.toHexString(j11);
            String hexUid = A02(hexString);
            this.A00 = hexUid;
            if (NF.A00(this.A01.getReadableDatabase(), 2, hexString) != 1) {
                SQLiteDatabase writableDatabase = this.A01.getWritableDatabase();
                writableDatabase.beginTransactionNonExclusive();
                try {
                    NF.A04(writableDatabase, 2, hexString, 1);
                    String hexUid2 = this.A00;
                    A04(writableDatabase, hexUid2);
                    StringBuilder sb2 = new StringBuilder();
                    String hexUid3 = A01(95, 13, 108);
                    StringBuilder sbAppend = sb2.append(hexUid3);
                    String hexUid4 = this.A00;
                    StringBuilder sbAppend2 = sbAppend.append(hexUid4);
                    String hexUid5 = A01(0, 1, 53);
                    StringBuilder sbAppend3 = sbAppend2.append(hexUid5);
                    String hexUid6 = A01(1, 94, 115);
                    writableDatabase.execSQL(sbAppend3.append(hexUid6).toString());
                    writableDatabase.setTransactionSuccessful();
                    writableDatabase.endTransaction();
                } catch (Throwable th2) {
                    writableDatabase.endTransaction();
                    throw th2;
                }
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public final void A07(String str) throws NC {
        AbstractC1062Ln.A01(this.A00);
        try {
            this.A01.getWritableDatabase().delete(this.A00, A01(ModuleDescriptor.MODULE_VERSION, 8, 109), new String[]{str});
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public final void A08(String str, long j11, long j12) throws NC, SQLException {
        AbstractC1062Ln.A01(this.A00);
        try {
            SQLiteDatabase writableDatabase = this.A01.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(A01(181, 4, 110), str);
            contentValues.put(A01(175, 6, 58), Long.valueOf(j11));
            contentValues.put(A01(155, 20, 67), Long.valueOf(j12));
            writableDatabase.replaceOrThrow(this.A00, null, contentValues);
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    public final void A09(Set<String> set) throws NC {
        AbstractC1062Ln.A01(this.A00);
        try {
            SQLiteDatabase writableDatabase = this.A01.getWritableDatabase();
            writableDatabase.beginTransactionNonExclusive();
            try {
                Iterator<String> it = set.iterator();
                while (it.hasNext()) {
                    writableDatabase.delete(this.A00, A01(ModuleDescriptor.MODULE_VERSION, 8, 109), new String[]{it.next()});
                }
                writableDatabase.setTransactionSuccessful();
            } finally {
                writableDatabase.endTransaction();
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }
}
