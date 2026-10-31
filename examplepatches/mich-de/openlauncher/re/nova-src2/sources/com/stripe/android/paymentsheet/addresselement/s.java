package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return AutocompleteAppearanceContext.Link.f44708a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AutocompleteAppearanceContext.Link[i5];
    }
}
