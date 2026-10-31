package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzr extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzr> CREATOR = new w(13);
    public final boolean A;
    public final long B;
    public final int C;
    public final String D;
    public final int E;
    public final long F;
    public final String G;
    public final String H;
    public final long I;
    public final int J;
    public final long K;

    /* renamed from: f, reason: collision with root package name */
    public final String f33792f;

    /* renamed from: g, reason: collision with root package name */
    public final String f33793g;

    /* renamed from: h, reason: collision with root package name */
    public final String f33794h;

    /* renamed from: i, reason: collision with root package name */
    public final String f33795i;

    /* renamed from: j, reason: collision with root package name */
    public final long f33796j;

    /* renamed from: k, reason: collision with root package name */
    public final long f33797k;

    /* renamed from: l, reason: collision with root package name */
    public final String f33798l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f33799m;
    public final boolean n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final String f33800p;

    /* renamed from: q, reason: collision with root package name */
    public final long f33801q;

    /* renamed from: r, reason: collision with root package name */
    public final int f33802r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f33803s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f33804t;

    /* renamed from: u, reason: collision with root package name */
    public final Boolean f33805u;

    /* renamed from: v, reason: collision with root package name */
    public final long f33806v;

    /* renamed from: w, reason: collision with root package name */
    public final List f33807w;

    /* renamed from: x, reason: collision with root package name */
    public final String f33808x;

    /* renamed from: y, reason: collision with root package name */
    public final String f33809y;

    /* renamed from: z, reason: collision with root package name */
    public final String f33810z;

    public zzr(String str, String str2, String str3, long j11, String str4, long j12, long j13, String str5, boolean z11, boolean z12, String str6, long j14, int i5, boolean z13, boolean z14, Boolean bool, long j15, List list, String str7, String str8, String str9, boolean z15, long j16, int i11, String str10, int i12, long j17, String str11, String str12, long j18, int i13, long j19) {
        sg.w.e(str);
        this.f33792f = str;
        this.f33793g = true == TextUtils.isEmpty(str2) ? null : str2;
        this.f33794h = str3;
        this.o = j11;
        this.f33795i = str4;
        this.f33796j = j12;
        this.f33797k = j13;
        this.f33798l = str5;
        this.f33799m = z11;
        this.n = z12;
        this.f33800p = str6;
        this.f33801q = j14;
        this.f33802r = i5;
        this.f33803s = z13;
        this.f33804t = z14;
        this.f33805u = bool;
        this.f33806v = j15;
        this.f33807w = list;
        this.f33808x = str7;
        this.f33809y = str8;
        this.f33810z = str9;
        this.A = z15;
        this.B = j16;
        this.C = i11;
        this.D = str10;
        this.E = i12;
        this.F = j17;
        this.G = str11;
        this.H = str12;
        this.I = j18;
        this.J = i13;
        this.K = j19;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.c0(parcel, 2, this.f33792f);
        a.c0(parcel, 3, this.f33793g);
        a.c0(parcel, 4, this.f33794h);
        a.c0(parcel, 5, this.f33795i);
        a.i0(parcel, 6, 8);
        parcel.writeLong(this.f33796j);
        a.i0(parcel, 7, 8);
        parcel.writeLong(this.f33797k);
        a.c0(parcel, 8, this.f33798l);
        a.i0(parcel, 9, 4);
        parcel.writeInt(this.f33799m ? 1 : 0);
        a.i0(parcel, 10, 4);
        parcel.writeInt(this.n ? 1 : 0);
        a.i0(parcel, 11, 8);
        parcel.writeLong(this.o);
        a.c0(parcel, 12, this.f33800p);
        a.i0(parcel, 14, 8);
        parcel.writeLong(this.f33801q);
        a.i0(parcel, 15, 4);
        parcel.writeInt(this.f33802r);
        a.i0(parcel, 16, 4);
        parcel.writeInt(this.f33803s ? 1 : 0);
        a.i0(parcel, 18, 4);
        parcel.writeInt(this.f33804t ? 1 : 0);
        Boolean bool = this.f33805u;
        if (bool != null) {
            a.i0(parcel, 21, 4);
            parcel.writeInt(bool.booleanValue() ? 1 : 0);
        }
        a.i0(parcel, 22, 8);
        parcel.writeLong(this.f33806v);
        a.e0(parcel, this.f33807w, 23);
        a.c0(parcel, 25, this.f33808x);
        a.c0(parcel, 26, this.f33809y);
        a.c0(parcel, 27, this.f33810z);
        a.i0(parcel, 28, 4);
        parcel.writeInt(this.A ? 1 : 0);
        a.i0(parcel, 29, 8);
        parcel.writeLong(this.B);
        a.i0(parcel, 30, 4);
        parcel.writeInt(this.C);
        a.c0(parcel, 31, this.D);
        a.i0(parcel, 32, 4);
        parcel.writeInt(this.E);
        a.i0(parcel, 34, 8);
        parcel.writeLong(this.F);
        a.c0(parcel, 35, this.G);
        a.c0(parcel, 36, this.H);
        a.i0(parcel, 37, 8);
        parcel.writeLong(this.I);
        a.i0(parcel, 38, 4);
        parcel.writeInt(this.J);
        a.i0(parcel, 39, 8);
        parcel.writeLong(this.K);
        a.k0(parcel, iJ0);
    }

    public zzr(String str, String str2, String str3, String str4, long j11, long j12, String str5, boolean z11, boolean z12, long j13, String str6, long j14, int i5, boolean z13, boolean z14, Boolean bool, long j15, ArrayList arrayList, String str7, String str8, String str9, boolean z15, long j16, int i11, String str10, int i12, long j17, String str11, String str12, long j18, int i13, long j19) {
        this.f33792f = str;
        this.f33793g = str2;
        this.f33794h = str3;
        this.o = j13;
        this.f33795i = str4;
        this.f33796j = j11;
        this.f33797k = j12;
        this.f33798l = str5;
        this.f33799m = z11;
        this.n = z12;
        this.f33800p = str6;
        this.f33801q = j14;
        this.f33802r = i5;
        this.f33803s = z13;
        this.f33804t = z14;
        this.f33805u = bool;
        this.f33806v = j15;
        this.f33807w = arrayList;
        this.f33808x = str7;
        this.f33809y = str8;
        this.f33810z = str9;
        this.A = z15;
        this.B = j16;
        this.C = i11;
        this.D = str10;
        this.E = i12;
        this.F = j17;
        this.G = str11;
        this.H = str12;
        this.I = j18;
        this.J = i13;
        this.K = j19;
    }
}
