package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.view.CardNumberEditText;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CardNumberEditText.SavedState(parcel.readParcelable(CardNumberEditText.SavedState.class.getClassLoader()), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CardNumberEditText.SavedState[i5];
    }
}
