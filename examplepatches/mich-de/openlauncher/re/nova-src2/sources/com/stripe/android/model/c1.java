package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return ElementsSession.Customer.Components.MobilePaymentElement.Disabled.f43419a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.Customer.Components.MobilePaymentElement.Disabled[i5];
    }
}
