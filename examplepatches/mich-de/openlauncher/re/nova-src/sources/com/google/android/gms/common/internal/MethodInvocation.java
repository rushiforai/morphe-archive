package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import nv.f;

/* loaded from: classes3.dex */
public class MethodInvocation extends AbstractSafeParcelable {
    public static final Parcelable.Creator<MethodInvocation> CREATOR = new f(22);

    /* renamed from: f, reason: collision with root package name */
    public final int f31851f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31852g;

    /* renamed from: h, reason: collision with root package name */
    public final int f31853h;

    /* renamed from: i, reason: collision with root package name */
    public final long f31854i;

    /* renamed from: j, reason: collision with root package name */
    public final long f31855j;

    /* renamed from: k, reason: collision with root package name */
    public final String f31856k;

    /* renamed from: l, reason: collision with root package name */
    public final String f31857l;

    /* renamed from: m, reason: collision with root package name */
    public final int f31858m;
    public final int n;

    public MethodInvocation(int i5, int i11, int i12, long j11, long j12, String str, String str2, int i13, int i14) {
        this.f31851f = i5;
        this.f31852g = i11;
        this.f31853h = i12;
        this.f31854i = j11;
        this.f31855j = j12;
        this.f31856k = str;
        this.f31857l = str2;
        this.f31858m = i13;
        this.n = i14;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31851f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(this.f31852g);
        a.i0(parcel, 3, 4);
        parcel.writeInt(this.f31853h);
        a.i0(parcel, 4, 8);
        parcel.writeLong(this.f31854i);
        a.i0(parcel, 5, 8);
        parcel.writeLong(this.f31855j);
        a.c0(parcel, 6, this.f31856k);
        a.c0(parcel, 7, this.f31857l);
        a.i0(parcel, 8, 4);
        parcel.writeInt(this.f31858m);
        a.i0(parcel, 9, 4);
        parcel.writeInt(this.n);
        a.k0(parcel, iJ0);
    }
}
