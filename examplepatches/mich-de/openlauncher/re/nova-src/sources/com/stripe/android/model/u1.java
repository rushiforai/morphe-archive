package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.LinkConsumerIncentive;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkConsumerIncentive.IncentiveParams(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkConsumerIncentive.IncentiveParams[i5];
    }
}
