package com.stripe.android.paymentelement.embedded.form;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.EmbeddedPaymentElement$Configuration;
import com.stripe.android.paymentelement.embedded.form.FormContract;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new FormContract.Args(parcel.readString(), (PaymentMethodMetadata) parcel.readParcelable(FormContract.Args.class.getClassLoader()), parcel.readInt() != 0, EmbeddedPaymentElement$Configuration.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), (PaymentSelection) parcel.readParcelable(FormContract.Args.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FormContract.Args[i5];
    }
}
