package com.stripe.android.paymentelement.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethodConfirmationOption.Saved((PaymentMethod) parcel.readParcelable(PaymentMethodConfirmationOption.Saved.class.getClassLoader()), (PaymentMethodOptionsParams) parcel.readParcelable(PaymentMethodConfirmationOption.Saved.class.getClassLoader()), parcel.readInt() != 0, parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodConfirmationOption.Saved[i5];
    }
}
