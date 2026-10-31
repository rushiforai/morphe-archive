package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkLaunchMode.PaymentMethodSelection((ConsumerPaymentDetails.PaymentDetails) parcel.readParcelable(LinkLaunchMode.PaymentMethodSelection.class.getClassLoader()), parcel.readInt() == 0 ? null : es.q.valueOf(parcel.readString()), parcel.readInt() != 0, parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkLaunchMode.PaymentMethodSelection[i5];
    }
}
