package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentMethodIncentive;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentMethodIncentive implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentMethodIncentive> CREATOR = new sv.b(22);

    /* renamed from: a, reason: collision with root package name */
    public final String f44797a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44798b;

    public PaymentMethodIncentive(String identifier, String displayText) {
        Intrinsics.g(identifier, "identifier");
        Intrinsics.g(displayText, "displayText");
        this.f44797a = identifier;
        this.f44798b = displayText;
    }

    public final PaymentMethodIncentive a(String code) {
        Intrinsics.g(code, "code");
        if (!Intrinsics.b(this.f44797a, "link_instant_debits")) {
            return null;
        }
        z2 z2Var = PaymentMethod.Type.f43637g;
        if (code.equals("link")) {
            return this;
        }
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
        if (!(obj instanceof PaymentMethodIncentive)) {
            return false;
        }
        PaymentMethodIncentive paymentMethodIncentive = (PaymentMethodIncentive) obj;
        return Intrinsics.b(this.f44797a, paymentMethodIncentive.f44797a) && Intrinsics.b(this.f44798b, paymentMethodIncentive.f44798b);
    }

    public final int hashCode() {
        return this.f44798b.hashCode() + (this.f44797a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("PaymentMethodIncentive(identifier=", this.f44797a, ", displayText=", this.f44798b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44797a);
        dest.writeString(this.f44798b);
    }
}
