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

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/state/PaymentSheetState$Full", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentSheetState$Full implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheetState$Full> CREATOR = new gi.g(18);

    /* renamed from: a, reason: collision with root package name */
    public final CommonConfiguration f44976a;

    /* renamed from: b, reason: collision with root package name */
    public final CustomerState f44977b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSelection f44978c;

    /* renamed from: d, reason: collision with root package name */
    public final q0 f44979d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentMethodMetadata f44980e;

    public PaymentSheetState$Full(CommonConfiguration config, CustomerState customerState, PaymentSelection paymentSelection, q0 q0Var, PaymentMethodMetadata paymentMethodMetadata) {
        Intrinsics.g(config, "config");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        this.f44976a = config;
        this.f44977b = customerState;
        this.f44978c = paymentSelection;
        this.f44979d = q0Var;
        this.f44980e = paymentMethodMetadata;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheetState$Full)) {
            return false;
        }
        PaymentSheetState$Full paymentSheetState$Full = (PaymentSheetState$Full) obj;
        return Intrinsics.b(this.f44976a, paymentSheetState$Full.f44976a) && Intrinsics.b(this.f44977b, paymentSheetState$Full.f44977b) && Intrinsics.b(this.f44978c, paymentSheetState$Full.f44978c) && Intrinsics.b(this.f44979d, paymentSheetState$Full.f44979d) && Intrinsics.b(this.f44980e, paymentSheetState$Full.f44980e);
    }

    public final int hashCode() {
        int iHashCode = this.f44976a.hashCode() * 31;
        CustomerState customerState = this.f44977b;
        int iHashCode2 = (iHashCode + (customerState == null ? 0 : customerState.hashCode())) * 31;
        PaymentSelection paymentSelection = this.f44978c;
        int iHashCode3 = (iHashCode2 + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31;
        q0 q0Var = this.f44979d;
        return this.f44980e.hashCode() + ((iHashCode3 + (q0Var != null ? q0Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "Full(config=" + this.f44976a + ", customer=" + this.f44977b + ", paymentSelection=" + this.f44978c + ", validationError=" + this.f44979d + ", paymentMethodMetadata=" + this.f44980e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44976a.writeToParcel(dest, i5);
        CustomerState customerState = this.f44977b;
        if (customerState == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            customerState.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f44978c, i5);
        dest.writeSerializable(this.f44979d);
        this.f44980e.writeToParcel(dest, i5);
    }
}
