package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ChallengeRequestExecutor$Config((uv.e) parcel.readSerializable(), parcel.readString(), ChallengeRequestData.CREATOR.createFromParcel(parcel), parcel.readString(), ChallengeRequestExecutor$Config.Keys.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ChallengeRequestExecutor$Config[i5];
    }
}
