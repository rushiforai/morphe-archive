package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.BalanceRefresh;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BalanceRefresh(parcel.readInt() == 0 ? null : BalanceRefresh.BalanceRefreshStatus.valueOf(parcel.readString()), parcel.readInt());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BalanceRefresh[i5];
    }
}
