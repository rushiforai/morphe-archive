package com.stripe.android.stripe3ds2.init.ui;

import android.os.Parcel;
import android.os.Parcelable;
import sv.a;

/* loaded from: classes4.dex */
public abstract class BaseCustomization implements a, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45032a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45033b;

    /* renamed from: c, reason: collision with root package name */
    public final int f45034c;

    public BaseCustomization(Parcel parcel) {
        this.f45032a = parcel.readString();
        this.f45033b = parcel.readString();
        this.f45034c = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45032a);
        parcel.writeString(this.f45033b);
        parcel.writeInt(this.f45034c);
    }
}
