package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ConsumerSession.VerificationSession(ConsumerSession.VerificationSession.SessionType.CREATOR.createFromParcel(parcel), ConsumerSession.VerificationSession.SessionState.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsumerSession.VerificationSession[i5];
    }
}
