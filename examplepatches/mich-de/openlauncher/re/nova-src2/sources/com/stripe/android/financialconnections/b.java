package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.ElementsSessionContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ElementsSessionContext.BillingDetails.Address(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSessionContext.BillingDetails.Address[i5];
    }
}
