package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzbm extends zzy {
    public static final Parcelable.Creator<zzbm> CREATOR = new zzbl();

    public zzbm(Place place, double d5) {
        super(place, d5);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(getPlace(), i5);
        parcel.writeDouble(getLikelihood());
    }
}
