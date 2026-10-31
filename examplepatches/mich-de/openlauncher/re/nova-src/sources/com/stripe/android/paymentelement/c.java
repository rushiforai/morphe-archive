package com.stripe.android.paymentelement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.CustomPaymentMethodResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CustomPaymentMethodResult.Failed(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CustomPaymentMethodResult.Failed[i5];
    }
}
