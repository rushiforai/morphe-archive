package com.stripe.android.paymentelement.embedded.form;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.embedded.form.FormResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return FormResult.Cancelled.f44210a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new FormResult.Cancelled[i5];
    }
}
