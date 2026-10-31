package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.maps.model.LatLng;

/* loaded from: classes3.dex */
final class zzay extends zzl {
    public static final Parcelable.Creator<zzay> CREATOR = new zzax();

    public zzay(LatLng latLng, double d5) {
        super(latLng, d5);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(getCenter(), i5);
        parcel.writeDouble(getRadius());
    }
}
