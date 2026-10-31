package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0005\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "Landroid/os/Parcelable;", "IntentFirst", "DeferredIntent", "CustomerSheet", "CryptoOnramp", "CheckoutSession", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CheckoutSession;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CryptoOnramp;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CustomerSheet;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$IntentFirst;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class IntegrationMetadata implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CheckoutSession;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CheckoutSession extends IntegrationMetadata {

        @NotNull
        public static final Parcelable.Creator<CheckoutSession> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final String f43085a;

        public CheckoutSession(String id2) {
            Intrinsics.g(id2, "id");
            this.f43085a = id2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CheckoutSession) && Intrinsics.b(this.f43085a, ((CheckoutSession) obj).f43085a);
        }

        public final int hashCode() {
            return this.f43085a.hashCode();
        }

        public final String toString() {
            return c0.l("CheckoutSession(id=", this.f43085a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43085a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CryptoOnramp;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class CryptoOnramp extends IntegrationMetadata {

        /* renamed from: a, reason: collision with root package name */
        public static final CryptoOnramp f43086a = new CryptoOnramp();

        @NotNull
        public static final Parcelable.Creator<CryptoOnramp> CREATOR = new g();

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

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$CustomerSheet;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "com/stripe/android/lpmfoundations/paymentmethod/h", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CustomerSheet extends IntegrationMetadata {

        @NotNull
        public static final Parcelable.Creator<CustomerSheet> CREATOR = new i();

        /* renamed from: a, reason: collision with root package name */
        public final h f43087a;

        public CustomerSheet(h attachmentStyle) {
            Intrinsics.g(attachmentStyle, "attachmentStyle");
            this.f43087a = attachmentStyle;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CustomerSheet) && this.f43087a == ((CustomerSheet) obj).f43087a;
        }

        public final int hashCode() {
            return this.f43087a.hashCode();
        }

        public final String toString() {
            return "CustomerSheet(attachmentStyle=" + this.f43087a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43087a.name());
        }
    }

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "WithPaymentMethod", "WithSharedPaymentToken", "WithConfirmationToken", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithConfirmationToken;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithPaymentMethod;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithSharedPaymentToken;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class DeferredIntent extends IntegrationMetadata {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithConfirmationToken;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class WithConfirmationToken extends DeferredIntent {

            @NotNull
            public static final Parcelable.Creator<WithConfirmationToken> CREATOR = new j();

            /* renamed from: a, reason: collision with root package name */
            public final PaymentSheet$IntentConfiguration f43088a;

            public WithConfirmationToken(PaymentSheet$IntentConfiguration intentConfiguration) {
                Intrinsics.g(intentConfiguration, "intentConfiguration");
                this.f43088a = intentConfiguration;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof WithConfirmationToken) && Intrinsics.b(this.f43088a, ((WithConfirmationToken) obj).f43088a);
            }

            public final int hashCode() {
                return this.f43088a.hashCode();
            }

            public final String toString() {
                return "WithConfirmationToken(intentConfiguration=" + this.f43088a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                this.f43088a.writeToParcel(dest, i5);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithPaymentMethod;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class WithPaymentMethod extends DeferredIntent {

            @NotNull
            public static final Parcelable.Creator<WithPaymentMethod> CREATOR = new k();

            /* renamed from: a, reason: collision with root package name */
            public final PaymentSheet$IntentConfiguration f43089a;

            public WithPaymentMethod(PaymentSheet$IntentConfiguration intentConfiguration) {
                Intrinsics.g(intentConfiguration, "intentConfiguration");
                this.f43089a = intentConfiguration;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof WithPaymentMethod) && Intrinsics.b(this.f43089a, ((WithPaymentMethod) obj).f43089a);
            }

            public final int hashCode() {
                return this.f43089a.hashCode();
            }

            public final String toString() {
                return "WithPaymentMethod(intentConfiguration=" + this.f43089a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                this.f43089a.writeToParcel(dest, i5);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent$WithSharedPaymentToken;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$DeferredIntent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class WithSharedPaymentToken extends DeferredIntent {

            @NotNull
            public static final Parcelable.Creator<WithSharedPaymentToken> CREATOR = new l();

            /* renamed from: a, reason: collision with root package name */
            public final PaymentSheet$IntentConfiguration f43090a;

            public WithSharedPaymentToken(PaymentSheet$IntentConfiguration intentConfiguration) {
                Intrinsics.g(intentConfiguration, "intentConfiguration");
                this.f43090a = intentConfiguration;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof WithSharedPaymentToken) && Intrinsics.b(this.f43090a, ((WithSharedPaymentToken) obj).f43090a);
            }

            public final int hashCode() {
                return this.f43090a.hashCode();
            }

            public final String toString() {
                return "WithSharedPaymentToken(intentConfiguration=" + this.f43090a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                this.f43090a.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata$IntentFirst;", "Lcom/stripe/android/lpmfoundations/paymentmethod/IntegrationMetadata;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class IntentFirst extends IntegrationMetadata {

        @NotNull
        public static final Parcelable.Creator<IntentFirst> CREATOR = new m();

        /* renamed from: a, reason: collision with root package name */
        public final String f43091a;

        public IntentFirst(String clientSecret) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f43091a = clientSecret;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof IntentFirst) && Intrinsics.b(this.f43091a, ((IntentFirst) obj).f43091a);
        }

        public final int hashCode() {
            return this.f43091a.hashCode();
        }

        public final String toString() {
            return c0.l("IntentFirst(clientSecret=", this.f43091a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43091a);
        }
    }
}
