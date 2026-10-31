package com.facebook.ads.redexgen.X;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.util.SparseArray;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Mh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1081Mh implements InterfaceC1689eT {
    public static byte[] A04;
    public static String[] A05 = {"sJQAW5c5DPGeqfaTKloN8HnIawjXSAi7", "KX8tDyuyKUtKLi0go8fNyrupbs1kyWcO", "rOe0dKhy42lcjNmavxerJTFhkIzZBp", "fD79gXVUMyuCIv3ecwHU41uCMZf4ujIb", "OnqJwKlm54vIppwdWOd4nJvD", "TaflJC8J4vUXfVc4i4WCvaJWCI", "BeOmvHuymbxF0RAS6IwRSQ2rHE", "Rx4KLI2DeSsKUt9swQyWGmycfOeiduN6"};
    public static final String[] A06;
    public String A00;
    public String A01;
    public final SparseArray<C1688eS> A02 = new SparseArray<>();
    public final ND A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A04 = new byte[]{57, 20, 85, 88, 28, 117, 114, 104, 121, 123, 121, 110, 28, 108, 110, 117, 113, 125, 110, 101, 28, 119, 121, 101, 28, 114, 115, 104, 28, 114, 105, 112, 112, 16, 87, 89, 69, 28, 104, 121, 100, 104, 28, 114, 115, 104, 28, 114, 105, 112, 112, 16, 81, 89, 72, 93, 88, 93, 72, 93, 28, 126, 112, 115, 126, 28, 114, 115, 104, 28, 114, 105, 112, 112, 21, 16, 1, 22, 18, 7, 22, 115, 7, 18, 17, 31, 22, 115, 2, 20, 9, 22, 102, 18, 7, 4, 10, 3, 102, 15, 0, 102, 3, 30, 15, 21, 18, 21, 102, 122, 71, 80, 111, 83, 94, 70, 90, 77, 124, 94, 92, 87, 90, 118, 81, 91, 90, 71, 48, 61, 112, 125, 57, 36, 57, 38, 100, 106, 118, 115, 123, 106, AbstractJsonLexerKt.TC_INVALID, 122, AbstractJsonLexerKt.TC_INVALID, 106, AbstractJsonLexerKt.TC_INVALID};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ABa(HashMap<String, C1688eS> map, SparseArray<String> sparseArray) throws IOException {
        AbstractC1062Ln.A08(this.A02.size() == 0);
        try {
            if (NF.A00(this.A03.getReadableDatabase(), 1, (String) AbstractC1062Ln.A01(this.A00)) != 1) {
                SQLiteDatabase writableDatabase = this.A03.getWritableDatabase();
                writableDatabase.beginTransactionNonExclusive();
                try {
                    A04(writableDatabase);
                    writableDatabase.setTransactionSuccessful();
                } finally {
                    writableDatabase.endTransaction();
                }
            }
            Cursor cursorA00 = A00();
            while (cursorA00.moveToNext()) {
                try {
                    C1688eS c1688eS = new C1688eS(cursorA00.getInt(0), (String) AbstractC1062Ln.A01(cursorA00.getString(1)), C1690eU.A02(new DataInputStream(new ByteArrayInputStream(cursorA00.getBlob(2)))));
                    map.put(c1688eS.A02, c1688eS);
                    sparseArray.put(c1688eS.A01, c1688eS.A02);
                } finally {
                }
            }
            if (cursorA00 != null) {
                cursorA00.close();
            }
        } catch (SQLiteException e3) {
            map.clear();
            sparseArray.clear();
            throw new NC(e3);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ALc(HashMap<String, C1688eS> map) throws IOException {
        if (this.A02.size() == 0) {
            return;
        }
        try {
            SQLiteDatabase writableDatabase = this.A03.getWritableDatabase();
            writableDatabase.beginTransactionNonExclusive();
            for (int i5 = 0; i5 < this.A02.size(); i5++) {
                try {
                    C1688eS c1688eSValueAt = this.A02.valueAt(i5);
                    if (c1688eSValueAt == null) {
                        A05(writableDatabase, this.A02.keyAt(i5));
                    } else {
                        A06(writableDatabase, c1688eSValueAt);
                    }
                } finally {
                    writableDatabase.endTransaction();
                }
            }
            writableDatabase.setTransactionSuccessful();
            this.A02.clear();
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    static {
        A03();
        A06 = new String[]{A01(128, 2, 101), A01(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 3, 51), A01(139, 8, 34)};
    }

    public C1081Mh(ND nd2) {
        this.A03 = nd2;
    }

    private Cursor A00() {
        return this.A03.getReadableDatabase().query((String) AbstractC1062Ln.A01(this.A01), A06, null, null, null, null, null);
    }

    public static String A02(String str) {
        return A01(109, 19, 3) + str;
    }

    private void A04(SQLiteDatabase sQLiteDatabase) throws NC, SQLException {
        NF.A04(sQLiteDatabase, 1, (String) AbstractC1062Ln.A01(this.A00), 1);
        A07(sQLiteDatabase, (String) AbstractC1062Ln.A01(this.A01));
        sQLiteDatabase.execSQL(A01(75, 13, 111) + this.A01 + A01(0, 1, 37) + A01(1, 74, 0));
    }

    private void A05(SQLiteDatabase sQLiteDatabase, int i5) {
        sQLiteDatabase.delete((String) AbstractC1062Ln.A01(this.A01), A01(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 6, 37), new String[]{Integer.toString(i5)});
    }

    private void A06(SQLiteDatabase sQLiteDatabase, C1688eS c1688eS) throws IOException, SQLException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        C1690eU.A08(c1688eS.A03(), new DataOutputStream(byteArrayOutputStream));
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        ContentValues contentValues = new ContentValues();
        contentValues.put(A01(128, 2, 101), Integer.valueOf(c1688eS.A01));
        contentValues.put(A01(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 3, 51), c1688eS.A02);
        contentValues.put(A01(139, 8, 34), byteArray);
        sQLiteDatabase.replaceOrThrow((String) AbstractC1062Ln.A01(this.A01), null, contentValues);
    }

    public static void A07(SQLiteDatabase sQLiteDatabase, String str) throws SQLException {
        sQLiteDatabase.execSQL(A01(88, 21, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) + str);
    }

    public static void A08(ND nd2, String str) throws NC {
        try {
            String strA02 = A02(str);
            SQLiteDatabase writableDatabase = nd2.getWritableDatabase();
            writableDatabase.beginTransactionNonExclusive();
            try {
                NF.A03(writableDatabase, 1, str);
                A07(writableDatabase, strA02);
                writableDatabase.setTransactionSuccessful();
            } finally {
                writableDatabase.endTransaction();
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void A6O() throws NC {
        A08(this.A03, (String) AbstractC1062Ln.A01(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final boolean A71() throws NC {
        try {
            int iA00 = NF.A00(this.A03.getReadableDatabase(), 1, (String) AbstractC1062Ln.A01(this.A00));
            if (A05[7].charAt(5) != 'I') {
                throw new RuntimeException();
            }
            A05[0] = "dWmfIsrHdrS2YlTFWvlcEy75jPPsblzL";
            return iA00 != -1;
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AAt(long j11) {
        this.A00 = Long.toHexString(j11);
        this.A01 = A02(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AGk(C1688eS c1688eS, boolean z11) {
        if (z11) {
            this.A02.delete(c1688eS.A01);
        } else {
            this.A02.put(c1688eS.A01, null);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void AHU(C1688eS c1688eS) {
        this.A02.put(c1688eS.A01, c1688eS);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1689eT
    public final void ALb(HashMap<String, C1688eS> map) throws IOException {
        try {
            SQLiteDatabase writableDatabase = this.A03.getWritableDatabase();
            writableDatabase.beginTransactionNonExclusive();
            try {
                A04(writableDatabase);
                Iterator<C1688eS> it = map.values().iterator();
                while (it.hasNext()) {
                    A06(writableDatabase, it.next());
                }
                writableDatabase.setTransactionSuccessful();
                this.A02.clear();
            } finally {
                writableDatabase.endTransaction();
            }
        } catch (SQLException e3) {
            throw new NC(e3);
        }
    }
}
