package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/CheckoutSessionResponse;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CheckoutSessionResponse implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<CheckoutSessionResponse> CREATOR = new eh.a(18);

    /* renamed from: a, reason: collision with root package name */
    public final String f43176a;

    /* renamed from: b, reason: collision with root package name */
    public final long f43177b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43178c;

    /* renamed from: d, reason: collision with root package name */
    public final ElementsSession f43179d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentIntent f43180e;

    public CheckoutSessionResponse(String id2, long j11, String currency, ElementsSession elementsSession, PaymentIntent paymentIntent) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(currency, "currency");
        this.f43176a = id2;
        this.f43177b = j11;
        this.f43178c = currency;
        this.f43179d = elementsSession;
        this.f43180e = paymentIntent;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CheckoutSessionResponse)) {
            return false;
        }
        CheckoutSessionResponse checkoutSessionResponse = (CheckoutSessionResponse) obj;
        return Intrinsics.b(this.f43176a, checkoutSessionResponse.f43176a) && this.f43177b == checkoutSessionResponse.f43177b && Intrinsics.b(this.f43178c, checkoutSessionResponse.f43178c) && Intrinsics.b(this.f43179d, checkoutSessionResponse.f43179d) && Intrinsics.b(this.f43180e, checkoutSessionResponse.f43180e);
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.d(this.f43176a.hashCode() * 31, 31, this.f43177b), 31, this.f43178c);
        ElementsSession elementsSession = this.f43179d;
        int iHashCode = (iE + (elementsSession == null ? 0 : elementsSession.hashCode())) * 31;
        PaymentIntent paymentIntent = this.f43180e;
        return iHashCode + (paymentIntent != null ? paymentIntent.hashCode() : 0);
    }

    public final String toString() {
        return "CheckoutSessionResponse(id=" + this.f43176a + ", amount=" + this.f43177b + ", currency=" + this.f43178c + ", elementsSession=" + this.f43179d + ", paymentIntent=" + this.f43180e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43176a);
        dest.writeLong(this.f43177b);
        dest.writeString(this.f43178c);
        dest.writeParcelable(this.f43179d, i5);
        dest.writeParcelable(this.f43180e, i5);
    }
}
