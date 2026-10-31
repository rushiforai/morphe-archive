package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import ww.c;

/* loaded from: classes3.dex */
public final class LatLng extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<LatLng> CREATOR = new c(4);

    /* renamed from: f, reason: collision with root package name */
    public final double f33742f;

    /* renamed from: g, reason: collision with root package name */
    public final double f33743g;

    public LatLng(double d5, double d11) {
        if (d11 < -180.0d || d11 >= 180.0d) {
            this.f33743g = ((((d11 - 180.0d) % 360.0d) + 360.0d) % 360.0d) - 180.0d;
        } else {
            this.f33743g = d11;
        }
        this.f33742f = Math.max(-90.0d, Math.min(90.0d, d5));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LatLng)) {
            return false;
        }
        LatLng latLng = (LatLng) obj;
        return Double.doubleToLongBits(this.f33742f) == Double.doubleToLongBits(latLng.f33742f) && Double.doubleToLongBits(this.f33743g) == Double.doubleToLongBits(latLng.f33743g);
    }

    public final int hashCode() {
        long jDoubleToLongBits = Double.doubleToLongBits(this.f33742f);
        long jDoubleToLongBits2 = Double.doubleToLongBits(this.f33743g);
        return ((((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32))) + 31) * 31) + ((int) (jDoubleToLongBits2 ^ (jDoubleToLongBits2 >>> 32)));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(60);
        sb2.append("lat/lng: (");
        sb2.append(this.f33742f);
        sb2.append(",");
        sb2.append(this.f33743g);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 2, 8);
        parcel.writeDouble(this.f33742f);
        a.i0(parcel, 3, 8);
        parcel.writeDouble(this.f33743g);
        a.k0(parcel, iJ0);
    }
}
