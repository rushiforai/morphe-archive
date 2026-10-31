package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAppearance;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Parcelable.Creator<LinkAppearance.Colors> creator = LinkAppearance.Colors.CREATOR;
        return new LinkAppearance(creator.createFromParcel(parcel), creator.createFromParcel(parcel), LinkAppearance.Style.CREATOR.createFromParcel(parcel), LinkAppearance.PrimaryButton.CREATOR.createFromParcel(parcel));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkAppearance[i5];
    }
}
