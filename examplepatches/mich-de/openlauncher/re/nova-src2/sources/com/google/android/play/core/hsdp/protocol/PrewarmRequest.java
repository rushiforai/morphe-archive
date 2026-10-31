package com.google.android.play.core.hsdp.protocol;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Objects;
import ji.a;

/* loaded from: classes3.dex */
public final class PrewarmRequest implements Parcelable {
    public static final Parcelable.Creator<PrewarmRequest> CREATOR = new a(19);

    /* renamed from: a, reason: collision with root package name */
    public final String f34548a;

    /* renamed from: b, reason: collision with root package name */
    public final String f34549b;

    /* renamed from: c, reason: collision with root package name */
    public final IBinder f34550c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f34551d;

    public /* synthetic */ PrewarmRequest(Parcel parcel) {
        String string = parcel.readString();
        Objects.requireNonNull(string);
        this.f34548a = string;
        String string2 = parcel.readString();
        Objects.requireNonNull(string2);
        this.f34549b = string2;
        if (parcel.readByte() != 0) {
            this.f34550c = parcel.readStrongBinder();
        } else {
            this.f34550c = null;
        }
        Bundle bundle = parcel.readBundle(PrewarmRequest.class.getClassLoader());
        this.f34551d = bundle == null ? Bundle.EMPTY : bundle;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f34548a);
        parcel.writeString(this.f34549b);
        IBinder iBinder = this.f34550c;
        if (iBinder != null) {
            parcel.writeByte((byte) 1);
            parcel.writeStrongBinder(iBinder);
        } else {
            parcel.writeByte((byte) 0);
        }
        parcel.writeBundle(this.f34551d);
    }

    public PrewarmRequest(String str, String str2, IBinder iBinder) {
        this.f34548a = str;
        Objects.requireNonNull(str2, "url cannot be null");
        this.f34549b = str2;
        this.f34550c = iBinder;
        this.f34551d = Bundle.EMPTY;
    }
}
