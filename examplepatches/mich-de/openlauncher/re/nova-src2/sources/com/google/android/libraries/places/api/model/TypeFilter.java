package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;

@Deprecated
/* loaded from: classes3.dex */
public enum TypeFilter implements Parcelable {
    ADDRESS,
    CITIES,
    ESTABLISHMENT,
    GEOCODE,
    REGIONS;


    @RecentlyNonNull
    public static final Parcelable.Creator<TypeFilter> CREATOR = new Parcelable.Creator() { // from class: com.google.android.libraries.places.api.model.zzck
        @Override // android.os.Parcelable.Creator
        public final /* bridge */ /* synthetic */ Object createFromParcel(Parcel parcel) {
            String string = parcel.readString();
            string.getClass();
            return TypeFilter.valueOf(string);
        }

        @Override // android.os.Parcelable.Creator
        public final /* synthetic */ Object[] newArray(int i5) {
            return new TypeFilter[i5];
        }
    };

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@RecentlyNonNull Parcel parcel, int i5) {
        parcel.writeString(name());
    }
}
