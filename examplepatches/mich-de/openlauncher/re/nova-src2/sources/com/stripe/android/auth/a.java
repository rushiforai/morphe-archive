package com.stripe.android.auth;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.auth.PaymentBrowserAuthContract;
import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        StripeToolbarCustomization stripeToolbarCustomization;
        boolean z12;
        boolean z13;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String str = b.f42142b;
        if (string == null) {
            string = b.f42142b;
        }
        int i5 = parcel.readInt();
        String string2 = parcel.readString();
        if (string2 == null) {
            string2 = b.f42142b;
        }
        String string3 = parcel.readString();
        if (string3 == null) {
            string3 = b.f42142b;
        }
        String string4 = parcel.readString();
        boolean z14 = parcel.readByte() != 0;
        StripeToolbarCustomization stripeToolbarCustomization2 = (StripeToolbarCustomization) parcel.readParcelable(StripeToolbarCustomization.class.getClassLoader());
        boolean z15 = true;
        String string5 = parcel.readString();
        if (parcel.readByte() != 0) {
            z11 = false;
            stripeToolbarCustomization = stripeToolbarCustomization2;
            z12 = true;
        } else {
            z11 = false;
            stripeToolbarCustomization = stripeToolbarCustomization2;
            z12 = false;
        }
        if (parcel.readByte() != 0) {
            z13 = true;
        } else {
            z13 = true;
            z15 = z11;
        }
        Object value = parcel.readValue(Integer.TYPE.getClassLoader());
        Integer num = value instanceof Integer ? (Integer) value : null;
        String string6 = parcel.readString();
        if (string6 != null) {
            str = string6;
        }
        return new PaymentBrowserAuthContract.Args(string, i5, string2, string3, string4, z14, stripeToolbarCustomization, string5, z12, z15, num, str, parcel.readByte() != 0 ? z13 : false, parcel.readString(), parcel.readByte() != 0 ? z13 : false);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentBrowserAuthContract.Args[i5];
    }
}
