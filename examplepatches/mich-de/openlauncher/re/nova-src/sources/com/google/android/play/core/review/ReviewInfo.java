package com.google.android.play.core.review;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"RestrictedApi"})
/* loaded from: classes3.dex */
public abstract class ReviewInfo implements Parcelable {
    public static final Parcelable.Creator<ReviewInfo> CREATOR = new a();

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        zza zzaVar = (zza) this;
        parcel.writeParcelable(zzaVar.f34561a, 0);
        parcel.writeInt(zzaVar.f34562b ? 1 : 0);
    }
}
