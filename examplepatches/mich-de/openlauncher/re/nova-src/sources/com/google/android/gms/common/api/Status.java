package com.google.android.gms.common.api;

import aa.d;
import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.Arrays;
import og.i;
import qg.k;
import sg.w;

/* loaded from: classes.dex */
public final class Status extends AbstractSafeParcelable implements k, ReflectedParcelable {

    /* renamed from: f, reason: collision with root package name */
    public final int f31810f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31811g;

    /* renamed from: h, reason: collision with root package name */
    public final PendingIntent f31812h;

    /* renamed from: i, reason: collision with root package name */
    public final ConnectionResult f31813i;

    /* renamed from: j, reason: collision with root package name */
    public static final Status f31806j = new Status(0, null, null, null);

    /* renamed from: k, reason: collision with root package name */
    public static final Status f31807k = new Status(14, null, null, null);

    /* renamed from: l, reason: collision with root package name */
    public static final Status f31808l = new Status(8, null, null, null);

    /* renamed from: m, reason: collision with root package name */
    public static final Status f31809m = new Status(15, null, null, null);
    public static final Status n = new Status(16, null, null, null);
    public static final Parcelable.Creator<Status> CREATOR = new d(15);

    public Status(int i5, String str, PendingIntent pendingIntent, ConnectionResult connectionResult) {
        this.f31810f = i5;
        this.f31811g = str;
        this.f31812h = pendingIntent;
        this.f31813i = connectionResult;
    }

    public final boolean d() {
        return this.f31810f <= 0;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Status)) {
            return false;
        }
        Status status = (Status) obj;
        return this.f31810f == status.f31810f && w.k(this.f31811g, status.f31811g) && w.k(this.f31812h, status.f31812h) && w.k(this.f31813i, status.f31813i);
    }

    @Override // qg.k
    public final Status h() {
        return this;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f31810f), this.f31811g, this.f31812h, this.f31813i});
    }

    public final String toString() {
        i iVar = new i(this);
        String statusCodeString = this.f31811g;
        if (statusCodeString == null) {
            statusCodeString = qg.d.getStatusCodeString(this.f31810f);
        }
        iVar.c(statusCodeString, "statusCode");
        iVar.c(this.f31812h, "resolution");
        return iVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31810f);
        a.c0(parcel, 2, this.f31811g);
        a.b0(parcel, 3, this.f31812h, i5);
        a.b0(parcel, 4, this.f31813i, i5);
        a.k0(parcel, iJ0);
    }
}
