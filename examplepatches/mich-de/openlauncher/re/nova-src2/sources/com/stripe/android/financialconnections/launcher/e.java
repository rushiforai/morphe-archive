package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.Token;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new FinancialConnectionsSheetActivityResult.Completed(parcel.readInt() == 0 ? null : InstantDebitsResult.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? FinancialConnectionsSession.CREATOR.createFromParcel(parcel) : null, (Token) parcel.readParcelable(FinancialConnectionsSheetActivityResult.Completed.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FinancialConnectionsSheetActivityResult.Completed[i5];
    }
}
