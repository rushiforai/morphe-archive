package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.Source;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashMap linkedHashMap;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        Long lValueOf = parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong());
        String string2 = parcel.readString();
        Long lValueOf2 = parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong());
        String string3 = parcel.readString();
        Boolean boolValueOf = parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() != 0);
        Source.Owner ownerCreateFromParcel = parcel.readInt() == 0 ? null : Source.Owner.CREATOR.createFromParcel(parcel);
        Source.Status statusValueOf = parcel.readInt() == 0 ? null : Source.Status.valueOf(parcel.readString());
        if (parcel.readInt() == 0) {
            linkedHashMap = null;
        } else {
            int i5 = parcel.readInt();
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                linkedHashMap2.put(parcel.readString(), parcel.readValue(Source.class.getClassLoader()));
            }
            linkedHashMap = linkedHashMap2;
        }
        return new Source(string, lValueOf, string2, lValueOf2, string3, boolValueOf, ownerCreateFromParcel, statusValueOf, linkedHashMap, (SourceTypeModel) parcel.readParcelable(Source.class.getClassLoader()), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Source.Usage.valueOf(parcel.readString()), parcel.readInt() != 0 ? SourceOrder.CREATOR.createFromParcel(parcel) : null, parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Source[i5];
    }
}
