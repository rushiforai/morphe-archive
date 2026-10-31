package com.stripe.android.analytics;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.analytics.Session;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new Session.Owner(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Session.Owner[i5];
    }
}
