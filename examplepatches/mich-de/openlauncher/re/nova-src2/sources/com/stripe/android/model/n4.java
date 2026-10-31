package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodUpdateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethodUpdateParams.Card.Networks(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodUpdateParams.Card.Networks[i5];
    }
}
