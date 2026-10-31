package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.paymentsheet.PaymentOptionContract;
import com.stripe.android.paymentsheet.state.PaymentSheetState$Full;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        PaymentSheetState$Full paymentSheetState$Full = (PaymentSheetState$Full) parcel.readParcelable(PaymentOptionContract.Args.class.getClassLoader());
        PaymentSheet$Configuration paymentSheet$ConfigurationCreateFromParcel = PaymentSheet$Configuration.CREATOR.createFromParcel(parcel);
        LinkAccountUpdate.Value value = (LinkAccountUpdate.Value) parcel.readParcelable(PaymentOptionContract.Args.class.getClassLoader());
        int iH = 0;
        boolean z11 = parcel.readInt() != 0;
        boolean z12 = parcel.readInt() != 0;
        int i5 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
        while (iH != i5) {
            iH = k2.h(parcel, linkedHashSet, iH, 1);
        }
        return new PaymentOptionContract.Args(paymentSheetState$Full, paymentSheet$ConfigurationCreateFromParcel, value, z11, z12, linkedHashSet, parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentOptionContract.Args[i5];
    }
}
