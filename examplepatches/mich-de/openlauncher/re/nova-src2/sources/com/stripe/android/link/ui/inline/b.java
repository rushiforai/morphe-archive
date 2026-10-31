package com.stripe.android.link.ui.inline;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.ui.inline.UserInput;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new UserInput.SignIn(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new UserInput.SignIn[i5];
    }
}
