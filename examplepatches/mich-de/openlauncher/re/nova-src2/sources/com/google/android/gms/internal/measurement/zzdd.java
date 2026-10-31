package com.google.android.gms.internal.measurement;

import android.app.Activity;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class zzdd extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzdd> CREATOR = new n7(0);

    /* renamed from: f, reason: collision with root package name */
    public final int f33308f;

    /* renamed from: g, reason: collision with root package name */
    public final String f33309g;

    /* renamed from: h, reason: collision with root package name */
    public final Intent f33310h;

    public zzdd(int i5, Intent intent, String str) {
        this.f33308f = i5;
        this.f33309g = str;
        this.f33310h = intent;
    }

    public static zzdd b(Activity activity) {
        return new zzdd(activity.hashCode(), activity.getIntent(), activity.getClass().getCanonicalName());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzdd)) {
            return false;
        }
        zzdd zzddVar = (zzdd) obj;
        return this.f33308f == zzddVar.f33308f && Objects.equals(this.f33309g, zzddVar.f33309g) && Objects.equals(this.f33310h, zzddVar.f33310h);
    }

    public final int hashCode() {
        return this.f33308f;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(this.f33308f);
        fg.a.c0(parcel, 2, this.f33309g);
        fg.a.b0(parcel, 3, this.f33310h, i5);
        fg.a.k0(parcel, iJ0);
    }
}
