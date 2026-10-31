package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.view.CountryTextInputLayout;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CountryTextInputLayout.SelectedCountryState((CountryCode) parcel.readParcelable(CountryTextInputLayout.SelectedCountryState.class.getClassLoader()), parcel.readParcelable(CountryTextInputLayout.SelectedCountryState.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CountryTextInputLayout.SelectedCountryState[i5];
    }
}
