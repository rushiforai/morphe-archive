package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodOptionsParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethodOptionsParams.USBankAccount(parcel.readInt() == 0 ? null : ft.d.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodOptionsParams.USBankAccount[i5];
    }
}
