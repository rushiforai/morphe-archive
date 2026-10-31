package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.model.ConsumerShippingAddress;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Boolean boolValueOf;
        Intrinsics.g(parcel, "parcel");
        LinkAccountUpdate linkAccountUpdate = (LinkAccountUpdate) parcel.readParcelable(LinkActivityResult.Completed.class.getClassLoader());
        LinkPaymentMethod linkPaymentMethod = (LinkPaymentMethod) parcel.readParcelable(LinkActivityResult.Completed.class.getClassLoader());
        ConsumerShippingAddress consumerShippingAddress = (ConsumerShippingAddress) parcel.readParcelable(LinkActivityResult.Completed.class.getClassLoader());
        if (parcel.readInt() == 0) {
            boolValueOf = null;
        } else {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        return new LinkActivityResult.Completed(linkAccountUpdate, linkPaymentMethod, consumerShippingAddress, boolValueOf);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkActivityResult.Completed[i5];
    }
}
