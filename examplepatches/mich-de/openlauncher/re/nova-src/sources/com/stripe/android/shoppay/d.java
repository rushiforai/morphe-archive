package com.stripe.android.shoppay;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.shoppay.ShopPayActivityResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ShopPayActivityResult.Failed((Throwable) parcel.readSerializable());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ShopPayActivityResult.Failed[i5];
    }
}
