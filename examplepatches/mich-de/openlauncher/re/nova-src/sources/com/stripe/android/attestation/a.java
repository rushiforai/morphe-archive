package com.stripe.android.attestation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.attestation.AttestationActivityResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AttestationActivityResult.Failed((Throwable) parcel.readSerializable());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AttestationActivityResult.Failed[i5];
    }
}
