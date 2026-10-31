package com.google.android.gms.wallet;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.identity.intents.model.UserAddress;
import fg.a;
import ft.q;

/* loaded from: classes3.dex */
public final class PaymentData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<PaymentData> CREATOR = new q(20);

    /* renamed from: f, reason: collision with root package name */
    public String f33885f;

    /* renamed from: g, reason: collision with root package name */
    public CardInfo f33886g;

    /* renamed from: h, reason: collision with root package name */
    public UserAddress f33887h;

    /* renamed from: i, reason: collision with root package name */
    public PaymentMethodToken f33888i;

    /* renamed from: j, reason: collision with root package name */
    public String f33889j;

    /* renamed from: k, reason: collision with root package name */
    public Bundle f33890k;

    /* renamed from: l, reason: collision with root package name */
    public String f33891l;

    /* renamed from: m, reason: collision with root package name */
    public Bundle f33892m;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.c0(parcel, 1, this.f33885f);
        a.b0(parcel, 2, this.f33886g, i5);
        a.b0(parcel, 3, this.f33887h, i5);
        a.b0(parcel, 4, this.f33888i, i5);
        a.c0(parcel, 5, this.f33889j);
        a.U(parcel, 6, this.f33890k);
        a.c0(parcel, 7, this.f33891l);
        a.U(parcel, 8, this.f33892m);
        a.k0(parcel, iJ0);
    }
}
