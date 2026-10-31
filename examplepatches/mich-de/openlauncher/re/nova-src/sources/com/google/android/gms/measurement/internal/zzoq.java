package com.google.android.gms.measurement.internal;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzoq extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzoq> CREATOR = new w(11);

    /* renamed from: f, reason: collision with root package name */
    public final List f33784f;

    public zzoq(ArrayList arrayList) {
        this.f33784f = arrayList;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.g0(parcel, this.f33784f, 1);
        a.k0(parcel, iJ0);
    }
}
