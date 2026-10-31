package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new FinancialConnectionsSession.StatusDetails.Cancelled(FinancialConnectionsSession.StatusDetails.Cancelled.Reason.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FinancialConnectionsSession.StatusDetails.Cancelled[i5];
    }
}
