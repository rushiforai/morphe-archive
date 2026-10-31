package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.view.CardBrandView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CardBrandView.SavedState(parcel.readParcelable(CardBrandView.SavedState.class.getClassLoader()), CardBrandView.State.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CardBrandView.SavedState[i5];
    }
}
