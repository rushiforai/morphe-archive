package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5;
        Class cls;
        PaymentSheet$BillingDetails paymentSheet$BillingDetailsCreateFromParcel;
        Class cls2;
        boolean z11;
        Class cls3;
        boolean z12;
        Class cls4;
        boolean z13;
        Class cls5;
        String str;
        ft.d0 d0Var;
        boolean z14;
        Class cls6;
        String str2;
        boolean z15;
        Class cls7;
        boolean z16;
        Class cls8;
        boolean z17;
        Class cls9;
        boolean z18;
        Class cls10;
        boolean z19;
        Intrinsics.g(parcel, "parcel");
        StripeIntent stripeIntent = (StripeIntent) parcel.readParcelable(LinkConfiguration.class.getClassLoader());
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        LinkConfiguration.CustomerInfo customerInfoCreateFromParcel = LinkConfiguration.CustomerInfo.CREATOR.createFromParcel(parcel);
        AddressDetails addressDetailsCreateFromParcel = parcel.readInt() == 0 ? null : AddressDetails.CREATOR.createFromParcel(parcel);
        boolean z21 = false;
        if (parcel.readInt() != 0) {
            i5 = 0;
            z21 = true;
        } else {
            i5 = 0;
        }
        int i11 = parcel.readInt();
        LinkedHashMap linkedHashMap = new LinkedHashMap(i11);
        for (int i12 = i5; i12 != i11; i12++) {
            linkedHashMap.put(parcel.readString(), Boolean.valueOf(parcel.readInt() != 0));
        }
        LinkConfiguration.CardBrandChoice cardBrandChoiceCreateFromParcel = parcel.readInt() == 0 ? null : LinkConfiguration.CardBrandChoice.CREATOR.createFromParcel(parcel);
        CardBrandFilter cardBrandFilter = (CardBrandFilter) parcel.readParcelable(LinkConfiguration.class.getClassLoader());
        CardFundingFilter cardFundingFilter = (CardFundingFilter) parcel.readParcelable(LinkConfiguration.class.getClassLoader());
        mu.b bVarValueOf = parcel.readInt() == 0 ? null : mu.b.valueOf(parcel.readString());
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel = PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            cls = LinkConfiguration.class;
            paymentSheet$BillingDetailsCreateFromParcel = null;
        } else {
            cls = LinkConfiguration.class;
            paymentSheet$BillingDetailsCreateFromParcel = PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel);
        }
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = paymentSheet$BillingDetailsCreateFromParcel;
        if (parcel.readInt() != 0) {
            cls2 = cls;
            z11 = true;
        } else {
            cls2 = cls;
            z11 = false;
        }
        if (parcel.readInt() != 0) {
            cls3 = cls2;
            z12 = true;
        } else {
            cls3 = cls2;
            z12 = false;
        }
        if (parcel.readInt() != 0) {
            cls4 = cls3;
            z13 = true;
        } else {
            cls4 = cls3;
            z13 = false;
        }
        String string5 = parcel.readString();
        ft.d0 d0VarValueOf = parcel.readInt() == 0 ? null : ft.d0.valueOf(parcel.readString());
        if (parcel.readInt() != 0) {
            cls5 = cls4;
            str = string5;
            d0Var = d0VarValueOf;
            z14 = true;
        } else {
            cls5 = cls4;
            str = string5;
            d0Var = d0VarValueOf;
            z14 = false;
        }
        String string6 = parcel.readString();
        if (parcel.readInt() != 0) {
            cls6 = cls5;
            str2 = string6;
            z15 = true;
        } else {
            cls6 = cls5;
            str2 = string6;
            z15 = false;
        }
        if (parcel.readInt() != 0) {
            cls7 = cls6;
            z16 = true;
        } else {
            cls7 = cls6;
            z16 = false;
        }
        if (parcel.readInt() != 0) {
            cls8 = cls7;
            z17 = true;
        } else {
            cls8 = cls7;
            z17 = false;
        }
        if (parcel.readInt() != 0) {
            cls9 = cls8;
            z18 = true;
        } else {
            cls9 = cls8;
            z18 = false;
        }
        if (parcel.readInt() != 0) {
            cls10 = cls9;
            z19 = true;
        } else {
            cls10 = cls9;
            z19 = false;
        }
        return new LinkConfiguration(stripeIntent, string, string2, string3, string4, customerInfoCreateFromParcel, addressDetailsCreateFromParcel, z21, linkedHashMap, cardBrandChoiceCreateFromParcel, cardBrandFilter, cardFundingFilter, bVarValueOf, paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel, paymentSheet$BillingDetails, z11, z12, z13, str, d0Var, z14, str2, z15, z16, z17, z18, z19, parcel.readInt() == 0 ? null : LinkAppearance.CREATOR.createFromParcel(parcel), parcel.readInt() != 0, parcel.readInt() != 0, parcel.readString(), (PaymentMethodSaveConsentBehavior) parcel.readParcelable(cls10.getClassLoader()), parcel.readInt() != 0, parcel.createStringArrayList(), (ClientAttributionMetadata) parcel.readParcelable(cls10.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkConfiguration[i5];
    }
}
