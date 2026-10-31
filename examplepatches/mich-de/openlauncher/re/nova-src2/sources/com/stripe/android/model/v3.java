package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethodCreateParams.USBankAccount(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : PaymentMethod.USBankAccount.USBankAccountType.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? PaymentMethod.USBankAccount.USBankAccountHolderType.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.USBankAccount[i5];
    }
}
