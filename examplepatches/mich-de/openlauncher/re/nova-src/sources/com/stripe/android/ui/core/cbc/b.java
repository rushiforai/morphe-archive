package com.stripe.android.ui.core.cbc;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return CardBrandChoiceEligibility.Ineligible.f45280a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CardBrandChoiceEligibility.Ineligible[i5];
    }
}
