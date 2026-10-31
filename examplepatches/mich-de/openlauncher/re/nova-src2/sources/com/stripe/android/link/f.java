package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkActivityResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkActivityResult.Canceled(g.valueOf(parcel.readString()), (LinkAccountUpdate) parcel.readParcelable(LinkActivityResult.Canceled.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkActivityResult.Canceled[i5];
    }
}
