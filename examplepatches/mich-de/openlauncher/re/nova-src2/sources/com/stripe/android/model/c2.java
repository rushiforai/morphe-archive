package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c2 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Long l9;
        PaymentIntent.Error errorCreateFromParcel;
        PaymentIntent.Error error;
        PaymentIntent.Shipping shippingCreateFromParcel;
        StripeIntent.Status status;
        PaymentIntent.Error error2;
        StripeIntent.Usage usage;
        PaymentIntent.Shipping shipping;
        boolean z11;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        Long lValueOf = parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong());
        long j11 = parcel.readLong();
        ft.k0 k0VarValueOf = parcel.readInt() == 0 ? null : ft.k0.valueOf(parcel.readString());
        ft.l0 l0VarValueOf = ft.l0.valueOf(parcel.readString());
        String string2 = parcel.readString();
        ft.n0 n0VarValueOf = ft.n0.valueOf(parcel.readString());
        String string3 = parcel.readString();
        long j12 = parcel.readLong();
        String string4 = parcel.readString();
        String string5 = parcel.readString();
        boolean z12 = parcel.readInt() != 0;
        PaymentMethod paymentMethodCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.CREATOR.createFromParcel(parcel);
        String string6 = parcel.readString();
        String string7 = parcel.readString();
        StripeIntent.Status statusValueOf = parcel.readInt() == 0 ? null : StripeIntent.Status.valueOf(parcel.readString());
        StripeIntent.Usage usageValueOf = parcel.readInt() == 0 ? null : StripeIntent.Usage.valueOf(parcel.readString());
        if (parcel.readInt() == 0) {
            l9 = lValueOf;
            errorCreateFromParcel = null;
        } else {
            l9 = lValueOf;
            errorCreateFromParcel = PaymentIntent.Error.CREATOR.createFromParcel(parcel);
        }
        PaymentIntent.Error error3 = errorCreateFromParcel;
        if (parcel.readInt() == 0) {
            error = error3;
            shippingCreateFromParcel = null;
        } else {
            error = error3;
            shippingCreateFromParcel = PaymentIntent.Shipping.CREATOR.createFromParcel(parcel);
        }
        PaymentIntent.Shipping shipping2 = shippingCreateFromParcel;
        Long l11 = l9;
        ArrayList<String> arrayListCreateStringArrayList2 = parcel.createStringArrayList();
        ArrayList<String> arrayListCreateStringArrayList3 = parcel.createStringArrayList();
        StripeIntent.NextActionData nextActionData = (StripeIntent.NextActionData) parcel.readParcelable(PaymentIntent.class.getClassLoader());
        String string8 = parcel.readString();
        if (parcel.readInt() != 0) {
            z11 = true;
            status = statusValueOf;
            error2 = error;
            usage = usageValueOf;
            shipping = shipping2;
        } else {
            status = statusValueOf;
            error2 = error;
            usage = usageValueOf;
            shipping = shipping2;
            z11 = false;
        }
        return new PaymentIntent(string, arrayListCreateStringArrayList, l11, j11, k0VarValueOf, l0VarValueOf, string2, n0VarValueOf, string3, j12, string4, string5, z12, paymentMethodCreateFromParcel, string6, string7, status, usage, error2, shipping, arrayListCreateStringArrayList2, arrayListCreateStringArrayList3, nextActionData, string8, z11);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentIntent[i5];
    }
}
