package com.stripe.android.link.ui.inline;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.ui.inline.UserInput;
import kotlin.jvm.internal.Intrinsics;
import rs.b0;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new UserInput.SignUp(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), b0.valueOf(parcel.readString()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new UserInput.SignUp[i5];
    }
}
