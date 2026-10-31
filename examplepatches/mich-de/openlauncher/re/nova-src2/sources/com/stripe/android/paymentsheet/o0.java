package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$WalletButtonsConfiguration;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        int i5 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
        for (int i11 = 0; i11 != i5; i11++) {
            linkedHashMap.put(ou.y0.valueOf(parcel.readString()), ou.x0.valueOf(parcel.readString()));
        }
        int i12 = parcel.readInt();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(i12);
        for (int i13 = 0; i13 != i12; i13++) {
            linkedHashMap2.put(ou.y0.valueOf(parcel.readString()), ou.z0.valueOf(parcel.readString()));
        }
        return new PaymentSheet$WalletButtonsConfiguration.Visibility(linkedHashMap, linkedHashMap2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$WalletButtonsConfiguration.Visibility[i5];
    }
}
