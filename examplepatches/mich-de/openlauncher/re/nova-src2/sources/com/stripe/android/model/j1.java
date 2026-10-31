package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        LinkedHashMap linkedHashMap;
        boolean z12;
        Intrinsics.g(parcel, "parcel");
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        boolean z13 = true;
        if (parcel.readInt() != 0) {
            z11 = true;
        } else {
            z11 = true;
            z13 = false;
        }
        ft.d0 d0VarValueOf = parcel.readInt() == 0 ? null : ft.d0.valueOf(parcel.readString());
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            linkedHashMap2.put(parcel.readString(), Boolean.valueOf(parcel.readInt() != 0 ? z11 : false));
        }
        if (parcel.readInt() != 0) {
            linkedHashMap = linkedHashMap2;
            z12 = z11;
        } else {
            linkedHashMap = linkedHashMap2;
            z12 = false;
        }
        return new ElementsSession.LinkSettings(arrayListCreateStringArrayList, z13, d0VarValueOf, linkedHashMap, z12, (LinkConsumerIncentive) parcel.readParcelable(ElementsSession.LinkSettings.class.getClassLoader()), parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false, parcel.createStringArrayList());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.LinkSettings[i5];
    }
}
