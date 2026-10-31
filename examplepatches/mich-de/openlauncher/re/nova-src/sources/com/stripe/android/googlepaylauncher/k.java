package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Result;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return GooglePayPaymentMethodLauncher$Result.Canceled.f42802a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new GooglePayPaymentMethodLauncher$Result.Canceled[i5];
    }
}
