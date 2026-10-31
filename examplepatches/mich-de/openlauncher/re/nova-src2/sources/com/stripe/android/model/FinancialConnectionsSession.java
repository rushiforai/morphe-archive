package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/FinancialConnectionsSession;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class FinancialConnectionsSession implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<FinancialConnectionsSession> CREATOR = new ft.q(4);

    /* renamed from: a, reason: collision with root package name */
    public final String f43496a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43497b;

    public FinancialConnectionsSession(String str, String str2) {
        this.f43496a = str;
        this.f43497b = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FinancialConnectionsSession)) {
            return false;
        }
        FinancialConnectionsSession financialConnectionsSession = (FinancialConnectionsSession) obj;
        return Intrinsics.b(this.f43496a, financialConnectionsSession.f43496a) && Intrinsics.b(this.f43497b, financialConnectionsSession.f43497b);
    }

    public final int hashCode() {
        String str = this.f43496a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f43497b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return b.c0.n("FinancialConnectionsSession(clientSecret=", this.f43496a, ", id=", this.f43497b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43496a);
        dest.writeString(this.f43497b);
    }
}
