package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentElementLoader$InitializationMode.DeferredIntent(PaymentSheet$IntentConfiguration.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentElementLoader$InitializationMode.DeferredIntent[i5];
    }
}
