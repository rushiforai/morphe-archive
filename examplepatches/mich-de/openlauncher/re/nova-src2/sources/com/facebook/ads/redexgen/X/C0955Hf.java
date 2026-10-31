package com.facebook.ads.redexgen.X;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Hf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0955Hf extends AbstractC2108lN {
    public static byte[] A00;
    public static final C2102lH A01;
    public static final C2102lH A02;
    public static final C2102lH[] A03;
    public static final String A04;
    public static final String A05;
    public static final String A06;
    public static final String A07;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 36);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{19, 14, 19, 91, 63, 44, 45, 36, 45, 60, 45, 72, 46, 58, 39, 37, 72, 28, 7, 3, 13, 6, 27, 72, 63, 32, 45, 58, 45, 72, 38, 39, 60, 72, 45, 48, 33, 59, 60, 59, 72, 64, 59, 45, 36, 45, 43, 60, 72, 89, 72, 46, 58, 39, 37, 72, 13, 30, 13, 6, 28, 27, 72, 63, 32, 45, 58, 45, 72, 28, 7, 3, 13, 6, 27, 70, 8, 53, 46, 40, 61, 57, 36, 34, 35, 109, 58, 37, 40, 35, 109, 57, 63, 52, 36, 35, 42, 109, 57, 34, 109, 41, 40, 33, 40, 57, 40, 109, 46, 37, 36, 33, 41, 33, 40, 62, 62, 109, 57, 34, 38, 40, 35, 62, 99, 22, 49, 41, 62, 51, 54, 59, AbstractJsonLexerKt.TC_INVALID, 43, 48, 52, 58, 49, 113, 92, 77, 80, 92, 74, 91, 70, 74, 62, 78, 76, 87, 83, 95, 76, 71, 62, 85, 91, 71, 36, 55, 36, 47, 53, 50, 2, 25, 29, 19, 24, 25, 2, 6, 8, 3, 50, 4, 9, 80, 75, 79, 65, 74, 87};
    }

    static {
        A01();
        A02 = new C2102lH(0, A00(170, 8, 73), A00(143, 16, 58));
        A01 = new C2102lH(1, A00(165, 5, 82), A00(139, 4, 44));
        A03 = new C2102lH[]{A02, A01};
        A07 = C0955Hf.class.getSimpleName();
        C2102lH[] c2102lHArr = A03;
        String strA00 = A00(178, 6, 0);
        A05 = AbstractC2108lN.A04(strA00, c2102lHArr);
        A06 = AbstractC2108lN.A05(strA00, A03, A01);
        A04 = A00(5, 71, 76) + A02.A01 + A00(0, 3, 23) + A00(159, 6, 101) + A00(4, 1, 53) + C0956Hg.A09.A01 + A00(3, 1, 86);
    }

    public C0955Hf(C2104lJ c2104lJ) {
        super(c2104lJ);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2108lN
    public final String A08() {
        return A00(178, 6, 0);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2108lN
    public final C2102lH[] A0C() {
        return A03;
    }

    public final Cursor A0D() {
        return A07().rawQuery(A05, null);
    }

    public final String A0E(String str) throws SQLiteException, IllegalArgumentException {
        if (!TextUtils.isEmpty(str)) {
            Cursor cursorRawQuery = null;
            try {
                cursorRawQuery = A07().rawQuery(A06, new String[]{str});
                String string = cursorRawQuery.moveToNext() ? cursorRawQuery.getString(A02.A00) : null;
                if (!TextUtils.isEmpty(string)) {
                    return string;
                }
                String string2 = UUID.randomUUID().toString();
                ContentValues contentValues = new ContentValues(2);
                contentValues.put(A02.A01, string2);
                contentValues.put(A01.A01, str);
                A07().insertOrThrow(A00(178, 6, 0), null, contentValues);
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
                return string2;
            } finally {
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
            }
        }
        throw new IllegalArgumentException(A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 14, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
    }

    public final void A0F(C0957Hh c0957Hh) throws SQLException {
        try {
            A07().execSQL(A04);
        } catch (SQLException e3) {
            if (c0957Hh.A05().AB6()) {
                Log.e(A07, A00(76, 49, 105), e3);
            }
        }
    }
}
