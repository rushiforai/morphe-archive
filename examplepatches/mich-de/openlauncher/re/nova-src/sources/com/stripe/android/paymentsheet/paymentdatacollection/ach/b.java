package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        Intrinsics.g(parcel, "parcel");
        BankFormScreenState.ResultIdentifier resultIdentifier = (BankFormScreenState.ResultIdentifier) parcel.readParcelable(BankFormScreenState.LinkedBankAccount.class.getClassLoader());
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        ResolvableString resolvableString = (ResolvableString) parcel.readParcelable(BankFormScreenState.LinkedBankAccount.class.getClassLoader());
        boolean z12 = false;
        if (parcel.readInt() != 0) {
            z11 = false;
            z12 = true;
        } else {
            z11 = false;
        }
        return new BankFormScreenState.LinkedBankAccount(resultIdentifier, string, string2, string3, string4, resolvableString, z12, parcel.readInt() == 0 ? z11 : true);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BankFormScreenState.LinkedBankAccount[i5];
    }
}
