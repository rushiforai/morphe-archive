package com.google.android.material.datepicker;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes3.dex */
public final class o implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34265a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f34265a) {
            case 0:
                return Month.a(parcel.readInt(), parcel.readInt());
            default:
                return new DateValidatorPointForward(parcel.readLong());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f34265a) {
            case 0:
                return new Month[i5];
            default:
                return new DateValidatorPointForward[i5];
        }
    }
}
