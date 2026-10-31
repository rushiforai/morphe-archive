package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String externalSourceId = parcel.readString();
        Intrinsics.g(externalSourceId, "externalSourceId");
        PaymentMethodCreateParams.ShopPay shopPay = new PaymentMethodCreateParams.ShopPay();
        shopPay.f43719a = externalSourceId;
        return shopPay;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.ShopPay[i5];
    }
}
