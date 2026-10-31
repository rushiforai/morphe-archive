package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/DeferredIntentParams;", "Lcom/stripe/android/core/model/StripeModel;", "Mode", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class DeferredIntentParams implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<DeferredIntentParams> CREATOR = new s0();

    /* renamed from: a, reason: collision with root package name */
    public final Mode f43371a;

    /* renamed from: b, reason: collision with root package name */
    public final List f43372b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43373c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43374d;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/DeferredIntentParams$Mode;", "Landroid/os/Parcelable;", "Payment", "Setup", "Lcom/stripe/android/model/DeferredIntentParams$Mode$Payment;", "Lcom/stripe/android/model/DeferredIntentParams$Mode$Setup;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface Mode extends Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/DeferredIntentParams$Mode$Payment;", "Lcom/stripe/android/model/DeferredIntentParams$Mode;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Payment implements Mode {

            @NotNull
            public static final Parcelable.Creator<Payment> CREATOR = new t0();

            /* renamed from: a, reason: collision with root package name */
            public final long f43375a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43376b;

            /* renamed from: c, reason: collision with root package name */
            public final StripeIntent.Usage f43377c;

            /* renamed from: d, reason: collision with root package name */
            public final ft.l0 f43378d;

            /* renamed from: e, reason: collision with root package name */
            public final String f43379e;

            public Payment(long j11, String currency, StripeIntent.Usage usage, ft.l0 captureMethod, String str) {
                Intrinsics.g(currency, "currency");
                Intrinsics.g(captureMethod, "captureMethod");
                this.f43375a = j11;
                this.f43376b = currency;
                this.f43377c = usage;
                this.f43378d = captureMethod;
                this.f43379e = str;
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            public final String A() {
                return "payment";
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            /* renamed from: F, reason: from getter */
            public final StripeIntent.Usage getF43381b() {
                return this.f43377c;
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
                return this.f43375a == payment.f43375a && Intrinsics.b(this.f43376b, payment.f43376b) && this.f43377c == payment.f43377c && this.f43378d == payment.f43378d && Intrinsics.b(this.f43379e, payment.f43379e);
            }

            public final int hashCode() {
                int iE = b.c0.e(Long.hashCode(this.f43375a) * 31, 31, this.f43376b);
                StripeIntent.Usage usage = this.f43377c;
                int iHashCode = (this.f43378d.hashCode() + ((iE + (usage == null ? 0 : usage.hashCode())) * 31)) * 31;
                String str = this.f43379e;
                return iHashCode + (str != null ? str.hashCode() : 0);
            }

            public final String toString() {
                StringBuilder sbL = a80.m.l(this.f43375a, "Payment(amount=", ", currency=", this.f43376b);
                sbL.append(", setupFutureUsage=");
                sbL.append(this.f43377c);
                sbL.append(", captureMethod=");
                sbL.append(this.f43378d);
                return b.c0.r(sbL, ", paymentMethodOptionsJsonString=", this.f43379e, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeLong(this.f43375a);
                dest.writeString(this.f43376b);
                StripeIntent.Usage usage = this.f43377c;
                if (usage == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(usage.name());
                }
                dest.writeString(this.f43378d.name());
                dest.writeString(this.f43379e);
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            /* renamed from: x0, reason: from getter */
            public final String getF43380a() {
                return this.f43376b;
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/DeferredIntentParams$Mode$Setup;", "Lcom/stripe/android/model/DeferredIntentParams$Mode;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Setup implements Mode {

            @NotNull
            public static final Parcelable.Creator<Setup> CREATOR = new u0();

            /* renamed from: a, reason: collision with root package name */
            public final String f43380a;

            /* renamed from: b, reason: collision with root package name */
            public final StripeIntent.Usage f43381b;

            public Setup(String str, StripeIntent.Usage setupFutureUsage) {
                Intrinsics.g(setupFutureUsage, "setupFutureUsage");
                this.f43380a = str;
                this.f43381b = setupFutureUsage;
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            public final String A() {
                return "setup";
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            /* renamed from: F, reason: from getter */
            public final StripeIntent.Usage getF43381b() {
                return this.f43381b;
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
                return Intrinsics.b(this.f43380a, setup.f43380a) && this.f43381b == setup.f43381b;
            }

            public final int hashCode() {
                String str = this.f43380a;
                return this.f43381b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
            }

            public final String toString() {
                return "Setup(currency=" + this.f43380a + ", setupFutureUsage=" + this.f43381b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43380a);
                dest.writeString(this.f43381b.name());
            }

            @Override // com.stripe.android.model.DeferredIntentParams.Mode
            /* renamed from: x0, reason: from getter */
            public final String getF43380a() {
                return this.f43380a;
            }
        }

        String A();

        /* renamed from: F */
        StripeIntent.Usage getF43381b();

        /* renamed from: x0 */
        String getF43380a();
    }

    public DeferredIntentParams(Mode mode, List paymentMethodTypes, String str, String str2) {
        Intrinsics.g(mode, "mode");
        Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
        this.f43371a = mode;
        this.f43372b = paymentMethodTypes;
        this.f43373c = str;
        this.f43374d = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DeferredIntentParams)) {
            return false;
        }
        DeferredIntentParams deferredIntentParams = (DeferredIntentParams) obj;
        return Intrinsics.b(this.f43371a, deferredIntentParams.f43371a) && Intrinsics.b(this.f43372b, deferredIntentParams.f43372b) && Intrinsics.b(this.f43373c, deferredIntentParams.f43373c) && Intrinsics.b(this.f43374d, deferredIntentParams.f43374d);
    }

    public final int hashCode() {
        int iC = b.u4.c(this.f43371a.hashCode() * 31, 31, this.f43372b);
        String str = this.f43373c;
        int iHashCode = (iC + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43374d;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DeferredIntentParams(mode=");
        sb2.append(this.f43371a);
        sb2.append(", paymentMethodTypes=");
        sb2.append(this.f43372b);
        sb2.append(", paymentMethodConfigurationId=");
        return b.c0.s(sb2, this.f43373c, ", onBehalfOf=", this.f43374d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43371a, i5);
        dest.writeStringList(this.f43372b);
        dest.writeString(this.f43373c);
        dest.writeString(this.f43374d);
    }
}
