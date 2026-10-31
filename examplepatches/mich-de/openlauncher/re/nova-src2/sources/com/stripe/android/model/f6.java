package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f6 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return StripeIntent.NextActionData.UpiAwaitNotification.f43960a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new StripeIntent.NextActionData.UpiAwaitNotification[i5];
    }
}
