package com.stripe.android.paymentelement.confirmation.cpms;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.confirmation.cpms.InternalCustomPaymentMethodResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return InternalCustomPaymentMethodResult.Completed.f44154a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new InternalCustomPaymentMethodResult.Completed[i5];
    }
}
