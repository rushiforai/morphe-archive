package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.Stripe3ds2Fingerprint;
import java.security.PublicKey;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        PublicKey publicKey = (PublicKey) parcel.readSerializable();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            arrayList.add(parcel.readSerializable());
        }
        return new Stripe3ds2Fingerprint.DirectoryServerEncryption(string, publicKey, arrayList, parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Stripe3ds2Fingerprint.DirectoryServerEncryption[i5];
    }
}
