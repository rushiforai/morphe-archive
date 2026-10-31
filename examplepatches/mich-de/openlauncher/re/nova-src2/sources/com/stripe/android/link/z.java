package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkPaymentDetails.New((ConsumerPaymentDetails.PaymentDetails) parcel.readParcelable(LinkPaymentDetails.New.class.getClassLoader()), (PaymentMethodCreateParams) parcel.readParcelable(LinkPaymentDetails.New.class.getClassLoader()), (PaymentMethodCreateParams) parcel.readParcelable(LinkPaymentDetails.New.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkPaymentDetails.New[i5];
    }
}
