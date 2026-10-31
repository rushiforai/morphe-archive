package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodUpdateParams;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        Integer numValueOf2 = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        PaymentMethodUpdateParams.Card.Networks networksCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodUpdateParams.Card.Networks.CREATOR.createFromParcel(parcel);
        PaymentMethod.BillingDetails billingDetailsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.BillingDetails.CREATOR.createFromParcel(parcel);
        int i5 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
        int iH = 0;
        while (iH != i5) {
            iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet, iH, 1);
        }
        return new PaymentMethodUpdateParams.Card(numValueOf, numValueOf2, networksCreateFromParcel, billingDetailsCreateFromParcel, linkedHashSet, parcel.readInt() != 0 ? PaymentMethod.AllowRedisplay.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodUpdateParams.Card[i5];
    }
}
