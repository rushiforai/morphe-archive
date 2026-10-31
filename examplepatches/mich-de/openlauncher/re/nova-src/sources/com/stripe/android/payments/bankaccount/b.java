package com.stripe.android.payments.bankaccount;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountConfiguration.USBankAccount(parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountConfiguration.USBankAccount[i5];
    }
}
