package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.maps.model.LatLng;

/* loaded from: classes3.dex */
final class zzbq extends zzac {
    public static final Parcelable.Creator<zzbq> CREATOR = new zzbp();

    public zzbq(LatLng latLng, LatLng latLng2) {
        super(latLng, latLng2);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(getSouthwest(), i5);
        parcel.writeParcelable(getNortheast(), i5);
    }
}
