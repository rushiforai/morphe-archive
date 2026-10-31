package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;

/* loaded from: classes3.dex */
public final class zzaf extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzaf> CREATOR = new w(3);

    /* renamed from: f, reason: collision with root package name */
    public final long f33754f;

    /* renamed from: g, reason: collision with root package name */
    public final int f33755g;

    /* renamed from: h, reason: collision with root package name */
    public final long f33756h;

    public zzaf(long j11, int i5, long j12) {
        this.f33754f = j11;
        this.f33755g = i5;
        this.f33756h = j12;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 8);
        parcel.writeLong(this.f33754f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(this.f33755g);
        a.i0(parcel, 3, 8);
        parcel.writeLong(this.f33756h);
        a.k0(parcel, iJ0);
    }
}
