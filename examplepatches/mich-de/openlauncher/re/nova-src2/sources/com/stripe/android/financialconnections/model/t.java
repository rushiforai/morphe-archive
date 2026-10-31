package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new FinancialConnectionsSession(parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : FinancialConnectionsAccountList.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : FinancialConnectionsAccountList.CREATOR.createFromParcel(parcel), parcel.readInt() != 0, (PaymentAccount) parcel.readParcelable(FinancialConnectionsSession.class.getClassLoader()), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : ManualEntry.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : FinancialConnectionsSession.Status.valueOf(parcel.readString()), parcel.readInt() != 0 ? FinancialConnectionsSession.StatusDetails.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FinancialConnectionsSession[i5];
    }
}
