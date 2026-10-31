package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.state.LinkSignupModeResult;
import kotlin.jvm.internal.Intrinsics;
import rs.a0;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkSignupModeResult.Enabled(a0.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkSignupModeResult.Enabled[i5];
    }
}
