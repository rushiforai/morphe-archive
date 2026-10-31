package com.stripe.android.link.ui.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.ui.wallet.DefaultPaymentUI;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new DefaultPaymentUI((DefaultPaymentUI.PaymentType) parcel.readParcelable(DefaultPaymentUI.class.getClassLoader()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new DefaultPaymentUI[i5];
    }
}
