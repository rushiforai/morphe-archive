package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import gv.q0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/state/PaymentElementLoader$State", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentElementLoader$State implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentElementLoader$State> CREATOR = new gi.g(17);

    /* renamed from: a, reason: collision with root package name */
    public final CommonConfiguration f44971a;

    /* renamed from: b, reason: collision with root package name */
    public final CustomerState f44972b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSelection f44973c;

    /* renamed from: d, reason: collision with root package name */
    public final q0 f44974d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentMethodMetadata f44975e;

    public PaymentElementLoader$State(CommonConfiguration config, CustomerState customerState, PaymentSelection paymentSelection, q0 q0Var, PaymentMethodMetadata paymentMethodMetadata) {
        Intrinsics.g(config, "config");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        this.f44971a = config;
        this.f44972b = customerState;
        this.f44973c = paymentSelection;
        this.f44974d = q0Var;
        this.f44975e = paymentMethodMetadata;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentElementLoader$State)) {
            return false;
        }
        PaymentElementLoader$State paymentElementLoader$State = (PaymentElementLoader$State) obj;
        return Intrinsics.b(this.f44971a, paymentElementLoader$State.f44971a) && Intrinsics.b(this.f44972b, paymentElementLoader$State.f44972b) && Intrinsics.b(this.f44973c, paymentElementLoader$State.f44973c) && Intrinsics.b(this.f44974d, paymentElementLoader$State.f44974d) && Intrinsics.b(this.f44975e, paymentElementLoader$State.f44975e);
    }

    public final int hashCode() {
        int iHashCode = this.f44971a.hashCode() * 31;
        CustomerState customerState = this.f44972b;
        int iHashCode2 = (iHashCode + (customerState == null ? 0 : customerState.hashCode())) * 31;
        PaymentSelection paymentSelection = this.f44973c;
        int iHashCode3 = (iHashCode2 + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31;
        q0 q0Var = this.f44974d;
        return this.f44975e.hashCode() + ((iHashCode3 + (q0Var != null ? q0Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "State(config=" + this.f44971a + ", customer=" + this.f44972b + ", paymentSelection=" + this.f44973c + ", validationError=" + this.f44974d + ", paymentMethodMetadata=" + this.f44975e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44971a, i5);
        dest.writeParcelable(this.f44972b, i5);
        dest.writeParcelable(this.f44973c, i5);
        dest.writeSerializable(this.f44974d);
        dest.writeParcelable(this.f44975e, i5);
    }
}
