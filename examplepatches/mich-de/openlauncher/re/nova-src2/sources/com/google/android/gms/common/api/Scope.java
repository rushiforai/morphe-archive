package com.google.android.gms.common.api;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import qg.n;
import sg.w;

/* loaded from: classes.dex */
public final class Scope extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<Scope> CREATOR = new n(2);

    /* renamed from: f, reason: collision with root package name */
    public final int f31804f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31805g;

    public Scope(int i5, String str) {
        w.f(str, "scopeUri must not be null or empty");
        this.f31804f = i5;
        this.f31805g = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Scope)) {
            return false;
        }
        return this.f31805g.equals(((Scope) obj).f31805g);
    }

    public final int hashCode() {
        return this.f31805g.hashCode();
    }

    public final String toString() {
        return this.f31805g;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31804f);
        a.c0(parcel, 2, this.f31805g);
        a.k0(parcel, iJ0);
    }
}
