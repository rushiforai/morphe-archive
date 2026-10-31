package com.stripe.android.challenge.passive;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.challenge.passive.PassiveChallengeActivityResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PassiveChallengeActivityResult.Failed((Throwable) parcel.readSerializable());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PassiveChallengeActivityResult.Failed[i5];
    }
}
