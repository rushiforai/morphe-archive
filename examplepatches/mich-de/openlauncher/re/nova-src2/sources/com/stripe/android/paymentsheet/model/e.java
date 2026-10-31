package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.New.Card((PaymentMethodCreateParams) parcel.readParcelable(PaymentSelection.New.Card.class.getClassLoader()), ft.b.valueOf(parcel.readString()), wu.c.valueOf(parcel.readString()), (PaymentMethodOptionsParams) parcel.readParcelable(PaymentSelection.New.Card.class.getClassLoader()), (PaymentMethodExtraParams) parcel.readParcelable(PaymentSelection.New.Card.class.getClassLoader()), (UserInput) parcel.readParcelable(PaymentSelection.New.Card.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.New.Card[i5];
    }
}
