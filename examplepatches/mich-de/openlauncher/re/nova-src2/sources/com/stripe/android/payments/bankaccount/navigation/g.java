package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountForInstantDebitsResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountForInstantDebitsResult.Completed((StripeIntent) parcel.readParcelable(CollectBankAccountForInstantDebitsResult.Completed.class.getClassLoader()), PaymentMethod.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountForInstantDebitsResult.Completed[i5];
    }
}
