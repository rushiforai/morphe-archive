package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodExtraParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Boolean boolValueOf;
        Intrinsics.g(parcel, "parcel");
        if (parcel.readInt() == 0) {
            boolValueOf = null;
        } else {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        return new PaymentMethodExtraParams.Link(boolValueOf);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodExtraParams.Link[i5];
    }
}
