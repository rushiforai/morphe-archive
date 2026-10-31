package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashMap linkedHashMap;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String string2 = parcel.readString();
        if (parcel.readInt() == 0) {
            linkedHashMap = null;
        } else {
            int i5 = parcel.readInt();
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                linkedHashMap2.put(parcel.readString(), parcel.readValue(PaymentMethodCreateParams.Link.class.getClassLoader()));
            }
            linkedHashMap = linkedHashMap2;
        }
        return new PaymentMethodCreateParams.Link(string, string2, linkedHashMap);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams.Link[i5];
    }
}
