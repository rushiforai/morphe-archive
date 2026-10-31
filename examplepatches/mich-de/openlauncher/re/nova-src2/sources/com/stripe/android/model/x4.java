package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.SourceOrder;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        String string = parcel.readString();
        String string2 = parcel.readString();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(SourceOrder.Item.CREATOR, parcel, arrayList, iB, 1);
        }
        return new SourceOrder(numValueOf, string, string2, arrayList, parcel.readInt() != 0 ? SourceOrder.Shipping.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SourceOrder[i5];
    }
}
