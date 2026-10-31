package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.u4;
import java.security.KeyPair;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/InitChallengeArgs;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class InitChallengeArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<InitChallengeArgs> CREATOR = new sv.b(27);

    /* renamed from: a, reason: collision with root package name */
    public final String f45106a;

    /* renamed from: b, reason: collision with root package name */
    public final KeyPair f45107b;

    /* renamed from: c, reason: collision with root package name */
    public final ChallengeParameters f45108c;

    /* renamed from: d, reason: collision with root package name */
    public final int f45109d;

    /* renamed from: e, reason: collision with root package name */
    public final IntentData f45110e;

    public InitChallengeArgs(String sdkReferenceNumber, KeyPair sdkKeyPair, ChallengeParameters challengeParameters, int i5, IntentData intentData) {
        Intrinsics.g(sdkReferenceNumber, "sdkReferenceNumber");
        Intrinsics.g(sdkKeyPair, "sdkKeyPair");
        Intrinsics.g(challengeParameters, "challengeParameters");
        Intrinsics.g(intentData, "intentData");
        this.f45106a = sdkReferenceNumber;
        this.f45107b = sdkKeyPair;
        this.f45108c = challengeParameters;
        this.f45109d = i5;
        this.f45110e = intentData;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof InitChallengeArgs)) {
            return false;
        }
        InitChallengeArgs initChallengeArgs = (InitChallengeArgs) obj;
        return Intrinsics.b(this.f45106a, initChallengeArgs.f45106a) && Intrinsics.b(this.f45107b, initChallengeArgs.f45107b) && Intrinsics.b(this.f45108c, initChallengeArgs.f45108c) && this.f45109d == initChallengeArgs.f45109d && Intrinsics.b(this.f45110e, initChallengeArgs.f45110e);
    }

    public final int hashCode() {
        return this.f45110e.hashCode() + u4.a(this.f45109d, (this.f45108c.hashCode() + ((this.f45107b.hashCode() + (this.f45106a.hashCode() * 31)) * 31)) * 31, 31);
    }

    public final String toString() {
        return "InitChallengeArgs(sdkReferenceNumber=" + this.f45106a + ", sdkKeyPair=" + this.f45107b + ", challengeParameters=" + this.f45108c + ", timeoutMins=" + this.f45109d + ", intentData=" + this.f45110e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45106a);
        dest.writeSerializable(this.f45107b);
        this.f45108c.writeToParcel(dest, i5);
        dest.writeInt(this.f45109d);
        this.f45110e.writeToParcel(dest, i5);
    }
}
