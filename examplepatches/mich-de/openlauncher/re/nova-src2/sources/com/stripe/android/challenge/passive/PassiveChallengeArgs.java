package com.stripe.android.challenge.passive;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.model.PassiveCaptchaParams;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/passive/PassiveChallengeArgs;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PassiveChallengeArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PassiveChallengeArgs> CREATOR = new ji.a(14);

    /* renamed from: a, reason: collision with root package name */
    public final PassiveCaptchaParams f42510a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42511b;

    /* renamed from: c, reason: collision with root package name */
    public final List f42512c;

    public PassiveChallengeArgs(PassiveCaptchaParams passiveCaptchaParams, String publishableKey, List productUsage) {
        Intrinsics.g(passiveCaptchaParams, "passiveCaptchaParams");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        this.f42510a = passiveCaptchaParams;
        this.f42511b = publishableKey;
        this.f42512c = productUsage;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PassiveChallengeArgs)) {
            return false;
        }
        PassiveChallengeArgs passiveChallengeArgs = (PassiveChallengeArgs) obj;
        return Intrinsics.b(this.f42510a, passiveChallengeArgs.f42510a) && Intrinsics.b(this.f42511b, passiveChallengeArgs.f42511b) && Intrinsics.b(this.f42512c, passiveChallengeArgs.f42512c);
    }

    public final int hashCode() {
        return this.f42512c.hashCode() + c0.e(this.f42510a.hashCode() * 31, 31, this.f42511b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PassiveChallengeArgs(passiveCaptchaParams=");
        sb2.append(this.f42510a);
        sb2.append(", publishableKey=");
        sb2.append(this.f42511b);
        sb2.append(", productUsage=");
        return m.j(sb2, this.f42512c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42510a.writeToParcel(dest, i5);
        dest.writeString(this.f42511b);
        dest.writeStringList(this.f42512c);
    }
}
