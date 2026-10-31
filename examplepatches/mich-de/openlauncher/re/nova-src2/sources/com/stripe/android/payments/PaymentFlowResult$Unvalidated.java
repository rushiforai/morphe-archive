package com.stripe.android.payments;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.Source;
import di.b;
import du.c;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/payments/PaymentFlowResult$Unvalidated", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentFlowResult$Unvalidated implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentFlowResult$Unvalidated> CREATOR = new b(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f44237a;

    /* renamed from: b, reason: collision with root package name */
    public final int f44238b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeException f44239c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f44240d;

    /* renamed from: e, reason: collision with root package name */
    public final String f44241e;

    /* renamed from: f, reason: collision with root package name */
    public final Source f44242f;

    /* renamed from: g, reason: collision with root package name */
    public final String f44243g;

    public PaymentFlowResult$Unvalidated(String str, int i5, StripeException stripeException, boolean z11, String str2, Source source, String str3) {
        this.f44237a = str;
        this.f44238b = i5;
        this.f44239c = stripeException;
        this.f44240d = z11;
        this.f44241e = str2;
        this.f44242f = source;
        this.f44243g = str3;
    }

    public final Bundle b() {
        return w.b.a(new Pair("extra_args", this));
    }

    public final c d() throws StripeException {
        StripeException stripeException = this.f44239c;
        if (stripeException != null) {
            throw stripeException;
        }
        String str = this.f44237a;
        if (str == null || k.U0(str)) {
            throw new IllegalArgumentException("Invalid client_secret value in result Intent.");
        }
        return new c(this.f44237a, this.f44238b, this.f44240d, this.f44241e, this.f44242f, this.f44243g);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentFlowResult$Unvalidated)) {
            return false;
        }
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) obj;
        return Intrinsics.b(this.f44237a, paymentFlowResult$Unvalidated.f44237a) && this.f44238b == paymentFlowResult$Unvalidated.f44238b && Intrinsics.b(this.f44239c, paymentFlowResult$Unvalidated.f44239c) && this.f44240d == paymentFlowResult$Unvalidated.f44240d && Intrinsics.b(this.f44241e, paymentFlowResult$Unvalidated.f44241e) && Intrinsics.b(this.f44242f, paymentFlowResult$Unvalidated.f44242f) && Intrinsics.b(this.f44243g, paymentFlowResult$Unvalidated.f44243g);
    }

    public final int hashCode() {
        String str = this.f44237a;
        int iHashCode = (((str == null ? 0 : str.hashCode()) * 31) + this.f44238b) * 31;
        StripeException stripeException = this.f44239c;
        int iF = c9.f((iHashCode + (stripeException == null ? 0 : stripeException.hashCode())) * 31, 31, this.f44240d);
        String str2 = this.f44241e;
        int iHashCode2 = (iF + (str2 == null ? 0 : str2.hashCode())) * 31;
        Source source = this.f44242f;
        int iHashCode3 = (iHashCode2 + (source == null ? 0 : source.hashCode())) * 31;
        String str3 = this.f44243g;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("Unvalidated(clientSecret=", this.f44238b, this.f44237a, ", flowOutcome=", ", exception=");
        sbV.append(this.f44239c);
        sbV.append(", canCancelSource=");
        sbV.append(this.f44240d);
        sbV.append(", sourceId=");
        sbV.append(this.f44241e);
        sbV.append(", source=");
        sbV.append(this.f44242f);
        sbV.append(", stripeAccountId=");
        return c0.q(sbV, this.f44243g, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44237a);
        dest.writeInt(this.f44238b);
        dest.writeSerializable(this.f44239c);
        Integer num = this.f44240d ? 1 : null;
        dest.writeInt(num != null ? num.intValue() : 0);
        dest.writeString(this.f44241e);
        dest.writeParcelable(this.f44242f, i5);
        dest.writeString(this.f44243g);
    }

    public /* synthetic */ PaymentFlowResult$Unvalidated(String str, int i5, StripeException stripeException, boolean z11, String str2, String str3, int i11) {
        this((i11 & 1) != 0 ? null : str, (i11 & 2) != 0 ? 0 : i5, (i11 & 4) != 0 ? null : stripeException, (i11 & 8) != 0 ? false : z11, (i11 & 16) != 0 ? null : str2, (Source) null, (i11 & 64) != 0 ? null : str3);
    }
}
