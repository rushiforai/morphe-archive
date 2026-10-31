package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.view.StripeEditText;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new StripeEditText.StripeEditTextState(parcel.readParcelable(StripeEditText.StripeEditTextState.class.getClassLoader()), parcel.readString(), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new StripeEditText.StripeEditTextState[i5];
    }
}
