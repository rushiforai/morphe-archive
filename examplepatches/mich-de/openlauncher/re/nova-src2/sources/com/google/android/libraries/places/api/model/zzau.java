package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzau extends zzj {
    public static final Parcelable.Creator<zzau> CREATOR = new zzat();

    public zzau(int i5, int i11) {
        super(i5, i11);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(zzb());
        parcel.writeInt(zza());
    }
}
