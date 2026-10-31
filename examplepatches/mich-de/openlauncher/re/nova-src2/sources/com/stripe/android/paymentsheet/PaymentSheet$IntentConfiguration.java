package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b.u4;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration", "Landroid/os/Parcelable;", "Mode", "ou/t0", "ou/s0", "SellerDetails", "IntentBehavior", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$IntentConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$IntentConfiguration> CREATOR = new a0();

    /* renamed from: a, reason: collision with root package name */
    public final Mode f44588a;

    /* renamed from: b, reason: collision with root package name */
    public final List f44589b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44590c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44591d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f44592e;

    /* renamed from: f, reason: collision with root package name */
    public final IntentBehavior f44593f;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior;", "Landroid/os/Parcelable;", "Default", "SharedPaymentToken", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior$Default;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior$SharedPaymentToken;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface IntentBehavior extends Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior$Default;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Default implements IntentBehavior {

            /* renamed from: a, reason: collision with root package name */
            public static final Default f44594a = new Default();

            @NotNull
            public static final Parcelable.Creator<Default> CREATOR = new b0();

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return this == obj || (obj instanceof Default);
            }

            public final int hashCode() {
                return -131175288;
            }

            public final String toString() {
                return "Default";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(1);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior$SharedPaymentToken;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$IntentBehavior;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class SharedPaymentToken implements IntentBehavior {

            @NotNull
            public static final Parcelable.Creator<SharedPaymentToken> CREATOR = new c0();

            /* renamed from: a, reason: collision with root package name */
            public final SellerDetails f44595a;

            public SharedPaymentToken(SellerDetails sellerDetails) {
                this.f44595a = sellerDetails;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof SharedPaymentToken) && Intrinsics.b(this.f44595a, ((SharedPaymentToken) obj).f44595a);
            }

            public final int hashCode() {
                SellerDetails sellerDetails = this.f44595a;
                if (sellerDetails == null) {
                    return 0;
                }
                return sellerDetails.hashCode();
            }

            public final String toString() {
                return "SharedPaymentToken(sellerDetails=" + this.f44595a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                SellerDetails sellerDetails = this.f44595a;
                if (sellerDetails == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    sellerDetails.writeToParcel(dest, i5);
                }
            }
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode;", "Landroid/os/Parcelable;", "Payment", "Setup", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode$Payment;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode$Setup;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Mode implements Parcelable {

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode$Payment;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode;", "PaymentMethodOptions", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Payment extends Mode {

            @NotNull
            public static final Parcelable.Creator<Payment> CREATOR = new d0();

            /* renamed from: a, reason: collision with root package name */
            public final long f44596a;

            /* renamed from: b, reason: collision with root package name */
            public final String f44597b;

            /* renamed from: c, reason: collision with root package name */
            public final ou.t0 f44598c;

            /* renamed from: d, reason: collision with root package name */
            public final ou.s0 f44599d;

            /* renamed from: e, reason: collision with root package name */
            public final PaymentMethodOptions f44600e;

            @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode$Payment$PaymentMethodOptions;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class PaymentMethodOptions implements Parcelable {

                @NotNull
                public static final Parcelable.Creator<PaymentMethodOptions> CREATOR = new e0();

                /* renamed from: a, reason: collision with root package name */
                public final LinkedHashMap f44601a;

                public PaymentMethodOptions(LinkedHashMap linkedHashMap) {
                    this.f44601a = linkedHashMap;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    return (obj instanceof PaymentMethodOptions) && this.f44601a.equals(((PaymentMethodOptions) obj).f44601a);
                }

                public final int hashCode() {
                    return this.f44601a.hashCode();
                }

                public final String toString() {
                    return "PaymentMethodOptions(setupFutureUsageValues=" + this.f44601a + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    LinkedHashMap linkedHashMap = this.f44601a;
                    dest.writeInt(linkedHashMap.size());
                    for (Map.Entry entry : linkedHashMap.entrySet()) {
                        dest.writeParcelable((Parcelable) entry.getKey(), i5);
                        dest.writeString(((ou.t0) entry.getValue()).name());
                    }
                }
            }

            public Payment(long j11, String currency, ou.t0 t0Var, ou.s0 captureMethod, PaymentMethodOptions paymentMethodOptions) {
                Intrinsics.g(currency, "currency");
                Intrinsics.g(captureMethod, "captureMethod");
                this.f44596a = j11;
                this.f44597b = currency;
                this.f44598c = t0Var;
                this.f44599d = captureMethod;
                this.f44600e = paymentMethodOptions;
            }

            @Override // com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration.Mode
            /* renamed from: b, reason: from getter */
            public final ou.t0 getF44603b() {
                return this.f44598c;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Payment)) {
                    return false;
                }
                Payment payment = (Payment) obj;
                return this.f44596a == payment.f44596a && Intrinsics.b(this.f44597b, payment.f44597b) && this.f44598c == payment.f44598c && this.f44599d == payment.f44599d && Intrinsics.b(this.f44600e, payment.f44600e);
            }

            public final int hashCode() {
                int iE = b.c0.e(Long.hashCode(this.f44596a) * 31, 31, this.f44597b);
                ou.t0 t0Var = this.f44598c;
                int iHashCode = (this.f44599d.hashCode() + ((iE + (t0Var == null ? 0 : t0Var.hashCode())) * 31)) * 31;
                PaymentMethodOptions paymentMethodOptions = this.f44600e;
                return iHashCode + (paymentMethodOptions != null ? paymentMethodOptions.f44601a.hashCode() : 0);
            }

            public final String toString() {
                StringBuilder sbL = a80.m.l(this.f44596a, "Payment(amount=", ", currency=", this.f44597b);
                sbL.append(", setupFutureUse=");
                sbL.append(this.f44598c);
                sbL.append(", captureMethod=");
                sbL.append(this.f44599d);
                sbL.append(", paymentMethodOptions=");
                sbL.append(this.f44600e);
                sbL.append(")");
                return sbL.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeLong(this.f44596a);
                dest.writeString(this.f44597b);
                ou.t0 t0Var = this.f44598c;
                if (t0Var == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(t0Var.name());
                }
                dest.writeString(this.f44599d.name());
                PaymentMethodOptions paymentMethodOptions = this.f44600e;
                if (paymentMethodOptions == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    paymentMethodOptions.writeToParcel(dest, i5);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode$Setup;", "Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$Mode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Setup extends Mode {

            @NotNull
            public static final Parcelable.Creator<Setup> CREATOR = new f0();

            /* renamed from: a, reason: collision with root package name */
            public final String f44602a;

            /* renamed from: b, reason: collision with root package name */
            public final ou.t0 f44603b;

            public Setup(String str, ou.t0 setupFutureUse) {
                Intrinsics.g(setupFutureUse, "setupFutureUse");
                this.f44602a = str;
                this.f44603b = setupFutureUse;
            }

            @Override // com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration.Mode
            /* renamed from: b, reason: from getter */
            public final ou.t0 getF44603b() {
                return this.f44603b;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Setup)) {
                    return false;
                }
                Setup setup = (Setup) obj;
                return Intrinsics.b(this.f44602a, setup.f44602a) && this.f44603b == setup.f44603b;
            }

            public final int hashCode() {
                String str = this.f44602a;
                return this.f44603b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
            }

            public final String toString() {
                return "Setup(currency=" + this.f44602a + ", setupFutureUse=" + this.f44603b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44602a);
                dest.writeString(this.f44603b.name());
            }
        }

        /* renamed from: b */
        public abstract ou.t0 getF44603b();
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$IntentConfiguration$SellerDetails;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SellerDetails implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<SellerDetails> CREATOR = new g0();

        /* renamed from: a, reason: collision with root package name */
        public final String f44604a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44605b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44606c;

        public SellerDetails(String businessName, String networkId, String externalId) {
            Intrinsics.g(businessName, "businessName");
            Intrinsics.g(networkId, "networkId");
            Intrinsics.g(externalId, "externalId");
            this.f44604a = businessName;
            this.f44605b = networkId;
            this.f44606c = externalId;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SellerDetails)) {
                return false;
            }
            SellerDetails sellerDetails = (SellerDetails) obj;
            return Intrinsics.b(this.f44604a, sellerDetails.f44604a) && Intrinsics.b(this.f44605b, sellerDetails.f44605b) && Intrinsics.b(this.f44606c, sellerDetails.f44606c);
        }

        public final int hashCode() {
            return this.f44606c.hashCode() + b.c0.e(this.f44604a.hashCode() * 31, 31, this.f44605b);
        }

        public final String toString() {
            return b.c0.q(b.c0.w("SellerDetails(businessName=", this.f44604a, ", networkId=", this.f44605b, ", externalId="), this.f44606c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44604a);
            dest.writeString(this.f44605b);
            dest.writeString(this.f44606c);
        }
    }

    public PaymentSheet$IntentConfiguration(Mode mode, List paymentMethodTypes, String str, String str2, boolean z11, IntentBehavior intentBehavior) {
        Intrinsics.g(mode, "mode");
        Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
        Intrinsics.g(intentBehavior, "intentBehavior");
        this.f44588a = mode;
        this.f44589b = paymentMethodTypes;
        this.f44590c = str;
        this.f44591d = str2;
        this.f44592e = z11;
        this.f44593f = intentBehavior;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$IntentConfiguration)) {
            return false;
        }
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration = (PaymentSheet$IntentConfiguration) obj;
        return Intrinsics.b(this.f44588a, paymentSheet$IntentConfiguration.f44588a) && Intrinsics.b(this.f44589b, paymentSheet$IntentConfiguration.f44589b) && Intrinsics.b(this.f44590c, paymentSheet$IntentConfiguration.f44590c) && Intrinsics.b(this.f44591d, paymentSheet$IntentConfiguration.f44591d) && this.f44592e == paymentSheet$IntentConfiguration.f44592e && Intrinsics.b(this.f44593f, paymentSheet$IntentConfiguration.f44593f);
    }

    public final int hashCode() {
        int iC = u4.c(this.f44588a.hashCode() * 31, 31, this.f44589b);
        String str = this.f44590c;
        int iHashCode = (iC + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f44591d;
        return this.f44593f.hashCode() + c9.f((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31, 31, this.f44592e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IntentConfiguration(mode=");
        sb2.append(this.f44588a);
        sb2.append(", paymentMethodTypes=");
        sb2.append(this.f44589b);
        sb2.append(", paymentMethodConfigurationId=");
        b.c0.D(sb2, this.f44590c, ", onBehalfOf=", this.f44591d, ", requireCvcRecollection=");
        sb2.append(this.f44592e);
        sb2.append(", intentBehavior=");
        sb2.append(this.f44593f);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44588a, i5);
        dest.writeStringList(this.f44589b);
        dest.writeString(this.f44590c);
        dest.writeString(this.f44591d);
        dest.writeInt(this.f44592e ? 1 : 0);
        dest.writeParcelable(this.f44593f, i5);
    }
}
