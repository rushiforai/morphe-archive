package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerPaymentDetailsCreateParams;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashMap linkedHashMap;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        if (parcel.readInt() == 0) {
            linkedHashMap = null;
        } else {
            int i5 = parcel.readInt();
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                linkedHashMap2.put(parcel.readString(), parcel.readValue(ConsumerPaymentDetailsCreateParams.BankAccount.class.getClassLoader()));
            }
            linkedHashMap = linkedHashMap2;
        }
        String string2 = parcel.readString();
        int i12 = parcel.readInt();
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(i12);
        for (int i13 = 0; i13 != i12; i13++) {
            linkedHashMap3.put(parcel.readString(), parcel.readValue(ConsumerPaymentDetailsCreateParams.BankAccount.class.getClassLoader()));
        }
        return new ConsumerPaymentDetailsCreateParams.BankAccount(string, linkedHashMap, string2, linkedHashMap3);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsumerPaymentDetailsCreateParams.BankAccount[i5];
    }
}
