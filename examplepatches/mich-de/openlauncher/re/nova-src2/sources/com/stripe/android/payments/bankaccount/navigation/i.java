package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResponseInternal;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountResponseInternal((StripeIntent) parcel.readParcelable(CollectBankAccountResponseInternal.class.getClassLoader()), parcel.readInt() == 0 ? null : CollectBankAccountResponseInternal.USBankAccountData.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? CollectBankAccountResponseInternal.InstantDebitsData.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountResponseInternal[i5];
    }
}
