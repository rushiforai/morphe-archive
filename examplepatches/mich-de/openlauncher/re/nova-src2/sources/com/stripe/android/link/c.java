package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.model.LinkAccount;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkAccountUpdate.Value(parcel.readInt() == 0 ? null : LinkAccount.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? d.valueOf(parcel.readString()) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkAccountUpdate.Value[i5];
    }
}
