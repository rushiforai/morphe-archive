package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;

/* loaded from: classes.dex */
public final class zzdb extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzdb> CREATOR = new aa.d(7);

    /* renamed from: f, reason: collision with root package name */
    public final long f33303f;

    /* renamed from: g, reason: collision with root package name */
    public final long f33304g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f33305h;

    /* renamed from: i, reason: collision with root package name */
    public final Bundle f33306i;

    /* renamed from: j, reason: collision with root package name */
    public final String f33307j;

    public zzdb(long j11, long j12, boolean z11, Bundle bundle, String str) {
        this.f33303f = j11;
        this.f33304g = j12;
        this.f33305h = z11;
        this.f33306i = bundle;
        this.f33307j = str;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 8);
        parcel.writeLong(this.f33303f);
        fg.a.i0(parcel, 2, 8);
        parcel.writeLong(this.f33304g);
        fg.a.i0(parcel, 3, 4);
        parcel.writeInt(this.f33305h ? 1 : 0);
        fg.a.U(parcel, 7, this.f33306i);
        fg.a.c0(parcel, 8, this.f33307j);
        fg.a.k0(parcel, iJ0);
    }
}
