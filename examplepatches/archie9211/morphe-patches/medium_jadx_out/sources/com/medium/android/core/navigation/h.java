package com.medium.android.core.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.core.navigation.PublicationStatsReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        parcel.getClass();
        return new PublicationStatsReference.PubBySlug(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        return new PublicationStatsReference.PubBySlug[i];
    }
}
