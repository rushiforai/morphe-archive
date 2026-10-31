package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            linkedHashMap.put(parcel.readParcelable(PaymentSheet$IntentConfiguration.Mode.Payment.PaymentMethodOptions.class.getClassLoader()), ou.t0.valueOf(parcel.readString()));
        }
        return new PaymentSheet$IntentConfiguration.Mode.Payment.PaymentMethodOptions(linkedHashMap);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$IntentConfiguration.Mode.Payment.PaymentMethodOptions[i5];
    }
}
