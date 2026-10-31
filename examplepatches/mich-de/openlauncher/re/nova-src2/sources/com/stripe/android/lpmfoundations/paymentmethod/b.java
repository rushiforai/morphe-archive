package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.AnalyticsMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Boolean boolValueOf;
        Intrinsics.g(parcel, "parcel");
        if (parcel.readInt() == 0) {
            boolValueOf = null;
        } else {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        return new AnalyticsMetadata.Value.SimpleBoolean(boolValueOf);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AnalyticsMetadata.Value.SimpleBoolean[i5];
    }
}
