package com.android.launcher3.util;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import ww.c;

/* loaded from: classes2.dex */
public class ActivityResultInfo implements Parcelable {
    public static final Parcelable.Creator<ActivityResultInfo> CREATOR = new c(18);

    /* renamed from: a, reason: collision with root package name */
    public final int f21248a;

    /* renamed from: b, reason: collision with root package name */
    public final int f21249b;

    /* renamed from: c, reason: collision with root package name */
    public final Intent f21250c;

    public ActivityResultInfo(int i5, int i11, Intent intent) {
        this.f21248a = i5;
        this.f21249b = i11;
        this.f21250c = intent;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f21248a);
        parcel.writeInt(this.f21249b);
        Intent intent = this.f21250c;
        if (intent == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            intent.writeToParcel(parcel, i5);
        }
    }

    public ActivityResultInfo(Parcel parcel) {
        this.f21248a = parcel.readInt();
        this.f21249b = parcel.readInt();
        this.f21250c = parcel.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(parcel) : null;
    }
}
