package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AutocompleteContract.Args(parcel.readString(), parcel.readString(), parcel.readString(), (AutocompleteAppearanceContext) parcel.readParcelable(AutocompleteContract.Args.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AutocompleteContract.Args[i5];
    }
}
