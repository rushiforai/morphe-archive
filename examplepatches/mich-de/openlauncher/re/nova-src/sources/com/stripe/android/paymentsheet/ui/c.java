package com.stripe.android.paymentsheet.ui;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.ui.SepaMandateResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return SepaMandateResult.Acknowledged.f45000a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SepaMandateResult.Acknowledged[i5];
    }
}
