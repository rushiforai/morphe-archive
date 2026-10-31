package com.facebook.ads.redexgen.X;

import android.os.AsyncTask;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.lI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class AsyncTaskC2103lI<T> extends AsyncTask<Void, Void, T> {
    public static byte[] A04;
    public static String[] A05 = {"65r9CRdv0GoLRVNVjbjXzJK5P2ycj7FG", "0CWnyuhck9HOQgwCfxzQ09GVkx", "IEC2mc7xTTQi8lqWDODmms9jEFByhoZx", "6exEWFSZK9oTcnxcvUurXohDGqhdlb0H", "22QzghXqrFZ4DBGtDF", "dbvBYMdgslkBJuEWD9uCPJqFmtTt8cU5", "jZC4Ivj", "4jv2LQemXeCXPfpssPDUuPD2TleIiZzb"};
    public EnumC2106lL A00;
    public final C0957Hh A01;
    public final AbstractC2107lM<T> A02;
    public final AbstractC2173mR<T> A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 116;
            if (A05[7].charAt(12) != 'P') {
                throw new RuntimeException();
            }
            A05[6] = "VTML";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{31, 28, 47, 28, 29, 28, 46, 32};
    }

    static {
        A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lI != com.facebook.ads.internal.database.AdDatabaseHelper$DatabaseQueryAsyncTask<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lM != com.facebook.ads.internal.database.AdDatabaseQuery<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<T> */
    public AsyncTaskC2103lI(C0957Hh c0957Hh, AbstractC2107lM<T> abstractC2107lM, AbstractC2173mR<T> abstractC2173mR) {
        this.A02 = abstractC2107lM;
        this.A03 = abstractC2173mR;
        this.A01 = c0957Hh;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lI != com.facebook.ads.internal.database.AdDatabaseHelper$DatabaseQueryAsyncTask<T> */
    private final T A00(Void... voidArr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        if (A05[6].length() == 11) {
            throw new RuntimeException();
        }
        A05[2] = "4eGiZ19xQ4OxGjIavdFldPBRBlbWR0DL";
        T tA03 = null;
        try {
            try {
                tA03 = this.A02.A03();
                this.A00 = this.A02.A00();
                return tA03;
            } catch (Exception e3) {
                this.A01.A08().ABz(A01(0, 8, 71), AbstractC2126lf.A0w, new C2127lg(e3));
                this.A00 = EnumC2106lL.A09;
                return tA03;
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lI != com.facebook.ads.internal.database.AdDatabaseHelper$DatabaseQueryAsyncTask<T> */
    @Override // android.os.AsyncTask
    public final /* bridge */ /* synthetic */ Object doInBackground(Void[] voidArr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            return A00(voidArr);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.lI != com.facebook.ads.internal.database.AdDatabaseHelper$DatabaseQueryAsyncTask<T> */
    @Override // android.os.AsyncTask
    public final void onPostExecute(T result) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00 == null) {
                this.A03.A02(result);
            } else {
                this.A03.A01(this.A00.A03(), this.A00.A04());
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
