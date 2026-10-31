package com.stripe.android.paymentelement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.CustomPaymentMethodResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return CustomPaymentMethodResult.Completed.f44105a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CustomPaymentMethodResult.Completed[i5];
    }
}
