package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsAccount;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Balance balance;
        Intrinsics.g(parcel, "parcel");
        FinancialConnectionsAccount.Category categoryValueOf = FinancialConnectionsAccount.Category.valueOf(parcel.readString());
        int i5 = parcel.readInt();
        String string = parcel.readString();
        String string2 = parcel.readString();
        boolean z11 = parcel.readInt() != 0;
        FinancialConnectionsAccount.Status statusValueOf = FinancialConnectionsAccount.Status.valueOf(parcel.readString());
        FinancialConnectionsAccount.Subcategory subcategoryValueOf = FinancialConnectionsAccount.Subcategory.valueOf(parcel.readString());
        int i11 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i11);
        for (int i12 = 0; i12 != i11; i12++) {
            arrayList.add(FinancialConnectionsAccount.SupportedPaymentMethodTypes.valueOf(parcel.readString()));
        }
        ArrayList arrayList2 = null;
        Balance balanceCreateFromParcel = parcel.readInt() == 0 ? null : Balance.CREATOR.createFromParcel(parcel);
        BalanceRefresh balanceRefreshCreateFromParcel = parcel.readInt() == 0 ? null : BalanceRefresh.CREATOR.createFromParcel(parcel);
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        String string5 = parcel.readString();
        OwnershipRefresh ownershipRefreshCreateFromParcel = parcel.readInt() == 0 ? null : OwnershipRefresh.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            balance = balanceCreateFromParcel;
        } else {
            int i13 = parcel.readInt();
            ArrayList arrayList3 = new ArrayList(i13);
            balance = balanceCreateFromParcel;
            for (int i14 = 0; i14 != i13; i14++) {
                arrayList3.add(FinancialConnectionsAccount.Permissions.valueOf(parcel.readString()));
            }
            arrayList2 = arrayList3;
        }
        return new FinancialConnectionsAccount(categoryValueOf, i5, string, string2, z11, statusValueOf, subcategoryValueOf, arrayList, balance, balanceRefreshCreateFromParcel, string3, string4, string5, ownershipRefreshCreateFromParcel, arrayList2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FinancialConnectionsAccount[i5];
    }
}
