package com.facebook.ads.redexgen.X;

import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.AsyncTask;
import android.os.Looper;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* renamed from: com.facebook.ads.redexgen.X.lJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2104lJ {
    public static byte[] A04;
    public static String[] A05 = {"qJOvsPrm5BQkhL6wLJahauzjA45r7dQz", "hfx8x2hkXgxq19RSFkkqiaOe1zMy03Qo", "bV5o7GaQth4ZZOPd4LFtWwXjKNVB8lua", "1EyYFmGpmEhL9EWyl0I1ptwRPtnJxpez", "F", "i", "plO80lk7YnGQvaXazMopbLIwOg8MB0TR", "EzLFA06L6a2SQhX4934tm7serJXXg4XA"};
    public static final String A06;
    public static final Lock A07;
    public static final Lock A08;
    public static final ReentrantReadWriteLock A09;
    public SQLiteOpenHelper A00;
    public final C0957Hh A01;
    public final C0955Hf A03 = new C0955Hf(this);
    public final C0956Hg A02 = new C0956Hg(this);

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A05[3].charAt(0) != '1') {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[0] = "6YOEgEHO6bjbd5au9bSAefu6W5tI3Dak";
            strArr[6] = "kgOgsYcmlOEy6T8oxoaixHiO6WRSp1D2";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 115);
            i13++;
        }
    }

    public static void A07() {
        A04 = new byte[]{-31, -2, -31, -81, -51, -81, -50, -11, 22, 40, 24, -67, -29, -17, -20, -22, -67, -44, -2, 3, -3, 2, -44, -108, -64, -67, -63, -67, -56, -108, -106, -59, -60, -106, -35, 12, 15, 1, 2, 15, -35, -1, 22, -35, -42, 9, -5, 10, -42, -98, -43, -58, -61, -48, -61, -98, -49, -43, -46, -58, 11, 3, -54, -52, 22, 52, 65, 65, 66, 71, -13, 54, 52, 63, 63, -13, 58, 56, 71, 23, 52, 71, 52, 53, 52, 70, 56, -13, 57, 69, 66, 64, -13, 71, 59, 56, -13, 40, 28, -13, 71, 59, 69, 56, 52, 55, -12, 33, 19, 26, 19, 17, 34, -18, 66, 61, 57, 51, 60, 65, -4, 39, 34, 22, 19, 38, 23, -14, 43, 40, 59, 40, 41, 40, 58, 44, 71, 88, 71, 80, 86, 85, -9, -14, -18, -24, -15, -10};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized void A0J() {
        for (int i5 = 0; i5 < A0M().length; i5++) {
        }
        if (this.A00 != null) {
            this.A00.close();
            this.A00 = null;
        }
    }

    static {
        A07();
        StringBuilder sbAppend = new StringBuilder().append(A05(107, 14, 91)).append(C0955Hf.A02.A01);
        String strA05 = A05(58, 2, 51);
        StringBuilder sbAppend2 = sbAppend.append(strA05);
        String strA052 = A05(142, 6, 16);
        StringBuilder sbAppend3 = sbAppend2.append(strA052);
        String strA053 = A05(60, 1, 106);
        StringBuilder sbAppend4 = sbAppend3.append(strA053).append(C0955Hf.A01.A01).append(strA05);
        String strA054 = A05(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 6, 111);
        A06 = sbAppend4.append(strA054).append(strA053).append(C0956Hg.A04.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A05.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A0A.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A08.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A07.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A06.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A03.A01).append(strA05).append(strA054).append(strA053).append(C0956Hg.A02.A01).append(A05(11, 6, 42)).append(strA054).append(A05(17, 6, 65)).append(strA052).append(A05(30, 4, 3)).append(strA054).append(strA053).append(C0956Hg.A09.A01).append(A05(0, 3, 78)).append(strA052).append(strA053).append(C0955Hf.A02.A01).append(A05(34, 10, 74)).append(strA054).append(strA053).append(C0956Hg.A08.A01).append(A05(7, 4, 98)).toString();
        A09 = new ReentrantReadWriteLock();
        A07 = A09.readLock();
        A08 = A09.writeLock();
    }

    public C2104lJ(C0957Hh c0957Hh) {
        this.A01 = c0957Hh;
    }

    private synchronized SQLiteDatabase A00() {
        if (this.A00 == null) {
            this.A00 = new C2105lK(this.A01, this);
        }
        return this.A00.getWritableDatabase();
    }

    private synchronized SQLiteDatabase A01() {
        SQLiteException e3 = null;
        for (int i5 = 0; i5 < 10; i5++) {
            try {
            } catch (SQLiteException e11) {
                e3 = e11;
                try {
                    Thread.sleep(100L);
                } catch (InterruptedException unused) {
                }
            }
        }
        this.A01.A08().ABz(A05(128, 8, 84), AbstractC2126lf.A0v, new C2127lg(e3));
        throw e3;
        return A00();
    }

    public final int A08(int i5) {
        A08.lock();
        try {
            return A0E().delete(A05(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 6, 111), C0956Hg.A02.A01 + A05(3, 4, 28), new String[]{String.valueOf(i5 - 1)});
        } finally {
            A08.unlock();
        }
    }

    public final Cursor A09() {
        A07.lock();
        try {
            return this.A02.A0D();
        } finally {
            A07.unlock();
        }
    }

    public final Cursor A0A() {
        A07.lock();
        try {
            return this.A02.A0E();
        } finally {
            A07.unlock();
        }
    }

    public final Cursor A0B() {
        A07.lock();
        try {
            return this.A03.A0D();
        } finally {
            A07.unlock();
        }
    }

    public final Cursor A0C(int i5) {
        A07.lock();
        try {
            return A0E().rawQuery(A06 + A05(23, 7, 1) + String.valueOf(i5), null);
        } finally {
            A07.unlock();
        }
    }

    public final Cursor A0D(String str) {
        A07.lock();
        try {
            return this.A02.A0F(str);
        } finally {
            A07.unlock();
        }
    }

    public final SQLiteDatabase A0E() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            return A01();
        }
        throw new IllegalStateException(A05(64, 43, 96));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lM != com.facebook.ads.internal.database.AdDatabaseQuery<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<T> */
    public final <T> AsyncTask A0F(AbstractC2107lM<T> abstractC2107lM, AbstractC2173mR<T> abstractC2173mR) {
        return AbstractC2428qe.A00(ExecutorC2431qh.A07, new AsyncTaskC2103lI(this.A01, abstractC2107lM, abstractC2173mR), new Void[0]);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<java.lang.String> */
    public final AsyncTask A0G(final String str, final int i5, final String str2, final double d5, final double d11, final String str3, final Map<String, String> data, AbstractC2173mR<String> abstractC2173mR) {
        return A0F(new AbstractC0954He<String>() { // from class: com.facebook.ads.redexgen.X.7C
            public static byte[] A08;
            public static String[] A09 = {"l", "T0JdG9ZEnLfTeCeftC9G7d8cUsVG3XZb", "aLcPLzyPnyiGnlL0eBnocVG2Im", "W3EwFUE7CvVeZV", "t2q4fu0Y0bIBimY2SigNyotMmunbmEsF", "TUpEXXUjgi8xLksArOVlucAVZCM", "AqOn5F5Mae0spU5kh0gbanyLcs", "chqW8UrgIl8Ef4OOKimE4h"};

            public static String A01(int i11, int i12, int i13) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i11, i11 + i12);
                for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] - i13) - 32);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A02() {
                A08 = new byte[]{-112, -115, -96, -115, -114, -115, -97, -111};
            }

            static {
                A02();
            }

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2107lM
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final String A03() {
                String eventId = A01(0, 8, 12);
                this.A03.A01.A08().AAh(str2);
                if (TextUtils.isEmpty(str)) {
                    return null;
                }
                C2104lJ.A08.lock();
                String[] strArr = A09;
                if (strArr[6].length() != strArr[2].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A09;
                strArr2[1] = "mqnyRlomjFPPGlBu5iJ3A4HRnrnsorAH";
                strArr2[4] = "vLAqNnzkqKgbXCY8NZfbbPBhHyGRm9s6";
                SQLiteDatabase sQLiteDatabaseA0E = null;
                try {
                    try {
                        sQLiteDatabaseA0E = this.A03.A0E();
                        sQLiteDatabaseA0E.beginTransaction();
                        String strA0G = this.A03.A02.A0G(this.A03.A03.A0E(str), i5, str2, d5, d11, str3, data);
                        sQLiteDatabaseA0E.setTransactionSuccessful();
                        if (sQLiteDatabaseA0E != null && sQLiteDatabaseA0E.isOpen()) {
                            try {
                                if (sQLiteDatabaseA0E.inTransaction()) {
                                    sQLiteDatabaseA0E.endTransaction();
                                }
                            } catch (Exception e3) {
                                this.A03.A01.A08().ABz(eventId, AbstractC2126lf.A0z, new C2127lg(e3));
                            }
                        }
                        C2104lJ.A08.unlock();
                        return strA0G;
                    } catch (Throwable th2) {
                        if (sQLiteDatabaseA0E != null && sQLiteDatabaseA0E.isOpen()) {
                            try {
                                if (sQLiteDatabaseA0E.inTransaction()) {
                                    sQLiteDatabaseA0E.endTransaction();
                                }
                            } catch (Exception e11) {
                                this.A03.A01.A08().ABz(eventId, AbstractC2126lf.A0z, new C2127lg(e11));
                            }
                        }
                        C2104lJ.A08.unlock();
                        throw th2;
                    }
                } catch (Exception e12) {
                    A01(EnumC2106lL.A06);
                    this.A03.A01.A08().ABz(eventId, AbstractC2126lf.A0y, new C2127lg(e12));
                    if (sQLiteDatabaseA0E != null && sQLiteDatabaseA0E.isOpen()) {
                        try {
                            if (sQLiteDatabaseA0E.inTransaction()) {
                                sQLiteDatabaseA0E.endTransaction();
                            }
                        } catch (Exception e13) {
                            this.A03.A01.A08().ABz(eventId, AbstractC2126lf.A0z, new C2127lg(e13));
                        }
                    }
                    C2104lJ.A08.unlock();
                    return null;
                }
            }
        }, abstractC2173mR);
    }

    public final void A0H() {
        A08.lock();
        try {
            this.A02.A0B();
            this.A03.A0B();
        } finally {
            A08.unlock();
        }
    }

    public final void A0I() {
        A08.lock();
        try {
            this.A03.A0F(this.A01);
        } finally {
            A08.unlock();
        }
    }

    public final boolean A0K(String str) {
        A08.lock();
        try {
            boolean zA0H = this.A02.A0H(str);
            Lock lock = A08;
            String[] strArr = A05;
            if (strArr[7].charAt(23) != strArr[1].charAt(23)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A05;
            strArr2[4] = "8";
            strArr2[5] = "N";
            lock.unlock();
            return zA0H;
        } catch (Throwable th2) {
            A08.unlock();
            throw th2;
        }
    }

    public final boolean A0L(String str) throws SQLException {
        boolean z11;
        A08.lock();
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(A05(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 7, 95)).append(A05(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 6, 111)).append(A05(44, 5, 67)).append(C0956Hg.A02.A01).append(A05(61, 1, 83)).append(C0956Hg.A02.A01).append(A05(56, 2, 49)).append(A05(49, 7, 11)).append(C0956Hg.A04.A01).append(A05(62, 2, 26));
            A0E().execSQL(sb2.toString(), new String[]{str});
            z11 = true;
        } catch (SQLiteException unused) {
            z11 = false;
        }
        A08.unlock();
        return z11;
    }

    public final AbstractC2108lN[] A0M() {
        return new AbstractC2108lN[]{this.A03, this.A02};
    }
}
