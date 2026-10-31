package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;

/* loaded from: classes3.dex */
public final class zzah extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzah> CREATOR = new w(4);

    /* renamed from: f, reason: collision with root package name */
    public String f33757f;

    /* renamed from: g, reason: collision with root package name */
    public String f33758g;

    /* renamed from: h, reason: collision with root package name */
    public zzpl f33759h;

    /* renamed from: i, reason: collision with root package name */
    public long f33760i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f33761j;

    /* renamed from: k, reason: collision with root package name */
    public String f33762k;

    /* renamed from: l, reason: collision with root package name */
    public final zzbh f33763l;

    /* renamed from: m, reason: collision with root package name */
    public long f33764m;
    public zzbh n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final zzbh f33765p;

    public zzah(zzah zzahVar) {
        sg.w.h(zzahVar);
        this.f33757f = zzahVar.f33757f;
        this.f33758g = zzahVar.f33758g;
        this.f33759h = zzahVar.f33759h;
        this.f33760i = zzahVar.f33760i;
        this.f33761j = zzahVar.f33761j;
        this.f33762k = zzahVar.f33762k;
        this.f33763l = zzahVar.f33763l;
        this.f33764m = zzahVar.f33764m;
        this.n = zzahVar.n;
        this.o = zzahVar.o;
        this.f33765p = zzahVar.f33765p;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.c0(parcel, 2, this.f33757f);
        a.c0(parcel, 3, this.f33758g);
        a.b0(parcel, 4, this.f33759h, i5);
        long j11 = this.f33760i;
        a.i0(parcel, 5, 8);
        parcel.writeLong(j11);
        boolean z11 = this.f33761j;
        a.i0(parcel, 6, 4);
        parcel.writeInt(z11 ? 1 : 0);
        a.c0(parcel, 7, this.f33762k);
        a.b0(parcel, 8, this.f33763l, i5);
        long j12 = this.f33764m;
        a.i0(parcel, 9, 8);
        parcel.writeLong(j12);
        a.b0(parcel, 10, this.n, i5);
        a.i0(parcel, 11, 8);
        parcel.writeLong(this.o);
        a.b0(parcel, 12, this.f33765p, i5);
        a.k0(parcel, iJ0);
    }

    public zzah(String str, String str2, zzpl zzplVar, long j11, boolean z11, String str3, zzbh zzbhVar, long j12, zzbh zzbhVar2, long j13, zzbh zzbhVar3) {
        this.f33757f = str;
        this.f33758g = str2;
        this.f33759h = zzplVar;
        this.f33760i = j11;
        this.f33761j = z11;
        this.f33762k = str3;
        this.f33763l = zzbhVar;
        this.f33764m = j12;
        this.n = zzbhVar2;
        this.o = j13;
        this.f33765p = zzbhVar3;
    }
}
