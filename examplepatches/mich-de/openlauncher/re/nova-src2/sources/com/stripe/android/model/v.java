package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsentUi;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ConsentUi(parcel.readInt() == 0 ? null : ConsentUi.ConsentPane.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? ConsentUi.ConsentSection.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsentUi[i5];
    }
}
