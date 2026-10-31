package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.New.GenericPaymentMethod((ResolvableString) parcel.readParcelable(PaymentSelection.New.GenericPaymentMethod.class.getClassLoader()), parcel.readInt(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readString(), parcel.readString(), (PaymentMethodCreateParams) parcel.readParcelable(PaymentSelection.New.GenericPaymentMethod.class.getClassLoader()), wu.c.valueOf(parcel.readString()), (PaymentMethodOptionsParams) parcel.readParcelable(PaymentSelection.New.GenericPaymentMethod.class.getClassLoader()), (PaymentMethodExtraParams) parcel.readParcelable(PaymentSelection.New.GenericPaymentMethod.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.New.GenericPaymentMethod[i5];
    }
}
