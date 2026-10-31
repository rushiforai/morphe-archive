package com.google.android.gms.common.internal;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;

/* loaded from: classes.dex */
public class RootTelemetryConfiguration extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RootTelemetryConfiguration> CREATOR = new d(16);

    /* renamed from: f, reason: collision with root package name */
    public final int f31859f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f31860g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f31861h;

    /* renamed from: i, reason: collision with root package name */
    public final int f31862i;

    /* renamed from: j, reason: collision with root package name */
    public final int f31863j;

    public RootTelemetryConfiguration(boolean z11, int i5, boolean z12, int i11, int i12) {
        this.f31859f = i5;
        this.f31860g = z11;
        this.f31861h = z12;
        this.f31862i = i11;
        this.f31863j = i12;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31859f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(this.f31860g ? 1 : 0);
        a.i0(parcel, 3, 4);
        parcel.writeInt(this.f31861h ? 1 : 0);
        a.i0(parcel, 4, 4);
        parcel.writeInt(this.f31862i);
        a.i0(parcel, 5, 4);
        parcel.writeInt(this.f31863j);
        a.k0(parcel, iJ0);
    }
}
