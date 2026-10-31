package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import java.io.Serializable;

/* renamed from: com.facebook.ads.redexgen.X.qF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2403qF {
    public static Serializable A00(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.unmarshall(bArr, 0, bArr.length);
        parcelObtain.setDataPosition(0);
        Serializable serializable = parcelObtain.readSerializable();
        parcelObtain.recycle();
        return serializable;
    }

    public static byte[] A01(Serializable serializable) {
        if (serializable == null) {
            return null;
        }
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeSerializable(serializable);
        byte[] bArrMarshall = parcelObtain.marshall();
        parcelObtain.recycle();
        return bArrMarshall;
    }
}
