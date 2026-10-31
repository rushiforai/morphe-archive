package com.stripe.android.model;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new StripeIntent.NextActionData.AlipayRedirect(parcel.readString(), parcel.readString(), (Uri) parcel.readParcelable(StripeIntent.NextActionData.AlipayRedirect.class.getClassLoader()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new StripeIntent.NextActionData.AlipayRedirect[i5];
    }
}
