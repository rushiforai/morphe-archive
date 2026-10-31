package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(PaymentMethod.CREATOR, parcel, arrayList, iB, 1);
        }
        return new ElementsSession.Customer(arrayList, parcel.readString(), ElementsSession.Customer.Session.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.Customer[i5];
    }
}
