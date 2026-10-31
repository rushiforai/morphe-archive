package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PassiveCaptchaParams;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PassiveCaptchaParams implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<PassiveCaptchaParams> CREATOR = new ft.q(8);

    /* renamed from: a, reason: collision with root package name */
    public final String f43531a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43532b;

    public PassiveCaptchaParams(String siteKey, String str) {
        Intrinsics.g(siteKey, "siteKey");
        this.f43531a = siteKey;
        this.f43532b = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PassiveCaptchaParams)) {
            return false;
        }
        PassiveCaptchaParams passiveCaptchaParams = (PassiveCaptchaParams) obj;
        return Intrinsics.b(this.f43531a, passiveCaptchaParams.f43531a) && Intrinsics.b(this.f43532b, passiveCaptchaParams.f43532b);
    }

    public final int hashCode() {
        int iHashCode = this.f43531a.hashCode() * 31;
        String str = this.f43532b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return b.c0.n("PassiveCaptchaParams(siteKey=", this.f43531a, ", rqData=", this.f43532b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43531a);
        dest.writeString(this.f43532b);
    }
}
