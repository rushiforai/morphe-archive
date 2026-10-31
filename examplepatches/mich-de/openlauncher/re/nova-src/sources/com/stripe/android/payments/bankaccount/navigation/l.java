package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResultInternal;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return CollectBankAccountResultInternal.Cancelled.f44302a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CollectBankAccountResultInternal.Cancelled[i5];
    }
}
