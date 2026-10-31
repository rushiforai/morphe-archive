package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        PaymentMethodCreateParams.SepaDebit sepaDebit = new PaymentMethodCreateParams.SepaDebit();
        sepaDebit.f43718a = string;
        return sepaDebit;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.SepaDebit[i5];
    }
}
