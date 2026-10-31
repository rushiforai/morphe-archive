package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$LinkConfiguration", "Landroid/os/Parcelable;", "ou/u0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$LinkConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$LinkConfiguration> CREATOR = new ou.l0(11);

    /* renamed from: a, reason: collision with root package name */
    public final ou.u0 f44607a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f44608b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f44609c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f44610d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f44611e;

    public PaymentSheet$LinkConfiguration(ou.u0 display, boolean z11, boolean z12, boolean z13, Set disallowFundingSourceCreation) {
        Intrinsics.g(display, "display");
        Intrinsics.g(disallowFundingSourceCreation, "disallowFundingSourceCreation");
        this.f44607a = display;
        this.f44608b = z11;
        this.f44609c = z12;
        this.f44610d = z13;
        this.f44611e = disallowFundingSourceCreation;
    }

    public final boolean b() {
        int iOrdinal = this.f44607a.ordinal();
        if (iOrdinal == 0) {
            return true;
        }
        if (iOrdinal == 1) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$LinkConfiguration)) {
            return false;
        }
        PaymentSheet$LinkConfiguration paymentSheet$LinkConfiguration = (PaymentSheet$LinkConfiguration) obj;
        return this.f44607a == paymentSheet$LinkConfiguration.f44607a && this.f44608b == paymentSheet$LinkConfiguration.f44608b && this.f44609c == paymentSheet$LinkConfiguration.f44609c && this.f44610d == paymentSheet$LinkConfiguration.f44610d && Intrinsics.b(this.f44611e, paymentSheet$LinkConfiguration.f44611e);
    }

    public final int hashCode() {
        return this.f44611e.hashCode() + c9.f(c9.f(c9.f(this.f44607a.hashCode() * 31, 31, this.f44608b), 31, this.f44609c), 31, this.f44610d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LinkConfiguration(display=");
        sb2.append(this.f44607a);
        sb2.append(", collectMissingBillingDetailsForExistingPaymentMethods=");
        sb2.append(this.f44608b);
        sb2.append(", allowUserEmailEdits=");
        a80.m.s(sb2, this.f44609c, ", allowLogOut=", this.f44610d, ", disallowFundingSourceCreation=");
        sb2.append(this.f44611e);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44607a.name());
        dest.writeInt(this.f44608b ? 1 : 0);
        dest.writeInt(this.f44609c ? 1 : 0);
        dest.writeInt(this.f44610d ? 1 : 0);
        Set set = this.f44611e;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
    }
}
