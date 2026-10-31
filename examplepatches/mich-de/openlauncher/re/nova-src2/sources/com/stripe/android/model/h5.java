package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.Source;
import com.stripe.android.model.SourceParams;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        if (parcel.readParcelable(SourceParams.class.getClassLoader()) != null) {
            throw new ClassCastException();
        }
        LinkedHashMap linkedHashMap = null;
        Long lValueOf = parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong());
        String string2 = parcel.readString();
        SourceParams.OwnerParams ownerParamsCreateFromParcel = parcel.readInt() == 0 ? null : SourceParams.OwnerParams.CREATOR.createFromParcel(parcel);
        Source.Usage usageValueOf = parcel.readInt() == 0 ? null : Source.Usage.valueOf(parcel.readString());
        SourceOrderParams sourceOrderParamsCreateFromParcel = parcel.readInt() == 0 ? null : SourceOrderParams.CREATOR.createFromParcel(parcel);
        String string3 = parcel.readString();
        int iH = 0;
        if (parcel.readInt() != 0) {
            int i5 = parcel.readInt();
            linkedHashMap = new LinkedHashMap(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                linkedHashMap.put(parcel.readString(), parcel.readString());
            }
        }
        SourceParams.ApiParams apiParamsCreateFromParcel = SourceParams.ApiParams.CREATOR.createFromParcel(parcel);
        int i12 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i12);
        while (iH != i12) {
            iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet, iH, 1);
        }
        return new SourceParams(string, lValueOf, string2, ownerParamsCreateFromParcel, usageValueOf, sourceOrderParamsCreateFromParcel, string3, linkedHashMap, apiParamsCreateFromParcel, linkedHashSet);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SourceParams[i5];
    }
}
