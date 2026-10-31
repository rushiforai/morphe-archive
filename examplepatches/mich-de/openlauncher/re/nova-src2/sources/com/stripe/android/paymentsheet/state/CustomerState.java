package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/state/CustomerState;", "Landroid/os/Parcelable;", "gv/b", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CustomerState implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final List f44956a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44957b;

    /* renamed from: c, reason: collision with root package name */
    public static final gv.b f44955c = new gv.b();

    @NotNull
    public static final Parcelable.Creator<CustomerState> CREATOR = new gi.g(14);

    public CustomerState(List list, String str) {
        this.f44956a = list;
        this.f44957b = str;
    }

    public static CustomerState a(CustomerState customerState, List paymentMethods, String str, int i5) {
        if ((i5 & 1) != 0) {
            paymentMethods = customerState.f44956a;
        }
        if ((i5 & 2) != 0) {
            str = customerState.f44957b;
        }
        customerState.getClass();
        Intrinsics.g(paymentMethods, "paymentMethods");
        return new CustomerState(paymentMethods, str);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CustomerState)) {
            return false;
        }
        CustomerState customerState = (CustomerState) obj;
        return Intrinsics.b(this.f44956a, customerState.f44956a) && Intrinsics.b(this.f44957b, customerState.f44957b);
    }

    public final int hashCode() {
        int iHashCode = this.f44956a.hashCode() * 31;
        String str = this.f44957b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "CustomerState(paymentMethods=" + this.f44956a + ", defaultPaymentMethodId=" + this.f44957b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f44956a, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
        dest.writeString(this.f44957b);
    }
}
