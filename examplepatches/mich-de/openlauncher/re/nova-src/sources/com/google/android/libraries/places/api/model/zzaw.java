package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.ParcelUuid;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzaw extends zzk {
    public static final Parcelable.Creator<zzaw> CREATOR = new zzav();

    public zzaw(ParcelUuid parcelUuid) {
        super(parcelUuid);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(zza(), i5);
    }
}
