package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.Arrays;
import og.i;
import sg.w;
import ww.c;

/* loaded from: classes3.dex */
public final class LatLngBounds extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<LatLngBounds> CREATOR = new c(3);

    /* renamed from: f, reason: collision with root package name */
    public final LatLng f33744f;

    /* renamed from: g, reason: collision with root package name */
    public final LatLng f33745g;

    public LatLngBounds(LatLng latLng, LatLng latLng2) {
        w.i(latLng, "southwest must not be null.");
        w.i(latLng2, "northeast must not be null.");
        double d5 = latLng2.f33742f;
        double d11 = latLng.f33742f;
        w.b("southern latitude exceeds northern latitude (%s > %s)", new Object[]{Double.valueOf(d11), Double.valueOf(d5)}, d5 >= d11);
        this.f33744f = latLng;
        this.f33745g = latLng2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LatLngBounds)) {
            return false;
        }
        LatLngBounds latLngBounds = (LatLngBounds) obj;
        return this.f33744f.equals(latLngBounds.f33744f) && this.f33745g.equals(latLngBounds.f33745g);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f33744f, this.f33745g});
    }

    public final String toString() {
        i iVar = new i(this);
        iVar.c(this.f33744f, "southwest");
        iVar.c(this.f33745g, "northeast");
        return iVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.b0(parcel, 2, this.f33744f, i5);
        a.b0(parcel, 3, this.f33745g, i5);
        a.k0(parcel, iJ0);
    }
}
