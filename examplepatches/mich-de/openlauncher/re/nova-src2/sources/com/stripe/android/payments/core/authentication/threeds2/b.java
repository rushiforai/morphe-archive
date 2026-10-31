package com.stripe.android.payments.core.authentication.threeds2;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.PaymentAuthConfig$Stripe3ds2Config;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        SdkTransactionId sdkTransactionId = (SdkTransactionId) parcel.readParcelable(Stripe3ds2TransactionContract.Args.class.getClassLoader());
        PaymentAuthConfig$Stripe3ds2Config paymentAuthConfig$Stripe3ds2Config = (PaymentAuthConfig$Stripe3ds2Config) parcel.readParcelable(Stripe3ds2TransactionContract.Args.class.getClassLoader());
        StripeIntent stripeIntent = (StripeIntent) parcel.readParcelable(Stripe3ds2TransactionContract.Args.class.getClassLoader());
        StripeIntent.NextActionData.SdkData.Use3DS2 use3DS2 = (StripeIntent.NextActionData.SdkData.Use3DS2) parcel.readParcelable(Stripe3ds2TransactionContract.Args.class.getClassLoader());
        ApiRequest$Options apiRequest$Options = (ApiRequest$Options) parcel.readParcelable(Stripe3ds2TransactionContract.Args.class.getClassLoader());
        int iH = 0;
        boolean z11 = parcel.readInt() != 0;
        Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
        String string = parcel.readString();
        int i5 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
        while (iH != i5) {
            iH = k2.h(parcel, linkedHashSet, iH, 1);
        }
        return new Stripe3ds2TransactionContract.Args(sdkTransactionId, paymentAuthConfig$Stripe3ds2Config, stripeIntent, use3DS2, apiRequest$Options, z11, numValueOf, string, linkedHashSet);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Stripe3ds2TransactionContract.Args[i5];
    }
}
