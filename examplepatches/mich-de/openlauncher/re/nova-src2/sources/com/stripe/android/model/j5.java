package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.SourceTypeModel;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j5 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new SourceTypeModel.Card(parcel.readString(), parcel.readString(), ft.b.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : ft.c.valueOf(parcel.readString()), parcel.readString(), parcel.readInt() != 0 ? ft.u0.valueOf(parcel.readString()) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SourceTypeModel.Card[i5];
    }
}
