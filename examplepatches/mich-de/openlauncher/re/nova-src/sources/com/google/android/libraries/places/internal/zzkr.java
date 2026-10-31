package com.google.android.libraries.places.internal;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
public enum zzkr implements Parcelable {
    FRAGMENT,
    INTENT;

    public static final Parcelable.Creator<zzkr> CREATOR = new Parcelable.Creator() { // from class: com.google.android.libraries.places.internal.zzkq
        @Override // android.os.Parcelable.Creator
        public final /* bridge */ /* synthetic */ Object createFromParcel(Parcel parcel) {
            String string = parcel.readString();
            string.getClass();
            return (zzkr) Enum.valueOf(zzkr.class, string);
        }

        @Override // android.os.Parcelable.Creator
        public final /* synthetic */ Object[] newArray(int i5) {
            return new zzkr[i5];
        }
    };

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(name());
    }
}
