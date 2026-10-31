package com.google.android.exoplayer2.metadata.dvbsi;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.exoplayer2.metadata.Metadata;
import ww.c;

/* loaded from: classes3.dex */
public final class AppInfoTable implements Metadata.Entry {
    public static final Parcelable.Creator<AppInfoTable> CREATOR = new c(22);

    /* renamed from: a, reason: collision with root package name */
    public final int f31477a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31478b;

    public AppInfoTable(int i5, String str) {
        this.f31477a = i5;
        this.f31478b = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Ait(controlCode=");
        sb2.append(this.f31477a);
        sb2.append(",url=");
        return c0.q(sb2, this.f31478b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31478b);
        parcel.writeInt(this.f31477a);
    }
}
