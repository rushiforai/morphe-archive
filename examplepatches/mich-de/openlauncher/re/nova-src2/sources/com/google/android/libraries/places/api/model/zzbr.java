package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzbr implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final /* bridge */ /* synthetic */ Object createFromParcel(Parcel parcel) {
        String string = parcel.readInt() == 0 ? parcel.readString() : null;
        String string2 = parcel.readInt() == 0 ? parcel.readString() : null;
        String string3 = parcel.readInt() == 0 ? parcel.readString() : null;
        String string4 = parcel.readInt() == 0 ? parcel.readString() : null;
        String string5 = parcel.readInt() == 0 ? parcel.readString() : null;
        Double dValueOf = Double.valueOf(parcel.readDouble());
        AuthorAttribution authorAttribution = (AuthorAttribution) parcel.readParcelable(Review.class.getClassLoader());
        String string6 = null;
        String str = string2;
        String str2 = string3;
        String str3 = string4;
        String str4 = string5;
        String string7 = parcel.readString();
        if (parcel.readInt() == 0) {
            string6 = parcel.readString();
        }
        return new zzbs(string, str, str2, str3, str4, dValueOf, authorAttribution, string7, string6);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ Object[] newArray(int i5) {
        return new zzbs[i5];
    }
}
