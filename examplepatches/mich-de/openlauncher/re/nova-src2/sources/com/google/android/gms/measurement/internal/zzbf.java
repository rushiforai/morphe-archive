package com.google.android.gms.measurement.internal;

import ab.w;
import ai.r;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import fg.a;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class zzbf extends AbstractSafeParcelable implements Iterable<String> {
    public static final Parcelable.Creator<zzbf> CREATOR = new w(6);

    /* renamed from: f, reason: collision with root package name */
    public final Bundle f33767f;

    public zzbf(Bundle bundle) {
        this.f33767f = bundle;
    }

    public final Object b(String str) {
        return this.f33767f.get(str);
    }

    public final Double d() {
        return Double.valueOf(this.f33767f.getDouble("value"));
    }

    @Override // java.lang.Iterable
    public final Iterator<String> iterator() {
        return new r(this);
    }

    public final String l() {
        return this.f33767f.getString(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY);
    }

    public final Bundle p() {
        return new Bundle(this.f33767f);
    }

    public final String toString() {
        return this.f33767f.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.U(parcel, 2, p());
        a.k0(parcel, iJ0);
    }
}
