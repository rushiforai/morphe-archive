package com.spotify.sdk.android.auth;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import ww.c;

/* loaded from: classes4.dex */
public class AuthorizationResponse implements Parcelable {
    public static final Parcelable.Creator<AuthorizationResponse> CREATOR = new c(6);

    /* renamed from: a, reason: collision with root package name */
    public final int f42413a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42414b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42415c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42416d;

    /* renamed from: e, reason: collision with root package name */
    public final String f42417e;

    /* renamed from: f, reason: collision with root package name */
    public final int f42418f;

    public AuthorizationResponse(String str, int i5, String str2, String str3, int i11, String str4) {
        this.f42413a = i5 == 0 ? 5 : i5;
        this.f42414b = str;
        this.f42415c = str2;
        this.f42416d = str3;
        this.f42417e = str4;
        this.f42418f = i11;
    }

    public final String A() {
        return this.f42414b;
    }

    public final String b() {
        return this.f42415c;
    }

    public final String d() {
        return this.f42417e;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final int e() {
        return this.f42418f;
    }

    public final String i() {
        return this.f42416d;
    }

    public final int l() {
        return this.f42413a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f42418f);
        parcel.writeString(this.f42417e);
        parcel.writeString(this.f42416d);
        parcel.writeString(this.f42415c);
        parcel.writeString(this.f42414b);
        parcel.writeInt(c0.F(this.f42413a));
    }

    public AuthorizationResponse(Parcel parcel) {
        this.f42418f = parcel.readInt();
        this.f42417e = parcel.readString();
        this.f42416d = parcel.readString();
        this.f42415c = parcel.readString();
        this.f42414b = parcel.readString();
        this.f42413a = c0.G(5)[parcel.readInt()];
    }
}
