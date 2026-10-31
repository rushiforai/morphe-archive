package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ConfirmationToken;", "Lcom/stripe/android/core/model/StripeModel;", "PaymentMethodPreview", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ConfirmationToken implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ConfirmationToken> CREATOR = new f();

    /* renamed from: a, reason: collision with root package name */
    public final String f43220a;

    /* renamed from: b, reason: collision with root package name */
    public final long f43221b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f43222c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f43223d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43224e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentMethodPreview f43225f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43226g;

    /* renamed from: h, reason: collision with root package name */
    public final ft.d f43227h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43228i;

    /* renamed from: j, reason: collision with root package name */
    public final ShippingInformation f43229j;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConfirmationToken$PaymentMethodPreview;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class PaymentMethodPreview implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<PaymentMethodPreview> CREATOR = new g();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod.AllowRedisplay f43230a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethod.BillingDetails f43231b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentMethod.Card f43232c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43233d;

        /* renamed from: e, reason: collision with root package name */
        public final PaymentMethod.Type f43234e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43235f;

        public PaymentMethodPreview(PaymentMethod.AllowRedisplay allowRedisplay, PaymentMethod.BillingDetails billingDetails, PaymentMethod.Card card, String str, PaymentMethod.Type type, String allResponseFields) {
            Intrinsics.g(type, "type");
            Intrinsics.g(allResponseFields, "allResponseFields");
            this.f43230a = allowRedisplay;
            this.f43231b = billingDetails;
            this.f43232c = card;
            this.f43233d = str;
            this.f43234e = type;
            this.f43235f = allResponseFields;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PaymentMethodPreview)) {
                return false;
            }
            PaymentMethodPreview paymentMethodPreview = (PaymentMethodPreview) obj;
            return this.f43230a == paymentMethodPreview.f43230a && Intrinsics.b(this.f43231b, paymentMethodPreview.f43231b) && Intrinsics.b(this.f43232c, paymentMethodPreview.f43232c) && Intrinsics.b(this.f43233d, paymentMethodPreview.f43233d) && this.f43234e == paymentMethodPreview.f43234e && Intrinsics.b(this.f43235f, paymentMethodPreview.f43235f);
        }

        public final int hashCode() {
            PaymentMethod.AllowRedisplay allowRedisplay = this.f43230a;
            int iHashCode = (allowRedisplay == null ? 0 : allowRedisplay.hashCode()) * 31;
            PaymentMethod.BillingDetails billingDetails = this.f43231b;
            int iHashCode2 = (iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31;
            PaymentMethod.Card card = this.f43232c;
            int iHashCode3 = (iHashCode2 + (card == null ? 0 : card.hashCode())) * 31;
            String str = this.f43233d;
            return this.f43235f.hashCode() + ((this.f43234e.hashCode() + ((iHashCode3 + (str != null ? str.hashCode() : 0)) * 31)) * 31);
        }

        public final String toString() {
            return "PaymentMethodPreview(allowRedisplay=" + this.f43230a + ", billingDetails=" + this.f43231b + ", card=" + this.f43232c + ", customerId=" + this.f43233d + ", type=" + this.f43234e + ", allResponseFields=" + this.f43235f + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            PaymentMethod.AllowRedisplay allowRedisplay = this.f43230a;
            if (allowRedisplay == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                allowRedisplay.writeToParcel(dest, i5);
            }
            PaymentMethod.BillingDetails billingDetails = this.f43231b;
            if (billingDetails == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                billingDetails.writeToParcel(dest, i5);
            }
            PaymentMethod.Card card = this.f43232c;
            if (card == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                card.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43233d);
            this.f43234e.writeToParcel(dest, i5);
            dest.writeString(this.f43235f);
        }
    }

    public ConfirmationToken(String id2, long j11, Long l9, boolean z11, String str, PaymentMethodPreview paymentMethodPreview, String str2, ft.d dVar, String str3, ShippingInformation shippingInformation) {
        Intrinsics.g(id2, "id");
        this.f43220a = id2;
        this.f43221b = j11;
        this.f43222c = l9;
        this.f43223d = z11;
        this.f43224e = str;
        this.f43225f = paymentMethodPreview;
        this.f43226g = str2;
        this.f43227h = dVar;
        this.f43228i = str3;
        this.f43229j = shippingInformation;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmationToken)) {
            return false;
        }
        ConfirmationToken confirmationToken = (ConfirmationToken) obj;
        return Intrinsics.b(this.f43220a, confirmationToken.f43220a) && this.f43221b == confirmationToken.f43221b && Intrinsics.b(this.f43222c, confirmationToken.f43222c) && this.f43223d == confirmationToken.f43223d && Intrinsics.b(this.f43224e, confirmationToken.f43224e) && Intrinsics.b(this.f43225f, confirmationToken.f43225f) && Intrinsics.b(this.f43226g, confirmationToken.f43226g) && this.f43227h == confirmationToken.f43227h && Intrinsics.b(this.f43228i, confirmationToken.f43228i) && Intrinsics.b(this.f43229j, confirmationToken.f43229j);
    }

    public final int hashCode() {
        int iD = b.c0.d(this.f43220a.hashCode() * 31, 31, this.f43221b);
        Long l9 = this.f43222c;
        int iF = c9.f((iD + (l9 == null ? 0 : l9.hashCode())) * 31, 31, this.f43223d);
        String str = this.f43224e;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        PaymentMethodPreview paymentMethodPreview = this.f43225f;
        int iHashCode2 = (iHashCode + (paymentMethodPreview == null ? 0 : paymentMethodPreview.hashCode())) * 31;
        String str2 = this.f43226g;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        ft.d dVar = this.f43227h;
        int iHashCode4 = (iHashCode3 + (dVar == null ? 0 : dVar.hashCode())) * 31;
        String str3 = this.f43228i;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        ShippingInformation shippingInformation = this.f43229j;
        return iHashCode5 + (shippingInformation != null ? shippingInformation.hashCode() : 0);
    }

    public final String toString() {
        return "ConfirmationToken(id=" + this.f43220a + ", created=" + this.f43221b + ", expiresAt=" + this.f43222c + ", liveMode=" + this.f43223d + ", paymentIntentId=" + this.f43224e + ", paymentMethodPreview=" + this.f43225f + ", returnUrl=" + this.f43226g + ", setupFutureUsage=" + this.f43227h + ", setupIntentId=" + this.f43228i + ", shipping=" + this.f43229j + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43220a);
        dest.writeLong(this.f43221b);
        Long l9 = this.f43222c;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeInt(this.f43223d ? 1 : 0);
        dest.writeString(this.f43224e);
        PaymentMethodPreview paymentMethodPreview = this.f43225f;
        if (paymentMethodPreview == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethodPreview.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43226g);
        ft.d dVar = this.f43227h;
        if (dVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(dVar.name());
        }
        dest.writeString(this.f43228i);
        ShippingInformation shippingInformation = this.f43229j;
        if (shippingInformation == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shippingInformation.writeToParcel(dest, i5);
        }
    }
}
