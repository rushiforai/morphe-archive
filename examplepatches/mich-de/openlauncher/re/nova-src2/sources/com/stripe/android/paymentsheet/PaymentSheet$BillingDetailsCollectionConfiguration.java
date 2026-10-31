package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$BillingAddressConfig;
import java.util.Iterator;
import java.util.Set;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$BillingDetailsCollectionConfiguration", "Landroid/os/Parcelable;", "ou/n0", "ou/m0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PaymentSheet$BillingDetailsCollectionConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$BillingDetailsCollectionConfiguration> CREATOR = new ou.l0(2);

    /* renamed from: a, reason: collision with root package name */
    public final ou.n0 f44513a;

    /* renamed from: b, reason: collision with root package name */
    public final ou.n0 f44514b;

    /* renamed from: c, reason: collision with root package name */
    public final ou.n0 f44515c;

    /* renamed from: d, reason: collision with root package name */
    public final ou.m0 f44516d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f44517e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f44518f;

    /* renamed from: g, reason: collision with root package name */
    public final a70.d f44519g;

    /* JADX WARN: Illegal instructions before constructor call */
    public PaymentSheet$BillingDetailsCollectionConfiguration(ou.m0 m0Var, Set set) {
        ou.n0 n0Var = ou.n0.f80939b;
        this(n0Var, n0Var, n0Var, m0Var, false, set);
    }

    public final Set b() {
        return (Set) this.f44519g.getValue();
    }

    public final boolean d() {
        return this.f44515c == ou.n0.f80940c;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean e() {
        return this.f44513a == ou.n0.f80940c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$BillingDetailsCollectionConfiguration)) {
            return false;
        }
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = (PaymentSheet$BillingDetailsCollectionConfiguration) obj;
        return this.f44513a == paymentSheet$BillingDetailsCollectionConfiguration.f44513a && this.f44514b == paymentSheet$BillingDetailsCollectionConfiguration.f44514b && this.f44515c == paymentSheet$BillingDetailsCollectionConfiguration.f44515c && this.f44516d == paymentSheet$BillingDetailsCollectionConfiguration.f44516d && this.f44517e == paymentSheet$BillingDetailsCollectionConfiguration.f44517e && Intrinsics.b(this.f44518f, paymentSheet$BillingDetailsCollectionConfiguration.f44518f);
    }

    public final int hashCode() {
        return this.f44518f.hashCode() + c9.f((this.f44516d.hashCode() + ((this.f44515c.hashCode() + ((this.f44514b.hashCode() + (this.f44513a.hashCode() * 31)) * 31)) * 31)) * 31, 31, this.f44517e);
    }

    public final boolean i() {
        return this.f44514b == ou.n0.f80940c;
    }

    public final GooglePayPaymentMethodLauncher$BillingAddressConfig l() {
        as.v vVar;
        ou.m0 m0Var = this.f44516d;
        int iOrdinal = m0Var.ordinal();
        boolean z11 = true;
        if (iOrdinal == 0 || iOrdinal == 1) {
            vVar = as.v.f15644a;
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            vVar = as.v.f15645b;
        }
        if (m0Var != ou.m0.f80933c && !i()) {
            z11 = false;
        }
        return new GooglePayPaymentMethodLauncher$BillingAddressConfig(z11, vVar, i());
    }

    public final String toString() {
        return "BillingDetailsCollectionConfiguration(name=" + this.f44513a + ", phone=" + this.f44514b + ", email=" + this.f44515c + ", address=" + this.f44516d + ", attachDefaultsToPaymentMethod=" + this.f44517e + ", allowedCountries=" + this.f44518f + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44513a.name());
        dest.writeString(this.f44514b.name());
        dest.writeString(this.f44515c.name());
        dest.writeString(this.f44516d.name());
        dest.writeInt(this.f44517e ? 1 : 0);
        Set set = this.f44518f;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
    }

    public PaymentSheet$BillingDetailsCollectionConfiguration(ou.n0 name, ou.n0 phone, ou.n0 email, ou.m0 address, boolean z11, Set allowedCountries) {
        Intrinsics.g(name, "name");
        Intrinsics.g(phone, "phone");
        Intrinsics.g(email, "email");
        Intrinsics.g(address, "address");
        Intrinsics.g(allowedCountries, "allowedCountries");
        this.f44513a = name;
        this.f44514b = phone;
        this.f44515c = email;
        this.f44516d = address;
        this.f44517e = z11;
        this.f44518f = allowedCountries;
        this.f44519g = LazyKt.a(new n0.w(this, 3));
    }
}
