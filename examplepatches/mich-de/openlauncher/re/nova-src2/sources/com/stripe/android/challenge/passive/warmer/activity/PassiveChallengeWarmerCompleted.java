package com.stripe.android.challenge.passive.warmer.activity;

import android.os.Parcel;
import android.os.Parcelable;
import ji.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/passive/warmer/activity/PassiveChallengeWarmerCompleted;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PassiveChallengeWarmerCompleted implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public static final PassiveChallengeWarmerCompleted f42523a = new PassiveChallengeWarmerCompleted();

    @NotNull
    public static final Parcelable.Creator<PassiveChallengeWarmerCompleted> CREATOR = new a(25);

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof PassiveChallengeWarmerCompleted);
    }

    public final int hashCode() {
        return 1608486069;
    }

    public final String toString() {
        return "PassiveChallengeWarmerCompleted";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(1);
    }
}
