package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodOptionsParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d4 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String string2 = parcel.readString();
        Boolean boolValueOf = null;
        ft.d dVarValueOf = parcel.readInt() == 0 ? null : ft.d.valueOf(parcel.readString());
        if (parcel.readInt() != 0) {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        return new PaymentMethodOptionsParams.Card(string, string2, dVarValueOf, boolValueOf);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodOptionsParams.Card[i5];
    }
}
