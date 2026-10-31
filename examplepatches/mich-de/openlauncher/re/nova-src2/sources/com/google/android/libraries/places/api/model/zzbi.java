package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzbi extends zzv {
    public static final Parcelable.Creator<zzbi> CREATOR = new zzbh();

    public zzbi(String str, int i5, int i11, String str2, String str3, AuthorAttributions authorAttributions) {
        super(str, i5, i11, str2, str3, authorAttributions);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(getAttributions());
        parcel.writeInt(getHeight());
        parcel.writeInt(getWidth());
        parcel.writeString(zzb());
        if (zza() == null) {
            parcel.writeInt(1);
        } else {
            parcel.writeInt(0);
            parcel.writeString(zza());
        }
        parcel.writeParcelable(getAuthorAttributions(), i5);
    }
}
