package com.stripe.android.challenge.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import b.u4;
import com.stripe.android.model.StripeIntent;
import gi.g;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeArgs;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class IntentConfirmationChallengeArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<IntentConfirmationChallengeArgs> CREATOR = new g(26);

    /* renamed from: a, reason: collision with root package name */
    public final String f42492a;

    /* renamed from: b, reason: collision with root package name */
    public final List f42493b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeIntent f42494c;

    public IntentConfirmationChallengeArgs(String publishableKey, List productUsage, StripeIntent intent) {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        Intrinsics.g(intent, "intent");
        this.f42492a = publishableKey;
        this.f42493b = productUsage;
        this.f42494c = intent;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IntentConfirmationChallengeArgs)) {
            return false;
        }
        IntentConfirmationChallengeArgs intentConfirmationChallengeArgs = (IntentConfirmationChallengeArgs) obj;
        return Intrinsics.b(this.f42492a, intentConfirmationChallengeArgs.f42492a) && Intrinsics.b(this.f42493b, intentConfirmationChallengeArgs.f42493b) && Intrinsics.b(this.f42494c, intentConfirmationChallengeArgs.f42494c);
    }

    public final int hashCode() {
        return this.f42494c.hashCode() + u4.c(this.f42492a.hashCode() * 31, 31, this.f42493b);
    }

    public final String toString() {
        return "IntentConfirmationChallengeArgs(publishableKey=" + this.f42492a + ", productUsage=" + this.f42493b + ", intent=" + this.f42494c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42492a);
        dest.writeStringList(this.f42493b);
        dest.writeParcelable(this.f42494c, i5);
    }
}
