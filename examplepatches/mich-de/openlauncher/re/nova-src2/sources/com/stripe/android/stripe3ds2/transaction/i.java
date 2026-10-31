package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ChallengeRequestExecutor$Config.Keys(parcel.createByteArray(), parcel.createByteArray());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ChallengeRequestExecutor$Config.Keys[i5];
    }
}
