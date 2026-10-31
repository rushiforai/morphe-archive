package com.facebook.ads.redexgen.X;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* renamed from: com.facebook.ads.redexgen.X.Jr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractBinderC1016Jr extends Binder {
    public static String[] A00 = {"ffE", "sdO4olSjVqEdMqQVERJmpH", "V5ZNgdZxj", "xN21IZnnCVsOAG7", "le9pvkcGozoJcN0rgEGWAi904lq", "iM3YLscjMRqpeZ6LGtl1sZgubTh", "r9D9IxE", "oJWJnsMa3mxPolzWOg5TaX2nVEsKAdwZ"};
    public static final int A01;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static AbstractC07549l<Bundle> A00(IBinder iBinder) {
        C06344e c06344eA01 = AbstractC07549l.A01();
        int i5 = 0;
        int i11 = 1;
        while (i11 != 0) {
            Parcel parcelObtain = Parcel.obtain();
            if (A00[3].length() == 21) {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[4] = "ObW4G5OfoNZQaJSbaKlFQzia2U1";
            strArr[1] = "tAZqcWoM2jmMSNwdAp7onK";
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                parcelObtain.writeInt(i5);
                try {
                    iBinder.transact(1, parcelObtain, parcelObtain2, 0);
                    while (true) {
                        i11 = parcelObtain2.readInt();
                        if (i11 == 1) {
                            c06344eA01.A04((Bundle) AbstractC1062Ln.A01(parcelObtain2.readBundle()));
                            i5++;
                        }
                    }
                } catch (RemoteException e3) {
                    throw new RuntimeException(e3);
                }
            } finally {
                parcelObtain2.recycle();
                parcelObtain.recycle();
            }
        }
        return c06344eA01.A05();
    }

    static {
        A01 = N1.A02 >= 30 ? IBinder.getSuggestedMaxIpcSizeBytes() : SQLiteDatabase.OPEN_FULLMUTEX;
    }
}
