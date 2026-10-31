package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.uicore.elements.AddressInputMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AddressInputMode.NoAutocomplete(kw.c.valueOf(parcel.readString()), kw.c.valueOf(parcel.readString()), kw.c.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AddressInputMode.NoAutocomplete[i5];
    }
}
