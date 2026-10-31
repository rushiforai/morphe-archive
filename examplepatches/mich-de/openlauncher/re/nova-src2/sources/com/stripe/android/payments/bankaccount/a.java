package com.stripe.android.payments.bankaccount;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountConfiguration.InstantDebits(parcel.readString(), (ElementsSessionContext) parcel.readParcelable(CollectBankAccountConfiguration.InstantDebits.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountConfiguration.InstantDebits[i5];
    }
}
