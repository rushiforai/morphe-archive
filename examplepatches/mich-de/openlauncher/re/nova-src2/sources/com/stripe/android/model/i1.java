package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            linkedHashMap.put(ft.u.valueOf(parcel.readString()), parcel.readString());
        }
        return new ElementsSession.ExperimentsData(string, linkedHashMap);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.ExperimentsData[i5];
    }
}
