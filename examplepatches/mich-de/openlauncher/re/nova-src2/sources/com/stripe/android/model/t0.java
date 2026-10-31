package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.DeferredIntentParams;
import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new DeferredIntentParams.Mode.Payment(parcel.readLong(), parcel.readString(), parcel.readInt() == 0 ? null : StripeIntent.Usage.valueOf(parcel.readString()), ft.l0.valueOf(parcel.readString()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new DeferredIntentParams.Mode.Payment[i5];
    }
}
