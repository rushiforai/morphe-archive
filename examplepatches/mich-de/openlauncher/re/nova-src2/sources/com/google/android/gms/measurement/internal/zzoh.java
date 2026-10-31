package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;

/* loaded from: classes3.dex */
public final class zzoh extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzoh> CREATOR = new w(8);

    /* renamed from: f, reason: collision with root package name */
    public final String f33773f;

    /* renamed from: g, reason: collision with root package name */
    public final long f33774g;

    /* renamed from: h, reason: collision with root package name */
    public final int f33775h;

    public zzoh(String str, long j11, int i5) {
        this.f33773f = str;
        this.f33774g = j11;
        this.f33775h = i5;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.c0(parcel, 1, this.f33773f);
        a.i0(parcel, 2, 8);
        parcel.writeLong(this.f33774g);
        a.i0(parcel, 3, 4);
        parcel.writeInt(this.f33775h);
        a.k0(parcel, iJ0);
    }
}
