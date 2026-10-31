package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.wallets.Wallet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q2 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethod.Card(ft.b.valueOf(parcel.readString()), parcel.readInt() == 0 ? null : PaymentMethod.Card.Checks.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : PaymentMethod.Card.ThreeDSecureUsage.CREATOR.createFromParcel(parcel), (Wallet) parcel.readParcelable(PaymentMethod.Card.class.getClassLoader()), parcel.readInt() != 0 ? PaymentMethod.Card.Networks.CREATOR.createFromParcel(parcel) : null, parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethod.Card[i5];
    }
}
