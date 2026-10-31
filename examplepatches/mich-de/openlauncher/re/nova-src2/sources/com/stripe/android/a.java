package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.PaymentRelayStarter$Args;
import com.stripe.android.core.exception.StripeException;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Serializable serializable = parcel.readSerializable();
        Intrinsics.e(serializable, "null cannot be cast to non-null type com.stripe.android.core.exception.StripeException");
        return new PaymentRelayStarter$Args.ErrorArgs((StripeException) serializable, parcel.readInt());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentRelayStarter$Args.ErrorArgs[i5];
    }
}
