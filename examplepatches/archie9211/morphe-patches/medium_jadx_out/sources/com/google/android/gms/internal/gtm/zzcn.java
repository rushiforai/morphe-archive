package com.google.android.gms.internal.gtm;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzcn implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    @Deprecated
    public final /* synthetic */ Object createFromParcel(Parcel parcel) {
        return new zzco(parcel);
    }

    @Override // android.os.Parcelable.Creator
    @Deprecated
    public final /* synthetic */ Object[] newArray(int i) {
        return new zzco[i];
    }
}
