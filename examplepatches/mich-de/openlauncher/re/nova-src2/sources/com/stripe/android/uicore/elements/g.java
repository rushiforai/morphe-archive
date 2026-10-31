package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.uicore.elements.ParameterDestination;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return ParameterDestination.Local.valueOf(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ParameterDestination.Local[i5];
    }
}
