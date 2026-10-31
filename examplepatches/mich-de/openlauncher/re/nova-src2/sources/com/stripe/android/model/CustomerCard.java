package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/CustomerCard;", "Lcom/stripe/android/model/CustomerPaymentSource;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomerCard extends CustomerPaymentSource {

    @NotNull
    public static final Parcelable.Creator<CustomerCard> CREATOR = new ft.q(1);

    /* renamed from: a, reason: collision with root package name */
    public final Card f43369a;

    public CustomerCard(Card card) {
        Intrinsics.g(card, "card");
        this.f43369a = card;
    }

    @Override // com.stripe.android.model.CustomerPaymentSource
    public final ft.u0 b() {
        return this.f43369a.f43173u;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof CustomerCard) && Intrinsics.b(this.f43369a, ((CustomerCard) obj).f43369a);
    }

    public final int hashCode() {
        return this.f43369a.hashCode();
    }

    public final String toString() {
        return "CustomerCard(card=" + this.f43369a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43369a, i5);
    }
}
