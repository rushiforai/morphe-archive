package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
final class zzbu extends zzag {
    public static final Parcelable.Creator<zzbu> CREATOR = new zzbt();

    public zzbu(LocalDate localDate, boolean z11) {
        super(localDate, z11);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(getDate(), i5);
        parcel.writeInt(isExceptional() ? 1 : 0);
    }
}
