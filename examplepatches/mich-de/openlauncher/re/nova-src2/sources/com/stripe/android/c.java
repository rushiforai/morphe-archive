package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.PaymentRelayStarter$Args;
import com.stripe.android.model.SetupIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentRelayStarter$Args.SetupIntentArgs((SetupIntent) parcel.readParcelable(PaymentRelayStarter$Args.SetupIntentArgs.class.getClassLoader()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentRelayStarter$Args.SetupIntentArgs[i5];
    }
}
