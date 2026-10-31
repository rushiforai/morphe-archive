package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.SourceParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Address addressCreateFromParcel = parcel.readInt() == 0 ? null : Address.CREATOR.createFromParcel(parcel);
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        SourceParams.OwnerParams ownerParams = new SourceParams.OwnerParams();
        ownerParams.f43864a = addressCreateFromParcel;
        ownerParams.f43865b = string;
        ownerParams.f43866c = string2;
        ownerParams.f43867d = string3;
        return ownerParams;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SourceParams.OwnerParams[i5];
    }
}
