package com.google.android.gms.measurement.internal;

import ab.w;
import ai.a3;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzoo extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzoo> CREATOR = new w(10);

    /* renamed from: f, reason: collision with root package name */
    public final List f33783f;

    public zzoo(ArrayList arrayList) {
        this.f33783f = arrayList;
    }

    public static zzoo b(a3... a3VarArr) {
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(Integer.valueOf(a3VarArr[0].f12841a));
        return new zzoo(arrayList);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.Z(parcel, this.f33783f, 1);
        a.k0(parcel, iJ0);
    }
}
