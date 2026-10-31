package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import gi.g;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class IsReadyToPayRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<IsReadyToPayRequest> CREATOR = new g(4);

    /* renamed from: f, reason: collision with root package name */
    public ArrayList f33844f;

    /* renamed from: g, reason: collision with root package name */
    public String f33845g;

    /* renamed from: h, reason: collision with root package name */
    public String f33846h;

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f33847i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f33848j;

    /* renamed from: k, reason: collision with root package name */
    public String f33849k;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.Z(parcel, this.f33844f, 2);
        a.c0(parcel, 4, this.f33845g);
        a.c0(parcel, 5, this.f33846h);
        a.Z(parcel, this.f33847i, 6);
        boolean z11 = this.f33848j;
        a.i0(parcel, 7, 4);
        parcel.writeInt(z11 ? 1 : 0);
        a.c0(parcel, 8, this.f33849k);
        a.k0(parcel, iJ0);
    }
}
