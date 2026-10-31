package com.stripe.android.paymentelement.embedded.form;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.embedded.form.FormResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new FormResult.Complete((PaymentSelection) parcel.readParcelable(FormResult.Complete.class.getClassLoader()), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FormResult.Complete[i5];
    }
}
