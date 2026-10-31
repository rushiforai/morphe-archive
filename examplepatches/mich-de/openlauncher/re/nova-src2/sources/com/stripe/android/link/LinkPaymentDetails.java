package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/LinkPaymentDetails;", "Landroid/os/Parcelable;", "Saved", "New", "Lcom/stripe/android/link/LinkPaymentDetails$New;", "Lcom/stripe/android/link/LinkPaymentDetails$Saved;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class LinkPaymentDetails implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkPaymentDetails$New;", "Lcom/stripe/android/link/LinkPaymentDetails;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class New extends LinkPaymentDetails {

        @NotNull
        public static final Parcelable.Creator<New> CREATOR = new z();

        /* renamed from: a, reason: collision with root package name */
        public final ConsumerPaymentDetails.PaymentDetails f42935a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethodCreateParams f42936b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentMethodCreateParams f42937c;

        public New(ConsumerPaymentDetails.PaymentDetails paymentDetails, PaymentMethodCreateParams paymentMethodCreateParams, PaymentMethodCreateParams originalParams) {
            Intrinsics.g(paymentDetails, "paymentDetails");
            Intrinsics.g(paymentMethodCreateParams, "paymentMethodCreateParams");
            Intrinsics.g(originalParams, "originalParams");
            this.f42935a = paymentDetails;
            this.f42936b = paymentMethodCreateParams;
            this.f42937c = originalParams;
        }

        @Override // com.stripe.android.link.LinkPaymentDetails
        /* renamed from: b, reason: from getter */
        public final ConsumerPaymentDetails.PaymentDetails getF42935a() {
            return this.f42935a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42935a, i5);
            dest.writeParcelable(this.f42936b, i5);
            dest.writeParcelable(this.f42937c, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkPaymentDetails$Saved;", "Lcom/stripe/android/link/LinkPaymentDetails;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Saved extends LinkPaymentDetails {

        @NotNull
        public static final Parcelable.Creator<Saved> CREATOR = new a0();

        /* renamed from: a, reason: collision with root package name */
        public final ConsumerPaymentDetails.Passthrough f42938a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethodCreateParams f42939b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentMethod f42940c;

        public Saved(ConsumerPaymentDetails.Passthrough paymentDetails, PaymentMethodCreateParams paymentMethodCreateParams, PaymentMethod paymentMethod) {
            Intrinsics.g(paymentDetails, "paymentDetails");
            Intrinsics.g(paymentMethodCreateParams, "paymentMethodCreateParams");
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f42938a = paymentDetails;
            this.f42939b = paymentMethodCreateParams;
            this.f42940c = paymentMethod;
        }

        @Override // com.stripe.android.link.LinkPaymentDetails
        /* renamed from: b */
        public final ConsumerPaymentDetails.PaymentDetails getF42935a() {
            return this.f42938a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42938a, i5);
            dest.writeParcelable(this.f42939b, i5);
            dest.writeParcelable(this.f42940c, i5);
        }
    }

    /* renamed from: b */
    public abstract ConsumerPaymentDetails.PaymentDetails getF42935a();
}
