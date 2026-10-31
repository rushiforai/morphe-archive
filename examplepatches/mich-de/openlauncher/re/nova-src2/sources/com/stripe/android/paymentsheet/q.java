package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        Intrinsics.g(parcel, "parcel");
        float f11 = parcel.readFloat();
        float f12 = parcel.readFloat();
        float f13 = parcel.readFloat();
        boolean z13 = false;
        if (parcel.readInt() != 0) {
            z11 = false;
            z13 = true;
            z12 = true;
        } else {
            z11 = false;
            z12 = true;
        }
        float f14 = parcel.readFloat();
        if (parcel.readInt() == 0) {
            z12 = z11;
        }
        float f15 = parcel.readFloat();
        Parcelable.Creator<PaymentSheet$Appearance.Embedded.RowStyle.FlatWithDisclosure.Colors> creator = PaymentSheet$Appearance.Embedded.RowStyle.FlatWithDisclosure.Colors.CREATOR;
        return new PaymentSheet$Appearance.Embedded.RowStyle.FlatWithDisclosure(f11, f12, f13, z13, f14, z12, f15, creator.createFromParcel(parcel), creator.createFromParcel(parcel), parcel.readInt());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$Appearance.Embedded.RowStyle.FlatWithDisclosure[i5];
    }
}
