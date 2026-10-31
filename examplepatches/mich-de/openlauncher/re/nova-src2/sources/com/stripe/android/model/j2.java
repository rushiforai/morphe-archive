package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j2 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentMethod.AfterRedirectAction.Poll(parcel.readLong());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethod.AfterRedirectAction.Poll[i5];
    }
}
