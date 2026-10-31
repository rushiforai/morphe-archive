package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.IncentiveEligibilitySession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new IncentiveEligibilitySession.SetupIntent(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new IncentiveEligibilitySession.SetupIntent[i5];
    }
}
