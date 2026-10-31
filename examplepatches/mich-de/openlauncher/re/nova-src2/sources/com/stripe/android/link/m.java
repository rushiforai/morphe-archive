package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAppearance;
import i2.r0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkAppearance.Colors(r0.b(parcel.readInt()), r0.b(parcel.readInt()), r0.b(parcel.readInt()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkAppearance.Colors[i5];
    }
}
