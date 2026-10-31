package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Typography;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheet$Typography.Font(parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Float.valueOf(parcel.readFloat()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() != 0 ? Float.valueOf(parcel.readFloat()) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$Typography.Font[i5];
    }
}
