package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$Typography;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheet$Appearance.Embedded((PaymentSheet$Appearance.Embedded.RowStyle) parcel.readParcelable(PaymentSheet$Appearance.Embedded.class.getClassLoader()), parcel.readInt() == 0 ? null : PaymentSheet$Insets.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : PaymentSheet$Typography.Font.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? PaymentSheet$Typography.Font.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$Appearance.Embedded[i5];
    }
}
