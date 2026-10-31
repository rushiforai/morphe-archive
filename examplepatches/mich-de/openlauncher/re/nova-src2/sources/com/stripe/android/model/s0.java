package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.DeferredIntentParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new DeferredIntentParams((DeferredIntentParams.Mode) parcel.readParcelable(DeferredIntentParams.class.getClassLoader()), parcel.createStringArrayList(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new DeferredIntentParams[i5];
    }
}
