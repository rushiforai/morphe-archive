package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ElementsSession.Customer.Components.CustomerSheet.Enabled(e1.valueOf(parcel.readString()), f1.valueOf(parcel.readString()), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.Customer.Components.CustomerSheet.Enabled[i5];
    }
}
