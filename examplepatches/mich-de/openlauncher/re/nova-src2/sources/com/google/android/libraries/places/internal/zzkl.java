package com.google.android.libraries.places.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

/* loaded from: classes3.dex */
final class zzkl implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final /* bridge */ /* synthetic */ Object createFromParcel(Parcel parcel) {
        AutocompleteActivityMode autocompleteActivityMode = (AutocompleteActivityMode) parcel.readParcelable(zzkt.class.getClassLoader());
        zznx zznxVarZzj = zznx.zzj(parcel.readArrayList(Place.Field.class.getClassLoader()));
        zzkr zzkrVar = (zzkr) parcel.readParcelable(zzkt.class.getClassLoader());
        String string = parcel.readInt() == 0 ? parcel.readString() : null;
        String string2 = parcel.readInt() == 0 ? parcel.readString() : null;
        LocationBias locationBias = (LocationBias) parcel.readParcelable(zzkt.class.getClassLoader());
        LocationRestriction locationRestriction = (LocationRestriction) parcel.readParcelable(zzkt.class.getClassLoader());
        zznx zznxVarZzj2 = zznx.zzj(parcel.readArrayList(String.class.getClassLoader()));
        TypeFilter typeFilter = (TypeFilter) parcel.readParcelable(zzkt.class.getClassLoader());
        zznx zznxVarZzj3 = zznx.zzj(parcel.readArrayList(String.class.getClassLoader()));
        String string3 = null;
        int i5 = parcel.readInt();
        String str = string2;
        int i11 = parcel.readInt();
        if (parcel.readInt() == 0) {
            string3 = parcel.readString();
        }
        return new zzkm(autocompleteActivityMode, zznxVarZzj, zzkrVar, string, str, locationBias, locationRestriction, zznxVarZzj2, typeFilter, zznxVarZzj3, i5, i11, string3);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ Object[] newArray(int i5) {
        return new zzkm[i5];
    }
}
