package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSessionParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ElementsSessionParams.DeferredIntentType(parcel.readString(), (DeferredIntentParams) parcel.readParcelable(ElementsSessionParams.DeferredIntentType.class.getClassLoader()), parcel.createStringArrayList(), parcel.createStringArrayList(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : ElementsSessionParams.SellerDetails.CREATOR.createFromParcel(parcel), ElementsSessionParams.Link.CREATOR.createFromParcel(parcel), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSessionParams.DeferredIntentType[i5];
    }
}
