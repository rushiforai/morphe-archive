package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountContract.Args.ForSetupIntent(parcel.readString(), parcel.readString(), parcel.readString(), (CollectBankAccountConfiguration) parcel.readParcelable(CollectBankAccountContract.Args.ForSetupIntent.class.getClassLoader()), parcel.readInt() != 0, parcel.readInt() == 0 ? null : mu.b.valueOf(parcel.readString()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountContract.Args.ForSetupIntent[i5];
    }
}
