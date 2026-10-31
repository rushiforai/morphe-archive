package com.google.android.gms.common.internal;

import aa.d;
import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import sg.a;

/* loaded from: classes.dex */
public class GetServiceRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GetServiceRequest> CREATOR = new d(18);

    /* renamed from: t, reason: collision with root package name */
    public static final Scope[] f31837t = new Scope[0];

    /* renamed from: u, reason: collision with root package name */
    public static final Feature[] f31838u = new Feature[0];

    /* renamed from: f, reason: collision with root package name */
    public final int f31839f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31840g;

    /* renamed from: h, reason: collision with root package name */
    public final int f31841h;

    /* renamed from: i, reason: collision with root package name */
    public String f31842i;

    /* renamed from: j, reason: collision with root package name */
    public IBinder f31843j;

    /* renamed from: k, reason: collision with root package name */
    public Scope[] f31844k;

    /* renamed from: l, reason: collision with root package name */
    public Bundle f31845l;

    /* renamed from: m, reason: collision with root package name */
    public Account f31846m;
    public Feature[] n;
    public Feature[] o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f31847p;

    /* renamed from: q, reason: collision with root package name */
    public final int f31848q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f31849r;

    /* renamed from: s, reason: collision with root package name */
    public final String f31850s;

    public GetServiceRequest(int i5, int i11, int i12, String str, IBinder iBinder, Scope[] scopeArr, Bundle bundle, Account account, Feature[] featureArr, Feature[] featureArr2, boolean z11, int i13, boolean z12, String str2) {
        scopeArr = scopeArr == null ? f31837t : scopeArr;
        bundle = bundle == null ? new Bundle() : bundle;
        Feature[] featureArr3 = f31838u;
        featureArr = featureArr == null ? featureArr3 : featureArr;
        featureArr2 = featureArr2 == null ? featureArr3 : featureArr2;
        this.f31839f = i5;
        this.f31840g = i11;
        this.f31841h = i12;
        if ("com.google.android.gms".equals(str)) {
            this.f31842i = "com.google.android.gms";
        } else {
            this.f31842i = str;
        }
        if (i5 < 2) {
            this.f31846m = iBinder != null ? a.V(a.U(iBinder)) : null;
        } else {
            this.f31843j = iBinder;
            this.f31846m = account;
        }
        this.f31844k = scopeArr;
        this.f31845l = bundle;
        this.n = featureArr;
        this.o = featureArr2;
        this.f31847p = z11;
        this.f31848q = i13;
        this.f31849r = z12;
        this.f31850s = str2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        d.a(this, parcel, i5);
    }
}
