package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String bank = parcel.readString();
        Intrinsics.g(bank, "bank");
        PaymentMethodCreateParams.Netbanking netbanking = new PaymentMethodCreateParams.Netbanking();
        netbanking.f43717a = bank;
        return netbanking;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.Netbanking[i5];
    }
}
