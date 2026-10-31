package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/AuthenticationRequestParameters;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AuthenticationRequestParameters implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AuthenticationRequestParameters> CREATOR = new sv.b(25);

    /* renamed from: a, reason: collision with root package name */
    public final String f45058a;

    /* renamed from: b, reason: collision with root package name */
    public final SdkTransactionId f45059b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45060c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45061d;

    /* renamed from: e, reason: collision with root package name */
    public final String f45062e;

    /* renamed from: f, reason: collision with root package name */
    public final String f45063f;

    public AuthenticationRequestParameters(String deviceData, SdkTransactionId sdkTransactionId, String sdkAppId, String sdkReferenceNumber, String sdkEphemeralPublicKey, String messageVersion) {
        Intrinsics.g(deviceData, "deviceData");
        Intrinsics.g(sdkTransactionId, "sdkTransactionId");
        Intrinsics.g(sdkAppId, "sdkAppId");
        Intrinsics.g(sdkReferenceNumber, "sdkReferenceNumber");
        Intrinsics.g(sdkEphemeralPublicKey, "sdkEphemeralPublicKey");
        Intrinsics.g(messageVersion, "messageVersion");
        this.f45058a = deviceData;
        this.f45059b = sdkTransactionId;
        this.f45060c = sdkAppId;
        this.f45061d = sdkReferenceNumber;
        this.f45062e = sdkEphemeralPublicKey;
        this.f45063f = messageVersion;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AuthenticationRequestParameters)) {
            return false;
        }
        AuthenticationRequestParameters authenticationRequestParameters = (AuthenticationRequestParameters) obj;
        return Intrinsics.b(this.f45058a, authenticationRequestParameters.f45058a) && Intrinsics.b(this.f45059b, authenticationRequestParameters.f45059b) && Intrinsics.b(this.f45060c, authenticationRequestParameters.f45060c) && Intrinsics.b(this.f45061d, authenticationRequestParameters.f45061d) && Intrinsics.b(this.f45062e, authenticationRequestParameters.f45062e) && Intrinsics.b(this.f45063f, authenticationRequestParameters.f45063f);
    }

    public final int hashCode() {
        return this.f45063f.hashCode() + c0.e(c0.e(c0.e(c0.e(this.f45058a.hashCode() * 31, 31, this.f45059b.f45118a), 31, this.f45060c), 31, this.f45061d), 31, this.f45062e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AuthenticationRequestParameters(deviceData=");
        sb2.append(this.f45058a);
        sb2.append(", sdkTransactionId=");
        sb2.append(this.f45059b);
        sb2.append(", sdkAppId=");
        c0.D(sb2, this.f45060c, ", sdkReferenceNumber=", this.f45061d, ", sdkEphemeralPublicKey=");
        return c0.s(sb2, this.f45062e, ", messageVersion=", this.f45063f, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45058a);
        this.f45059b.writeToParcel(dest, i5);
        dest.writeString(this.f45060c);
        dest.writeString(this.f45061d);
        dest.writeString(this.f45062e);
        dest.writeString(this.f45063f);
    }
}
