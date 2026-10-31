package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.Stripe3ds2Fingerprint;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new Stripe3ds2Fingerprint(parcel.readString(), parcel.readString(), parcel.readString(), Stripe3ds2Fingerprint.DirectoryServerEncryption.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Stripe3ds2Fingerprint[i5];
    }
}
