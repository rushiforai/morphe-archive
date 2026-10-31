package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new NativeLinkArgs(LinkConfiguration.CREATOR.createFromParcel(parcel), PaymentMethodMetadata.CREATOR.createFromParcel(parcel), jt.b.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), es.o.valueOf(parcel.readString()), LinkAccountUpdate.Value.CREATOR.createFromParcel(parcel), parcel.readString(), (LinkLaunchMode) parcel.readParcelable(NativeLinkArgs.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new NativeLinkArgs[i5];
    }
}
