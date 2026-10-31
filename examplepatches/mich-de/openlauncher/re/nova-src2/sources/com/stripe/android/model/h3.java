package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String bsbNumber = parcel.readString();
        String accountNumber = parcel.readString();
        Intrinsics.g(bsbNumber, "bsbNumber");
        Intrinsics.g(accountNumber, "accountNumber");
        PaymentMethodCreateParams.AuBecsDebit auBecsDebit = new PaymentMethodCreateParams.AuBecsDebit();
        auBecsDebit.f43700a = bsbNumber;
        auBecsDebit.f43701b = accountNumber;
        return auBecsDebit;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.AuBecsDebit[i5];
    }
}
