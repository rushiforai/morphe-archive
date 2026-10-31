package com.facebook.ads.redexgen.X;

import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.text.TextUtils;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.lK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2105lK extends SQLiteOpenHelper {
    public static byte[] A01;
    public static String[] A02 = {"JShIJu3JRfHt43ypO9GqFaXtQU", "Uet3LTw8rLJmru1DFWkYPrIPq9yjzQ4", "LBYTyoU1fD8w8O4ue", "ZxNu1nQjo2XkCjw5ERk40jWGoeLjYM9V", "VhJY3C97J7J84q76u4hEYHgB0g", "Ro8Wdk2EPx5GRn22XYsr1QjtSyjSX", "SdOPztDY16h0BPmxgfN82QFEWJhjV", "9YM807W9r6X84VXv6l9L7RtBJQk8UQ"};
    public static final String A03;
    public final C2104lJ A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{17, 1, 101, 100, 103, 96, 116, 109, 117, 1, 17, 48, 61, 37, 52, 35, 81, 37, 48, 51, 61, 52, 81, 20, 7, 20, 31, 5, 2, 81, 48, 53, 53, 81, 50, 62, 61, 36, 60, 63, 81, 90, AbstractJsonLexerKt.TC_INVALID, 95, 122, 111, 122, 121, 122, 104, 126, 83, 126, 119, 107, 126, 105, 59, 120, 122, 117, 59, 117, 116, 111, 59, 121, 126, 59, 117, 110, 119, 119, 33, 55, 42, 53, 69, 49, 36, 39, 41, 32, 69, 44, 35, 69, 32, 61, 44, 54, 49, 54, 69, 6, 23, 4, 22, 13, 0, 22, 88, 90, 73, 79, 69, 73, 40, 110, 103, 122, 109, 97, 111, 102, 87, 99, 109, 113, 123, 40, 53, 40, 71, 70, 51, 124, 121, 110, 56, 110, 51, 121, AbstractJsonLexerKt.TC_INVALID};
    }

    static {
        A02();
        A03 = C2105lK.class.getSimpleName();
    }

    public C2105lK(C0957Hh c0957Hh, C2104lJ c2104lJ) {
        super(c0957Hh, A01(c0957Hh), (SQLiteDatabase.CursorFactory) null, 4);
        if (c2104lJ != null) {
            this.A00 = c2104lJ;
            return;
        }
        throw new IllegalArgumentException(A00(41, 32, 87));
    }

    public static String A01(C0957Hh c0957Hh) throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        Locale locale = Locale.US;
        Object[] objArr = {A00(0, 0, 95)};
        String strA00 = A00(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 8, 81);
        String str = String.format(locale, strA00, objArr);
        if (!C2203mv.A2n(c0957Hh)) {
            return str;
        }
        String defaultDbName = c0957Hh.getPackageName();
        String processName = ProcessUtils.getProcessName(c0957Hh);
        if (!defaultDbName.equals(processName) && !TextUtils.isEmpty(processName)) {
            String defaultDbName2 = String.format(Locale.US, strA00, '_' + processName);
            return defaultDbName2;
        }
        return str;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        for (AbstractC2108lN abstractC2108lN : this.A00.A0M()) {
            abstractC2108lN.A09(sQLiteDatabase);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        for (AbstractC2108lN abstractC2108lN : this.A00.A0M()) {
            abstractC2108lN.A0A(sQLiteDatabase);
            abstractC2108lN.A09(sQLiteDatabase);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onOpen(SQLiteDatabase sQLiteDatabase) throws SQLException {
        super.onOpen(sQLiteDatabase);
        if (!sQLiteDatabase.isReadOnly()) {
            sQLiteDatabase.execSQL(A00(101, 25, 68));
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        if (i5 == 2 && i11 >= 3) {
            String strA00 = A00(73, 28, 41);
            if (A02[7].length() != 30) {
                throw new RuntimeException();
            }
            A02[3] = "Uy0CZyDaBZXeJSQ63Y80hAJR5wsAelR7";
            sQLiteDatabase.execSQL(strA00);
        }
        if (i5 <= 3 && i11 >= 4) {
            C2102lH c2102lH = C0956Hg.A02;
            sQLiteDatabase.execSQL(A00(11, 30, 61) + c2102lH.A01 + A00(0, 1, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) + c2102lH.A02 + A00(1, 10, 109));
        }
    }
}
