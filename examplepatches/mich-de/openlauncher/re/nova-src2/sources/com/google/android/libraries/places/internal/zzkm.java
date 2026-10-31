package com.google.android.libraries.places.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

/* loaded from: classes3.dex */
final class zzkm extends zzkk {
    public static final Parcelable.Creator<zzkm> CREATOR = new zzkl();

    public zzkm(AutocompleteActivityMode autocompleteActivityMode, zznx zznxVar, zzkr zzkrVar, String str, String str2, LocationBias locationBias, LocationRestriction locationRestriction, zznx zznxVar2, TypeFilter typeFilter, zznx zznxVar3, int i5, int i11, String str3) {
        super(autocompleteActivityMode, zznxVar, zzkrVar, str, str2, locationBias, locationRestriction, zznxVar2, typeFilter, zznxVar3, i5, i11, str3);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(zzh(), i5);
        parcel.writeList(zzj());
        parcel.writeParcelable(zzf(), i5);
        if (zzm() == null) {
            parcel.writeInt(1);
        } else {
            parcel.writeInt(0);
            parcel.writeString(zzm());
        }
        if (zzl() == null) {
            parcel.writeInt(1);
        } else {
            parcel.writeInt(0);
            parcel.writeString(zzl());
        }
        parcel.writeParcelable(zzc(), i5);
        parcel.writeParcelable(zzd(), i5);
        parcel.writeList(zzi());
        parcel.writeParcelable(zze(), i5);
        parcel.writeList(zzk());
        parcel.writeInt(zza());
        parcel.writeInt(zzb());
        if (zzn() == null) {
            parcel.writeInt(1);
        } else {
            parcel.writeInt(0);
            parcel.writeString(zzn());
        }
    }
}
