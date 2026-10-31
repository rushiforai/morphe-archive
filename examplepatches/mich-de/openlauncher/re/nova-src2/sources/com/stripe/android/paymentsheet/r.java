package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheet$Appearance.Embedded.RowStyle.FlatWithRadio.Colors(parcel.readInt(), parcel.readInt(), parcel.readInt());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$Appearance.Embedded.RowStyle.FlatWithRadio.Colors[i5];
    }
}
