package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"com/stripe/android/PaymentRelayStarter$Args", "Landroid/os/Parcelable;", "PaymentIntentArgs", "SetupIntentArgs", "ErrorArgs", "Lcom/stripe/android/PaymentRelayStarter$Args$ErrorArgs;", "Lcom/stripe/android/PaymentRelayStarter$Args$PaymentIntentArgs;", "Lcom/stripe/android/PaymentRelayStarter$Args$SetupIntentArgs;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentRelayStarter$Args implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/PaymentRelayStarter$Args$ErrorArgs;", "Lcom/stripe/android/PaymentRelayStarter$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ErrorArgs extends PaymentRelayStarter$Args {

        @NotNull
        public static final Parcelable.Creator<ErrorArgs> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final StripeException f42445a;

        /* renamed from: b, reason: collision with root package name */
        public final int f42446b;

        public ErrorArgs(StripeException stripeException, int i5) {
            this.f42445a = stripeException;
            this.f42446b = i5;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        /* renamed from: b, reason: from getter */
        public final int getF42446b() {
            return this.f42446b;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        public final PaymentFlowResult$Unvalidated d() {
            return new PaymentFlowResult$Unvalidated((String) null, 0, this.f42445a, false, (String) null, (String) null, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ErrorArgs)) {
                return false;
            }
            ErrorArgs errorArgs = (ErrorArgs) obj;
            return Intrinsics.b(this.f42445a, errorArgs.f42445a) && this.f42446b == errorArgs.f42446b;
        }

        public final int hashCode() {
            return Integer.hashCode(this.f42446b) + (this.f42445a.hashCode() * 31);
        }

        public final String toString() {
            return "ErrorArgs(exception=" + this.f42445a + ", requestCode=" + this.f42446b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42445a);
            dest.writeInt(this.f42446b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/PaymentRelayStarter$Args$PaymentIntentArgs;", "Lcom/stripe/android/PaymentRelayStarter$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentIntentArgs extends PaymentRelayStarter$Args {

        @NotNull
        public static final Parcelable.Creator<PaymentIntentArgs> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentIntent f42447a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42448b;

        public PaymentIntentArgs(PaymentIntent paymentIntent, String str) {
            Intrinsics.g(paymentIntent, "paymentIntent");
            this.f42447a = paymentIntent;
            this.f42448b = str;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        /* renamed from: b */
        public final int getF42446b() {
            return 50000;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        public final PaymentFlowResult$Unvalidated d() {
            return new PaymentFlowResult$Unvalidated(this.f42447a.f43539g, 0, (StripeException) null, false, (String) null, this.f42448b, 62);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PaymentIntentArgs)) {
                return false;
            }
            PaymentIntentArgs paymentIntentArgs = (PaymentIntentArgs) obj;
            return Intrinsics.b(this.f42447a, paymentIntentArgs.f42447a) && Intrinsics.b(this.f42448b, paymentIntentArgs.f42448b);
        }

        public final int hashCode() {
            int iHashCode = this.f42447a.hashCode() * 31;
            String str = this.f42448b;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return "PaymentIntentArgs(paymentIntent=" + this.f42447a + ", stripeAccountId=" + this.f42448b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42447a, i5);
            dest.writeString(this.f42448b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/PaymentRelayStarter$Args$SetupIntentArgs;", "Lcom/stripe/android/PaymentRelayStarter$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupIntentArgs extends PaymentRelayStarter$Args {

        @NotNull
        public static final Parcelable.Creator<SetupIntentArgs> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final SetupIntent f42449a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42450b;

        public SetupIntentArgs(SetupIntent setupIntent, String str) {
            Intrinsics.g(setupIntent, "setupIntent");
            this.f42449a = setupIntent;
            this.f42450b = str;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        /* renamed from: b */
        public final int getF42446b() {
            return 50001;
        }

        @Override // com.stripe.android.PaymentRelayStarter$Args
        public final PaymentFlowResult$Unvalidated d() {
            return new PaymentFlowResult$Unvalidated(this.f42449a.f43767e, 0, (StripeException) null, false, (String) null, this.f42450b, 62);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SetupIntentArgs)) {
                return false;
            }
            SetupIntentArgs setupIntentArgs = (SetupIntentArgs) obj;
            return Intrinsics.b(this.f42449a, setupIntentArgs.f42449a) && Intrinsics.b(this.f42450b, setupIntentArgs.f42450b);
        }

        public final int hashCode() {
            int iHashCode = this.f42449a.hashCode() * 31;
            String str = this.f42450b;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return "SetupIntentArgs(setupIntent=" + this.f42449a + ", stripeAccountId=" + this.f42450b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42449a, i5);
            dest.writeString(this.f42450b);
        }
    }

    /* renamed from: b */
    public abstract int getF42446b();

    public abstract PaymentFlowResult$Unvalidated d();
}
