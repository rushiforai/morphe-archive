package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/financialconnections/model/BankAccount;", "Lcom/stripe/android/financialconnections/model/PaymentAccount;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "xr/c", "xr/d", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class BankAccount extends PaymentAccount {

    /* renamed from: a, reason: collision with root package name */
    public final String f42705a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42706b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42707c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42708d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f42709e;

    @NotNull
    public static final xr.d Companion = new xr.d();

    @NotNull
    public static final Parcelable.Creator<BankAccount> CREATOR = new ww.c(7);

    public BankAccount(int i5, String str, String str2, String str3, String str4, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, xr.c.f96225a.getDescriptor());
        }
        this.f42705a = str;
        this.f42706b = str2;
        if ((i5 & 4) == 0) {
            this.f42707c = null;
        } else {
            this.f42707c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f42708d = null;
        } else {
            this.f42708d = str4;
        }
        if ((i5 & 16) == 0) {
            this.f42709e = true;
        } else {
            this.f42709e = z11;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BankAccount)) {
            return false;
        }
        BankAccount bankAccount = (BankAccount) obj;
        return Intrinsics.b(this.f42705a, bankAccount.f42705a) && Intrinsics.b(this.f42706b, bankAccount.f42706b) && Intrinsics.b(this.f42707c, bankAccount.f42707c) && Intrinsics.b(this.f42708d, bankAccount.f42708d) && this.f42709e == bankAccount.f42709e;
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f42705a.hashCode() * 31, 31, this.f42706b);
        String str = this.f42707c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42708d;
        return Boolean.hashCode(this.f42709e) + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("BankAccount(id=", this.f42705a, ", last4=", this.f42706b, ", bankName=");
        b.c0.D(sbW, this.f42707c, ", routingNumber=", this.f42708d, ", usesMicrodeposits=");
        return a80.m.k(sbW, this.f42709e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42705a);
        dest.writeString(this.f42706b);
        dest.writeString(this.f42707c);
        dest.writeString(this.f42708d);
        dest.writeInt(this.f42709e ? 1 : 0);
    }

    public BankAccount(String id2, String last4, String str, String str2, boolean z11) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(last4, "last4");
        this.f42705a = id2;
        this.f42706b = last4;
        this.f42707c = str;
        this.f42708d = str2;
        this.f42709e = z11;
    }
}
