package com.stripe.android.challenge.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/confirmation/BridgeErrorParams;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BridgeErrorParams implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<BridgeErrorParams> CREATOR = new g(24);

    /* renamed from: a, reason: collision with root package name */
    public final String f42484a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42485b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42486c;

    public BridgeErrorParams(String str, String str2, String str3) {
        this.f42484a = str;
        this.f42485b = str2;
        this.f42486c = str3;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BridgeErrorParams)) {
            return false;
        }
        BridgeErrorParams bridgeErrorParams = (BridgeErrorParams) obj;
        return Intrinsics.b(this.f42484a, bridgeErrorParams.f42484a) && Intrinsics.b(this.f42485b, bridgeErrorParams.f42485b) && Intrinsics.b(this.f42486c, bridgeErrorParams.f42486c);
    }

    public final int hashCode() {
        String str = this.f42484a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f42485b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f42486c;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return c0.q(c0.w("BridgeErrorParams(message=", this.f42484a, ", type=", this.f42485b, ", code="), this.f42486c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42484a);
        dest.writeString(this.f42485b);
        dest.writeString(this.f42486c);
    }
}
