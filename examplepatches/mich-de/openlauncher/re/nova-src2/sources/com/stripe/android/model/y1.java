package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.MandateDataParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new MandateDataParams((MandateDataParams.Type) parcel.readParcelable(MandateDataParams.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new MandateDataParams[i5];
    }
}
