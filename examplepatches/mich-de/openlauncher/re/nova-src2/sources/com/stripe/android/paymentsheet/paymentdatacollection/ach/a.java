package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        Intrinsics.g(parcel, "parcel");
        boolean z13 = false;
        if (parcel.readInt() != 0) {
            z11 = false;
            z13 = true;
            z12 = true;
        } else {
            z11 = false;
            z12 = true;
        }
        String string = parcel.readString();
        if (parcel.readInt() == 0) {
            z12 = z11;
        }
        return new BankFormScreenState(z13, string, z12, parcel.readInt() == 0 ? null : BankFormScreenState.LinkedBankAccount.CREATOR.createFromParcel(parcel), (ResolvableString) parcel.readParcelable(BankFormScreenState.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BankFormScreenState[i5];
    }
}
