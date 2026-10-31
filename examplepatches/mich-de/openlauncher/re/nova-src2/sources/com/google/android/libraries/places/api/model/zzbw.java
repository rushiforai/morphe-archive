package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzbw extends zzai {
    public static final Parcelable.Creator<zzbw> CREATOR = new zzbv();

    public zzbw(LocalDate localDate, DayOfWeek dayOfWeek, LocalTime localTime, boolean z11) {
        super(localDate, dayOfWeek, localTime, z11);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(getDate(), i5);
        parcel.writeParcelable(getDay(), i5);
        parcel.writeParcelable(getTime(), i5);
        parcel.writeInt(isTruncated() ? 1 : 0);
    }
}
