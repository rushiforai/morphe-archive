package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.uicore.elements.AddressInputMode;
import java.util.LinkedHashSet;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashSet linkedHashSet;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        if (parcel.readInt() == 0) {
            linkedHashSet = null;
        } else {
            int i5 = parcel.readInt();
            LinkedHashSet linkedHashSet2 = new LinkedHashSet(i5);
            int iH = 0;
            while (iH != i5) {
                iH = k2.h(parcel, linkedHashSet2, iH, 1);
            }
            linkedHashSet = linkedHashSet2;
        }
        return new AddressInputMode.AutocompleteCondensed(string, linkedHashSet, kw.c.valueOf(parcel.readString()), kw.c.valueOf(parcel.readString()), kw.c.valueOf(parcel.readString()), (Function0) parcel.readSerializable());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AddressInputMode.AutocompleteCondensed[i5];
    }
}
