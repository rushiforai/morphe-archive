package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetInstantDebitsResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return FinancialConnectionsSheetInstantDebitsResult.Canceled.f42681a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FinancialConnectionsSheetInstantDebitsResult.Canceled[i5];
    }
}
