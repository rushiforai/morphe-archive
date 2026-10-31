package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u2 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Long l9;
        PaymentMethod.Upi upiCreateFromParcel;
        PaymentMethod.Upi upi;
        PaymentMethod.Netbanking netbankingCreateFromParcel;
        PaymentMethod.Netbanking netbanking;
        PaymentMethod.USBankAccount uSBankAccountCreateFromParcel;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        Long lValueOf = parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong());
        boolean z11 = parcel.readInt() != 0;
        String string2 = parcel.readString();
        PaymentMethod.Type typeCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.Type.CREATOR.createFromParcel(parcel);
        PaymentMethod.BillingDetails billingDetailsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.BillingDetails.CREATOR.createFromParcel(parcel);
        String string3 = parcel.readString();
        PaymentMethod.Card cardCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.Card.CREATOR.createFromParcel(parcel);
        PaymentMethod.CardPresent cardPresentCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.CardPresent.CREATOR.createFromParcel(parcel);
        PaymentMethod.Fpx fpxCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.Fpx.CREATOR.createFromParcel(parcel);
        PaymentMethod.Ideal idealCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.Ideal.CREATOR.createFromParcel(parcel);
        PaymentMethod.SepaDebit sepaDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.SepaDebit.CREATOR.createFromParcel(parcel);
        PaymentMethod.AuBecsDebit auBecsDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.AuBecsDebit.CREATOR.createFromParcel(parcel);
        PaymentMethod.BacsDebit bacsDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.BacsDebit.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            l9 = lValueOf;
            upiCreateFromParcel = null;
        } else {
            l9 = lValueOf;
            upiCreateFromParcel = PaymentMethod.Upi.CREATOR.createFromParcel(parcel);
        }
        PaymentMethod.Upi upi2 = upiCreateFromParcel;
        if (parcel.readInt() == 0) {
            upi = upi2;
            netbankingCreateFromParcel = null;
        } else {
            upi = upi2;
            netbankingCreateFromParcel = PaymentMethod.Netbanking.CREATOR.createFromParcel(parcel);
        }
        PaymentMethod.Netbanking netbanking2 = netbankingCreateFromParcel;
        if (parcel.readInt() == 0) {
            netbanking = netbanking2;
            uSBankAccountCreateFromParcel = null;
        } else {
            netbanking = netbanking2;
            uSBankAccountCreateFromParcel = PaymentMethod.USBankAccount.CREATOR.createFromParcel(parcel);
        }
        return new PaymentMethod(string, l9, z11, string2, typeCreateFromParcel, billingDetailsCreateFromParcel, string3, cardCreateFromParcel, cardPresentCreateFromParcel, fpxCreateFromParcel, idealCreateFromParcel, sepaDebitCreateFromParcel, auBecsDebitCreateFromParcel, bacsDebitCreateFromParcel, upi, netbanking, uSBankAccountCreateFromParcel, (LinkPaymentDetails) parcel.readParcelable(PaymentMethod.class.getClassLoader()), parcel.readInt() != 0, parcel.readInt() == 0 ? null : PaymentMethod.AllowRedisplay.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethod[i5];
    }
}
