package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashSet linkedHashSet;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        Integer numValueOf2 = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        if (parcel.readInt() == 0) {
            linkedHashSet = null;
        } else {
            int i5 = parcel.readInt();
            linkedHashSet = new LinkedHashSet(i5);
            int iH = 0;
            while (iH != i5) {
                iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet, iH, 1);
            }
        }
        return new PaymentMethodCreateParams.Card(string, numValueOf, numValueOf2, string2, string3, linkedHashSet, parcel.readInt() != 0 ? PaymentMethodCreateParams.Card.Networks.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.Card[i5];
    }
}
