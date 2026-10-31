package com.stripe.android.payments.paymentlauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.payments.paymentlauncher.PaymentResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return PaymentResult.Completed.f44390a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentResult.Completed[i5];
    }
}
