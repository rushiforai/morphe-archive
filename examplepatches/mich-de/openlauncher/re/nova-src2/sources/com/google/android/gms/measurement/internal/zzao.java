package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;

/* loaded from: classes3.dex */
public final class zzao extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzao> CREATOR = new w(5);

    /* renamed from: f, reason: collision with root package name */
    public final Bundle f33766f;

    public zzao(Bundle bundle) {
        this.f33766f = bundle;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.U(parcel, 1, this.f33766f);
        a.k0(parcel, iJ0);
    }
}
