package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.AnalyticsMetadata;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            linkedHashMap.put(parcel.readString(), parcel.readParcelable(AnalyticsMetadata.Value.Nested.class.getClassLoader()));
        }
        return new AnalyticsMetadata.Value.Nested(linkedHashMap);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AnalyticsMetadata.Value.Nested[i5];
    }
}
