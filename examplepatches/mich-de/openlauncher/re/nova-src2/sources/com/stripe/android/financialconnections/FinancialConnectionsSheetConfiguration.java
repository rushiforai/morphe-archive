package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetConfiguration;", "Landroid/os/Parcelable;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class FinancialConnectionsSheetConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<FinancialConnectionsSheetConfiguration> CREATOR = new nv.f(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f42658a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42659b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42660c;

    public FinancialConnectionsSheetConfiguration(String financialConnectionsSessionClientSecret, String publishableKey, String str) {
        Intrinsics.g(financialConnectionsSessionClientSecret, "financialConnectionsSessionClientSecret");
        Intrinsics.g(publishableKey, "publishableKey");
        this.f42658a = financialConnectionsSessionClientSecret;
        this.f42659b = publishableKey;
        this.f42660c = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FinancialConnectionsSheetConfiguration)) {
            return false;
        }
        FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration = (FinancialConnectionsSheetConfiguration) obj;
        return Intrinsics.b(this.f42658a, financialConnectionsSheetConfiguration.f42658a) && Intrinsics.b(this.f42659b, financialConnectionsSheetConfiguration.f42659b) && Intrinsics.b(this.f42660c, financialConnectionsSheetConfiguration.f42660c);
    }

    public final int hashCode() {
        int iE = c0.e(this.f42658a.hashCode() * 31, 31, this.f42659b);
        String str = this.f42660c;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.q(c0.w("FinancialConnectionsSheetConfiguration(financialConnectionsSessionClientSecret=", this.f42658a, ", publishableKey=", this.f42659b, ", stripeAccountId="), this.f42660c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42658a);
        dest.writeString(this.f42659b);
        dest.writeString(this.f42660c);
    }
}
