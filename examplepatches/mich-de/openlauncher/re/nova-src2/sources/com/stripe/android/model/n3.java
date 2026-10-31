package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        PaymentMethod.BillingDetails billingDetailsCreateFromParcel;
        PaymentMethod.BillingDetails billingDetails;
        PaymentMethod.AllowRedisplay allowRedisplayCreateFromParcel;
        RadarOptions radarOptions;
        PaymentMethodCreateParams.CashAppPay cashAppPay;
        LinkedHashMap linkedHashMap;
        String str;
        ClientAttributionMetadata clientAttributionMetadata;
        LinkedHashMap linkedHashMap2;
        LinkedHashSet linkedHashSet;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        boolean z12 = parcel.readInt() != 0;
        PaymentMethodCreateParams.Card cardCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Card.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Ideal idealCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Ideal.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Fpx fpxCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Fpx.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.SepaDebit sepaDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.SepaDebit.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.AuBecsDebit auBecsDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.AuBecsDebit.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.BacsDebit bacsDebitCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.BacsDebit.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Upi upiCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Upi.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Netbanking netbankingCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Netbanking.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.USBankAccount uSBankAccountCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.USBankAccount.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Link linkCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Link.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.CashAppPay cashAppPayCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.CashAppPay.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.Swish swishCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.Swish.CREATOR.createFromParcel(parcel);
        PaymentMethodCreateParams.ShopPay shopPayCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.ShopPay.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            z11 = z12;
            billingDetailsCreateFromParcel = null;
        } else {
            z11 = z12;
            billingDetailsCreateFromParcel = PaymentMethod.BillingDetails.CREATOR.createFromParcel(parcel);
        }
        PaymentMethod.BillingDetails billingDetails2 = billingDetailsCreateFromParcel;
        if (parcel.readInt() == 0) {
            billingDetails = billingDetails2;
            allowRedisplayCreateFromParcel = null;
        } else {
            billingDetails = billingDetails2;
            allowRedisplayCreateFromParcel = PaymentMethod.AllowRedisplay.CREATOR.createFromParcel(parcel);
        }
        PaymentMethod.AllowRedisplay allowRedisplay = allowRedisplayCreateFromParcel;
        RadarOptions radarOptions2 = (RadarOptions) parcel.readParcelable(PaymentMethodCreateParams.class.getClassLoader());
        if (parcel.readInt() == 0) {
            radarOptions = radarOptions2;
            cashAppPay = cashAppPayCreateFromParcel;
            str = string;
            linkedHashMap = null;
        } else {
            radarOptions = radarOptions2;
            int i5 = parcel.readInt();
            cashAppPay = cashAppPayCreateFromParcel;
            linkedHashMap = new LinkedHashMap(i5);
            str = string;
            int i11 = 0;
            while (i11 != i5) {
                linkedHashMap.put(parcel.readString(), parcel.readString());
                i11++;
                i5 = i5;
            }
        }
        int i12 = parcel.readInt();
        LinkedHashSet linkedHashSet2 = new LinkedHashSet(i12);
        LinkedHashMap linkedHashMap3 = linkedHashMap;
        int iH = 0;
        while (iH != i12) {
            iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet2, iH, 1);
            i12 = i12;
        }
        ClientAttributionMetadata clientAttributionMetadataCreateFromParcel = parcel.readInt() == 0 ? null : ClientAttributionMetadata.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            clientAttributionMetadata = clientAttributionMetadataCreateFromParcel;
            linkedHashSet = linkedHashSet2;
            linkedHashMap2 = null;
        } else {
            int i13 = parcel.readInt();
            clientAttributionMetadata = clientAttributionMetadataCreateFromParcel;
            linkedHashMap2 = new LinkedHashMap(i13);
            linkedHashSet = linkedHashSet2;
            int i14 = 0;
            while (i14 != i13) {
                linkedHashMap2.put(parcel.readString(), parcel.readValue(PaymentMethodCreateParams.class.getClassLoader()));
                i14++;
                i13 = i13;
            }
        }
        return new PaymentMethodCreateParams(str, z11, cardCreateFromParcel, idealCreateFromParcel, fpxCreateFromParcel, sepaDebitCreateFromParcel, auBecsDebitCreateFromParcel, bacsDebitCreateFromParcel, upiCreateFromParcel, netbankingCreateFromParcel, uSBankAccountCreateFromParcel, linkCreateFromParcel, cashAppPay, swishCreateFromParcel, shopPayCreateFromParcel, billingDetails, allowRedisplay, radarOptions, linkedHashMap3, linkedHashSet, clientAttributionMetadata, linkedHashMap2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodCreateParams[i5];
    }
}
