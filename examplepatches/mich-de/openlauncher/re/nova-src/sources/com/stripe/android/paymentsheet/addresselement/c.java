package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.addresselement.AddressElementNavigator$AutocompleteEvent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AddressElementNavigator$AutocompleteEvent.OnBack(parcel.readInt() == 0 ? null : PaymentSheet$Address.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AddressElementNavigator$AutocompleteEvent.OnBack[i5];
    }
}
