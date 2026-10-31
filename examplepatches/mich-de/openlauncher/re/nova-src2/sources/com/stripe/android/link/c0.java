package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkPaymentMethod.ConsumerPaymentDetails((ConsumerPaymentDetails.PaymentDetails) parcel.readParcelable(LinkPaymentMethod.ConsumerPaymentDetails.class.getClassLoader()), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkPaymentMethod.ConsumerPaymentDetails[i5];
    }
}
