package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.model.IncentiveEligibilitySession;
import ft.d0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ElementsSessionContext(parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong()), parcel.readString(), parcel.readInt() == 0 ? null : d0.valueOf(parcel.readString()), parcel.readInt() == 0 ? null : ElementsSessionContext.AllowRedisplay.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? ElementsSessionContext.BillingDetails.CREATOR.createFromParcel(parcel) : null, ElementsSessionContext.PrefillDetails.CREATOR.createFromParcel(parcel), (IncentiveEligibilitySession) parcel.readParcelable(ElementsSessionContext.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSessionContext[i5];
    }
}
