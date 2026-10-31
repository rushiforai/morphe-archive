package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSessionParams;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
        int iH = 0;
        while (iH != i5) {
            iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet, iH, 1);
        }
        return new ElementsSessionParams.Link(linkedHashSet);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSessionParams.Link[i5];
    }
}
