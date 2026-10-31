package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/CustomerBankAccount;", "Lcom/stripe/android/model/CustomerPaymentSource;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomerBankAccount extends CustomerPaymentSource {

    @NotNull
    public static final Parcelable.Creator<CustomerBankAccount> CREATOR = new ft.q(0);

    /* renamed from: a, reason: collision with root package name */
    public final BankAccount f43368a;

    public CustomerBankAccount(BankAccount bankAccount) {
        Intrinsics.g(bankAccount, "bankAccount");
        this.f43368a = bankAccount;
    }

    @Override // com.stripe.android.model.CustomerPaymentSource
    public final ft.u0 b() {
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof CustomerBankAccount) && Intrinsics.b(this.f43368a, ((CustomerBankAccount) obj).f43368a);
    }

    public final int hashCode() {
        return this.f43368a.hashCode();
    }

    public final String toString() {
        return "CustomerBankAccount(bankAccount=" + this.f43368a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43368a, i5);
    }
}
