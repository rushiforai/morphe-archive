package com.google.android.libraries.places.api.model;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;

/* loaded from: classes3.dex */
public enum DayOfWeek implements Parcelable {
    SUNDAY,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY;


    @RecentlyNonNull
    public static final Parcelable.Creator<DayOfWeek> CREATOR = new Parcelable.Creator() { // from class: com.google.android.libraries.places.api.model.zzbz
        @Override // android.os.Parcelable.Creator
        public final /* synthetic */ Object createFromParcel(Parcel parcel) {
            DayOfWeek dayOfWeek = DayOfWeek.SUNDAY;
            String string = parcel.readString();
            string.getClass();
            return DayOfWeek.valueOf(string);
        }

        @Override // android.os.Parcelable.Creator
        public final /* synthetic */ Object[] newArray(int i5) {
            return new DayOfWeek[i5];
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
