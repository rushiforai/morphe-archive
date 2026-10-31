package com.stripe.android.challenge.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/confirmation/BridgeSuccessParams;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BridgeSuccessParams implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<BridgeSuccessParams> CREATOR = new g(25);

    /* renamed from: a, reason: collision with root package name */
    public final String f42487a;

    public BridgeSuccessParams(String clientSecret) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f42487a = clientSecret;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof BridgeSuccessParams) && Intrinsics.b(this.f42487a, ((BridgeSuccessParams) obj).f42487a);
    }

    public final int hashCode() {
        return this.f42487a.hashCode();
    }

    public final String toString() {
        return c0.l("BridgeSuccessParams(clientSecret=", this.f42487a, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42487a);
    }
}
