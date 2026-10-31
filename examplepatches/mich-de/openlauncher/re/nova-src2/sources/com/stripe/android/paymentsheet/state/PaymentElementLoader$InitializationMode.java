package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.lpmfoundations.paymentmethod.IntegrationMetadata;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import com.stripe.android.paymentsheet.model.PaymentIntentClientSecret;
import com.stripe.android.paymentsheet.model.SetupIntentClientSecret;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0005\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"com/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode", "Landroid/os/Parcelable;", "PaymentIntent", "SetupIntent", "DeferredIntent", "CryptoOnramp", "CheckoutSession", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$CheckoutSession;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$CryptoOnramp;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$DeferredIntent;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$PaymentIntent;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$SetupIntent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentElementLoader$InitializationMode implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$CheckoutSession;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CheckoutSession extends PaymentElementLoader$InitializationMode {

        @NotNull
        public static final Parcelable.Creator<CheckoutSession> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final String f44966a;

        public CheckoutSession(String clientSecret) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f44966a = clientSecret;
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final IntegrationMetadata b() {
            String str = this.f44966a;
            return new IntegrationMetadata.CheckoutSession(k.p1(str, "_secret_", str));
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final void d() {
            String str = this.f44966a;
            if (!r70.j.I0(str, "cs_", false) || !k.K0(str, "_secret_", false)) {
                throw new IllegalArgumentException("Must use a checkout session client secret.");
            }
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CheckoutSession) && Intrinsics.b(this.f44966a, ((CheckoutSession) obj).f44966a);
        }

        public final int hashCode() {
            return this.f44966a.hashCode();
        }

        public final String toString() {
            return c0.l("CheckoutSession(clientSecret=", this.f44966a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44966a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$CryptoOnramp;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class CryptoOnramp extends PaymentElementLoader$InitializationMode {

        /* renamed from: a, reason: collision with root package name */
        public static final CryptoOnramp f44967a = new CryptoOnramp();

        @NotNull
        public static final Parcelable.Creator<CryptoOnramp> CREATOR = new g();

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final IntegrationMetadata b() {
            return IntegrationMetadata.CryptoOnramp.f43086a;
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final void d() {
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$DeferredIntent;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DeferredIntent extends PaymentElementLoader$InitializationMode {

        @NotNull
        public static final Parcelable.Creator<DeferredIntent> CREATOR = new h();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$IntentConfiguration f44968a;

        public DeferredIntent(PaymentSheet$IntentConfiguration intentConfiguration) {
            Intrinsics.g(intentConfiguration, "intentConfiguration");
            this.f44968a = intentConfiguration;
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final IntegrationMetadata b() {
            throw new IllegalStateException("No callback for deferred intent.");
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final void d() {
            PaymentSheet$IntentConfiguration.Mode mode = this.f44968a.f44588a;
            PaymentSheet$IntentConfiguration.Mode.Payment payment = mode instanceof PaymentSheet$IntentConfiguration.Mode.Payment ? (PaymentSheet$IntentConfiguration.Mode.Payment) mode : null;
            if (payment != null && payment.f44596a <= 0) {
                throw new IllegalArgumentException("Payment IntentConfiguration requires a positive amount.");
            }
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof DeferredIntent) && Intrinsics.b(this.f44968a, ((DeferredIntent) obj).f44968a);
        }

        public final int hashCode() {
            return this.f44968a.hashCode();
        }

        public final String toString() {
            return "DeferredIntent(intentConfiguration=" + this.f44968a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f44968a.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$PaymentIntent;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentIntent extends PaymentElementLoader$InitializationMode {

        @NotNull
        public static final Parcelable.Creator<PaymentIntent> CREATOR = new i();

        /* renamed from: a, reason: collision with root package name */
        public final String f44969a;

        public PaymentIntent(String clientSecret) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f44969a = clientSecret;
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final IntegrationMetadata b() {
            return new IntegrationMetadata.IntentFirst(this.f44969a);
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final void d() {
            String str = this.f44969a;
            new PaymentIntentClientSecret(str);
            if (k.U0(str)) {
                throw new IllegalArgumentException("The PaymentIntent client_secret cannot be an empty string.");
            }
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof PaymentIntent) && Intrinsics.b(this.f44969a, ((PaymentIntent) obj).f44969a);
        }

        public final int hashCode() {
            return this.f44969a.hashCode();
        }

        public final String toString() {
            return c0.l("PaymentIntent(clientSecret=", this.f44969a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44969a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode$SetupIntent;", "Lcom/stripe/android/paymentsheet/state/PaymentElementLoader$InitializationMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupIntent extends PaymentElementLoader$InitializationMode {

        @NotNull
        public static final Parcelable.Creator<SetupIntent> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final String f44970a;

        public SetupIntent(String clientSecret) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f44970a = clientSecret;
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final IntegrationMetadata b() {
            return new IntegrationMetadata.IntentFirst(this.f44970a);
        }

        @Override // com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode
        public final void d() {
            String str = this.f44970a;
            new SetupIntentClientSecret(str);
            if (k.U0(str)) {
                throw new IllegalArgumentException("The SetupIntent client_secret cannot be an empty string.");
            }
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SetupIntent) && Intrinsics.b(this.f44970a, ((SetupIntent) obj).f44970a);
        }

        public final int hashCode() {
            return this.f44970a.hashCode();
        }

        public final String toString() {
            return c0.l("SetupIntent(clientSecret=", this.f44970a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44970a);
        }
    }

    public abstract IntegrationMetadata b();

    public abstract void d();
}
