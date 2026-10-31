package com.google.android.gms.measurement.internal;

import ab.w;
import ai.n4;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;

/* loaded from: classes3.dex */
public final class zzpl extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzpl> CREATOR = new w(12);

    /* renamed from: f, reason: collision with root package name */
    public final int f33785f;

    /* renamed from: g, reason: collision with root package name */
    public final String f33786g;

    /* renamed from: h, reason: collision with root package name */
    public final long f33787h;

    /* renamed from: i, reason: collision with root package name */
    public final Long f33788i;

    /* renamed from: j, reason: collision with root package name */
    public final String f33789j;

    /* renamed from: k, reason: collision with root package name */
    public final String f33790k;

    /* renamed from: l, reason: collision with root package name */
    public final Double f33791l;

    public zzpl(int i5, String str, long j11, Long l9, Float f11, String str2, String str3, Double d5) {
        this.f33785f = i5;
        this.f33786g = str;
        this.f33787h = j11;
        this.f33788i = l9;
        this.f33791l = i5 == 1 ? f11 != null ? Double.valueOf(f11.doubleValue()) : null : d5;
        this.f33789j = str2;
        this.f33790k = str3;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        w.b(this, parcel);
    }

    public final Object zza() {
        Long l9 = this.f33788i;
        if (l9 != null) {
            return l9;
        }
        Double d5 = this.f33791l;
        if (d5 != null) {
            return d5;
        }
        String str = this.f33789j;
        if (str != null) {
            return str;
        }
        return null;
    }

    public zzpl(long j11, Object obj, String str, String str2) {
        sg.w.e(str);
        this.f33785f = 2;
        this.f33786g = str;
        this.f33787h = j11;
        this.f33790k = str2;
        if (obj == null) {
            this.f33788i = null;
            this.f33791l = null;
            this.f33789j = null;
            return;
        }
        if (obj instanceof Long) {
            this.f33788i = (Long) obj;
            this.f33791l = null;
            this.f33789j = null;
        } else if (obj instanceof String) {
            this.f33788i = null;
            this.f33791l = null;
            this.f33789j = (String) obj;
        } else {
            if (obj instanceof Double) {
                this.f33788i = null;
                this.f33791l = (Double) obj;
                this.f33789j = null;
                return;
            }
            throw new IllegalArgumentException("User attribute given of un-supported type");
        }
    }

    public zzpl(n4 n4Var) {
        this(n4Var.f13183d, n4Var.f13184e, n4Var.f13182c, n4Var.f13181b);
    }
}
