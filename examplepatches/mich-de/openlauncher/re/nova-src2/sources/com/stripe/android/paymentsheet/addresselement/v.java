package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AutocompleteAppearanceContext.PaymentElement(PaymentSheet$Appearance.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AutocompleteAppearanceContext.PaymentElement[i5];
    }
}
