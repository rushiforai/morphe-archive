package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;

/* loaded from: classes3.dex */
public final class zzbh extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzbh> CREATOR = new w(7);

    /* renamed from: f, reason: collision with root package name */
    public final String f33768f;

    /* renamed from: g, reason: collision with root package name */
    public final zzbf f33769g;

    /* renamed from: h, reason: collision with root package name */
    public final String f33770h;

    /* renamed from: i, reason: collision with root package name */
    public final long f33771i;

    /* renamed from: j, reason: collision with root package name */
    public final long f33772j;

    public zzbh(zzbh zzbhVar, long j11, long j12) {
        sg.w.h(zzbhVar);
        this.f33768f = zzbhVar.f33768f;
        this.f33769g = zzbhVar.f33769g;
        this.f33770h = zzbhVar.f33770h;
        this.f33771i = j11;
        this.f33772j = j12;
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.f33769g);
        String str = this.f33770h;
        int length = String.valueOf(str).length();
        String str2 = this.f33768f;
        StringBuilder sb2 = new StringBuilder(length + 13 + String.valueOf(str2).length() + 8 + strValueOf.length());
        c0.D(sb2, "origin=", str, ",name=", str2);
        return c0.q(sb2, ",params=", strValueOf);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        w.a(this, parcel, i5);
    }

    public zzbh(String str, zzbf zzbfVar, String str2, long j11, long j12) {
        this.f33768f = str;
        this.f33769g = zzbfVar;
        this.f33770h = str2;
        this.f33771i = j11;
        this.f33772j = j12;
    }
}
