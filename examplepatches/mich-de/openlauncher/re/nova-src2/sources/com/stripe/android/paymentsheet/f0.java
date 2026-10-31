package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheet$IntentConfiguration.Mode.Setup(parcel.readString(), ou.t0.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$IntentConfiguration.Mode.Setup[i5];
    }
}
