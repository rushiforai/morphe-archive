package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.model.ConsumerShippingAddress;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.Link(es.o.valueOf(parcel.readString()), (LinkPaymentMethod) parcel.readParcelable(PaymentSelection.Link.class.getClassLoader()), (ConsumerShippingAddress) parcel.readParcelable(PaymentSelection.Link.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.Link[i5];
    }
}
