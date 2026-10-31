package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResponseInternal;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CollectBankAccountResponseInternal.USBankAccountData((FinancialConnectionsSession) parcel.readParcelable(CollectBankAccountResponseInternal.USBankAccountData.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountResponseInternal.USBankAccountData[i5];
    }
}
