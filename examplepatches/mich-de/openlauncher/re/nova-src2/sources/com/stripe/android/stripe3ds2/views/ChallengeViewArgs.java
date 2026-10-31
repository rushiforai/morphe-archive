package com.stripe.android.stripe3ds2.views;

import android.os.Parcel;
import android.os.Parcelable;
import b.u4;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import com.stripe.android.stripe3ds2.transaction.IntentData;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.transactions.ChallengeResponseData;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ww.c;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ChallengeViewArgs;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ChallengeViewArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ChallengeViewArgs> CREATOR = new c(26);

    /* renamed from: a, reason: collision with root package name */
    public final ChallengeResponseData f45244a;

    /* renamed from: b, reason: collision with root package name */
    public final ChallengeRequestData f45245b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeUiCustomization f45246c;

    /* renamed from: d, reason: collision with root package name */
    public final ChallengeRequestExecutor$Config f45247d;

    /* renamed from: e, reason: collision with root package name */
    public final wv.c f45248e;

    /* renamed from: f, reason: collision with root package name */
    public final int f45249f;

    /* renamed from: g, reason: collision with root package name */
    public final IntentData f45250g;

    public ChallengeViewArgs(ChallengeResponseData cresData, ChallengeRequestData creqData, StripeUiCustomization uiCustomization, ChallengeRequestExecutor$Config creqExecutorConfig, wv.c creqExecutorFactory, int i5, IntentData intentData) {
        Intrinsics.g(cresData, "cresData");
        Intrinsics.g(creqData, "creqData");
        Intrinsics.g(uiCustomization, "uiCustomization");
        Intrinsics.g(creqExecutorConfig, "creqExecutorConfig");
        Intrinsics.g(creqExecutorFactory, "creqExecutorFactory");
        Intrinsics.g(intentData, "intentData");
        this.f45244a = cresData;
        this.f45245b = creqData;
        this.f45246c = uiCustomization;
        this.f45247d = creqExecutorConfig;
        this.f45248e = creqExecutorFactory;
        this.f45249f = i5;
        this.f45250g = intentData;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ChallengeViewArgs)) {
            return false;
        }
        ChallengeViewArgs challengeViewArgs = (ChallengeViewArgs) obj;
        return Intrinsics.b(this.f45244a, challengeViewArgs.f45244a) && Intrinsics.b(this.f45245b, challengeViewArgs.f45245b) && Intrinsics.b(this.f45246c, challengeViewArgs.f45246c) && Intrinsics.b(this.f45247d, challengeViewArgs.f45247d) && Intrinsics.b(this.f45248e, challengeViewArgs.f45248e) && this.f45249f == challengeViewArgs.f45249f && Intrinsics.b(this.f45250g, challengeViewArgs.f45250g);
    }

    public final int hashCode() {
        return this.f45250g.hashCode() + u4.a(this.f45249f, (this.f45248e.hashCode() + ((this.f45247d.hashCode() + ((this.f45246c.hashCode() + ((this.f45245b.hashCode() + (this.f45244a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31, 31);
    }

    public final String toString() {
        return "ChallengeViewArgs(cresData=" + this.f45244a + ", creqData=" + this.f45245b + ", uiCustomization=" + this.f45246c + ", creqExecutorConfig=" + this.f45247d + ", creqExecutorFactory=" + this.f45248e + ", timeoutMins=" + this.f45249f + ", intentData=" + this.f45250g + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f45244a.writeToParcel(dest, i5);
        this.f45245b.writeToParcel(dest, i5);
        dest.writeParcelable(this.f45246c, i5);
        this.f45247d.writeToParcel(dest, i5);
        dest.writeSerializable(this.f45248e);
        dest.writeInt(this.f45249f);
        this.f45250g.writeToParcel(dest, i5);
    }
}
