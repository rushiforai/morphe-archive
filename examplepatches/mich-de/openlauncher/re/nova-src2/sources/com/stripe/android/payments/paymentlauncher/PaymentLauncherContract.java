package com.stripe.android.payments.paymentlauncher;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import h6.c1;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import n0.w;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract;", "Lk/b;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult;", "<init>", "()V", "Args", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentLauncherContract extends k.b {

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0005\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "Landroid/os/Parcelable;", "IntentConfirmationArgs", "PaymentIntentNextActionArgs", "SetupIntentNextActionArgs", "StripeIntentNextActionWithIntentArgs", "HashedPaymentIntentNextActionArgs", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$HashedPaymentIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$IntentConfirmationArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$PaymentIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$SetupIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$StripeIntentNextActionWithIntentArgs;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Args implements Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$HashedPaymentIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        @SourceDebugExtension
        public static final /* data */ class HashedPaymentIntentNextActionArgs extends Args {

            @NotNull
            public static final Parcelable.Creator<HashedPaymentIntentNextActionArgs> CREATOR = new d();

            /* renamed from: a, reason: collision with root package name */
            public final String f44354a;

            /* renamed from: b, reason: collision with root package name */
            public final boolean f44355b;

            /* renamed from: c, reason: collision with root package name */
            public final LinkedHashSet f44356c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f44357d;

            /* renamed from: e, reason: collision with root package name */
            public final String f44358e;

            /* renamed from: f, reason: collision with root package name */
            public final Integer f44359f;

            /* renamed from: g, reason: collision with root package name */
            public final a70.d f44360g;

            public HashedPaymentIntentNextActionArgs(String str, boolean z11, LinkedHashSet linkedHashSet, boolean z12, String hashedValue, Integer num) {
                Intrinsics.g(hashedValue, "hashedValue");
                this.f44354a = str;
                this.f44355b = z11;
                this.f44356c = linkedHashSet;
                this.f44357d = z12;
                this.f44358e = hashedValue;
                this.f44359f = num;
                this.f44360g = LazyKt.a(new w(this, 1));
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44384c() {
                return this.f44355b;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: d, reason: from getter */
            public final boolean getF44386e() {
                return this.f44357d;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: e */
            public final Set getF44385d() {
                return this.f44356c;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof HashedPaymentIntentNextActionArgs)) {
                    return false;
                }
                HashedPaymentIntentNextActionArgs hashedPaymentIntentNextActionArgs = (HashedPaymentIntentNextActionArgs) obj;
                return Intrinsics.b(this.f44354a, hashedPaymentIntentNextActionArgs.f44354a) && this.f44355b == hashedPaymentIntentNextActionArgs.f44355b && this.f44356c.equals(hashedPaymentIntentNextActionArgs.f44356c) && this.f44357d == hashedPaymentIntentNextActionArgs.f44357d && Intrinsics.b(this.f44358e, hashedPaymentIntentNextActionArgs.f44358e) && Intrinsics.b(this.f44359f, hashedPaymentIntentNextActionArgs.f44359f);
            }

            public final int hashCode() {
                String str = this.f44354a;
                int iE = c0.e(c9.f((this.f44356c.hashCode() + c9.f((str == null ? 0 : str.hashCode()) * 31, 31, this.f44355b)) * 31, 31, this.f44357d), 31, this.f44358e);
                Integer num = this.f44359f;
                return iE + (num != null ? num.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: i */
            public final String getF44382a() {
                String str;
                Object obj = ((Result) this.f44360g.getValue()).f71688a;
                if (obj instanceof Result.Failure) {
                    obj = null;
                }
                Pair pair = (Pair) obj;
                return (pair == null || (str = (String) pair.f71683a) == null) ? "UNKNOWN" : str;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: l, reason: from getter */
            public final Integer getF44388g() {
                return this.f44359f;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: m, reason: from getter */
            public final String getF44383b() {
                return this.f44354a;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            public final Object p() {
                Object obj = ((Result) this.f44360g.getValue()).f71688a;
                if (obj instanceof Result.Failure) {
                    return obj;
                }
                int i5 = Result.f71687b;
                return Unit.f71706a;
            }

            public final String toString() {
                return "HashedPaymentIntentNextActionArgs(stripeAccountId=" + this.f44354a + ", enableLogging=" + this.f44355b + ", productUsage=" + this.f44356c + ", includePaymentSheetNextHandlers=" + this.f44357d + ", hashedValue=" + this.f44358e + ", statusBarColor=" + this.f44359f + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44354a);
                dest.writeInt(this.f44355b ? 1 : 0);
                LinkedHashSet linkedHashSet = this.f44356c;
                dest.writeInt(linkedHashSet.size());
                Iterator it = linkedHashSet.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f44357d ? 1 : 0);
                dest.writeString(this.f44358e);
                Integer num = this.f44359f;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$IntentConfirmationArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class IntentConfirmationArgs extends Args {

            @NotNull
            public static final Parcelable.Creator<IntentConfirmationArgs> CREATOR = new e();

            /* renamed from: a, reason: collision with root package name */
            public final String f44361a;

            /* renamed from: b, reason: collision with root package name */
            public final String f44362b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f44363c;

            /* renamed from: d, reason: collision with root package name */
            public final Set f44364d;

            /* renamed from: e, reason: collision with root package name */
            public final boolean f44365e;

            /* renamed from: f, reason: collision with root package name */
            public final ConfirmStripeIntentParams f44366f;

            /* renamed from: g, reason: collision with root package name */
            public final Integer f44367g;

            public IntentConfirmationArgs(String publishableKey, String str, boolean z11, Set productUsage, boolean z12, ConfirmStripeIntentParams confirmStripeIntentParams, Integer num) {
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(productUsage, "productUsage");
                Intrinsics.g(confirmStripeIntentParams, "confirmStripeIntentParams");
                this.f44361a = publishableKey;
                this.f44362b = str;
                this.f44363c = z11;
                this.f44364d = productUsage;
                this.f44365e = z12;
                this.f44366f = confirmStripeIntentParams;
                this.f44367g = num;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44384c() {
                return this.f44363c;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: d, reason: from getter */
            public final boolean getF44386e() {
                return this.f44365e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: e, reason: from getter */
            public final Set getF44385d() {
                return this.f44364d;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof IntentConfirmationArgs)) {
                    return false;
                }
                IntentConfirmationArgs intentConfirmationArgs = (IntentConfirmationArgs) obj;
                return Intrinsics.b(this.f44361a, intentConfirmationArgs.f44361a) && Intrinsics.b(this.f44362b, intentConfirmationArgs.f44362b) && this.f44363c == intentConfirmationArgs.f44363c && Intrinsics.b(this.f44364d, intentConfirmationArgs.f44364d) && this.f44365e == intentConfirmationArgs.f44365e && Intrinsics.b(this.f44366f, intentConfirmationArgs.f44366f) && Intrinsics.b(this.f44367g, intentConfirmationArgs.f44367g);
            }

            public final int hashCode() {
                int iHashCode = this.f44361a.hashCode() * 31;
                String str = this.f44362b;
                int iHashCode2 = (this.f44366f.hashCode() + c9.f(c1.k(this.f44364d, c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44363c), 31), 31, this.f44365e)) * 31;
                Integer num = this.f44367g;
                return iHashCode2 + (num != null ? num.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44382a() {
                return this.f44361a;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: l, reason: from getter */
            public final Integer getF44388g() {
                return this.f44367g;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: m, reason: from getter */
            public final String getF44383b() {
                return this.f44362b;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            public final Object p() {
                int i5 = Result.f71687b;
                return Unit.f71706a;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("IntentConfirmationArgs(publishableKey=", this.f44361a, ", stripeAccountId=", this.f44362b, ", enableLogging=");
                sbW.append(this.f44363c);
                sbW.append(", productUsage=");
                sbW.append(this.f44364d);
                sbW.append(", includePaymentSheetNextHandlers=");
                sbW.append(this.f44365e);
                sbW.append(", confirmStripeIntentParams=");
                sbW.append(this.f44366f);
                sbW.append(", statusBarColor=");
                sbW.append(this.f44367g);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44361a);
                dest.writeString(this.f44362b);
                dest.writeInt(this.f44363c ? 1 : 0);
                Set set = this.f44364d;
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f44365e ? 1 : 0);
                dest.writeParcelable(this.f44366f, i5);
                Integer num = this.f44367g;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$PaymentIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class PaymentIntentNextActionArgs extends Args {

            @NotNull
            public static final Parcelable.Creator<PaymentIntentNextActionArgs> CREATOR = new f();

            /* renamed from: a, reason: collision with root package name */
            public final String f44368a;

            /* renamed from: b, reason: collision with root package name */
            public final String f44369b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f44370c;

            /* renamed from: d, reason: collision with root package name */
            public final LinkedHashSet f44371d;

            /* renamed from: e, reason: collision with root package name */
            public final boolean f44372e;

            /* renamed from: f, reason: collision with root package name */
            public final String f44373f;

            /* renamed from: g, reason: collision with root package name */
            public final Integer f44374g;

            public PaymentIntentNextActionArgs(String publishableKey, String str, boolean z11, LinkedHashSet linkedHashSet, boolean z12, String paymentIntentClientSecret, Integer num) {
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(paymentIntentClientSecret, "paymentIntentClientSecret");
                this.f44368a = publishableKey;
                this.f44369b = str;
                this.f44370c = z11;
                this.f44371d = linkedHashSet;
                this.f44372e = z12;
                this.f44373f = paymentIntentClientSecret;
                this.f44374g = num;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44384c() {
                return this.f44370c;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: d, reason: from getter */
            public final boolean getF44386e() {
                return this.f44372e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: e */
            public final Set getF44385d() {
                return this.f44371d;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof PaymentIntentNextActionArgs)) {
                    return false;
                }
                PaymentIntentNextActionArgs paymentIntentNextActionArgs = (PaymentIntentNextActionArgs) obj;
                return Intrinsics.b(this.f44368a, paymentIntentNextActionArgs.f44368a) && Intrinsics.b(this.f44369b, paymentIntentNextActionArgs.f44369b) && this.f44370c == paymentIntentNextActionArgs.f44370c && this.f44371d.equals(paymentIntentNextActionArgs.f44371d) && this.f44372e == paymentIntentNextActionArgs.f44372e && Intrinsics.b(this.f44373f, paymentIntentNextActionArgs.f44373f) && Intrinsics.b(this.f44374g, paymentIntentNextActionArgs.f44374g);
            }

            public final int hashCode() {
                int iHashCode = this.f44368a.hashCode() * 31;
                String str = this.f44369b;
                int iE = c0.e(c9.f((this.f44371d.hashCode() + c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44370c)) * 31, 31, this.f44372e), 31, this.f44373f);
                Integer num = this.f44374g;
                return iE + (num != null ? num.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44382a() {
                return this.f44368a;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: l, reason: from getter */
            public final Integer getF44388g() {
                return this.f44374g;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: m, reason: from getter */
            public final String getF44383b() {
                return this.f44369b;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            public final Object p() {
                int i5 = Result.f71687b;
                return Unit.f71706a;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("PaymentIntentNextActionArgs(publishableKey=", this.f44368a, ", stripeAccountId=", this.f44369b, ", enableLogging=");
                sbW.append(this.f44370c);
                sbW.append(", productUsage=");
                sbW.append(this.f44371d);
                sbW.append(", includePaymentSheetNextHandlers=");
                c9.s(", paymentIntentClientSecret=", this.f44373f, ", statusBarColor=", sbW, this.f44372e);
                sbW.append(this.f44374g);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44368a);
                dest.writeString(this.f44369b);
                dest.writeInt(this.f44370c ? 1 : 0);
                LinkedHashSet linkedHashSet = this.f44371d;
                dest.writeInt(linkedHashSet.size());
                Iterator it = linkedHashSet.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f44372e ? 1 : 0);
                dest.writeString(this.f44373f);
                Integer num = this.f44374g;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$SetupIntentNextActionArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class SetupIntentNextActionArgs extends Args {

            @NotNull
            public static final Parcelable.Creator<SetupIntentNextActionArgs> CREATOR = new g();

            /* renamed from: a, reason: collision with root package name */
            public final String f44375a;

            /* renamed from: b, reason: collision with root package name */
            public final String f44376b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f44377c;

            /* renamed from: d, reason: collision with root package name */
            public final LinkedHashSet f44378d;

            /* renamed from: e, reason: collision with root package name */
            public final boolean f44379e;

            /* renamed from: f, reason: collision with root package name */
            public final String f44380f;

            /* renamed from: g, reason: collision with root package name */
            public final Integer f44381g;

            public SetupIntentNextActionArgs(String publishableKey, String str, boolean z11, LinkedHashSet linkedHashSet, boolean z12, String setupIntentClientSecret, Integer num) {
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(setupIntentClientSecret, "setupIntentClientSecret");
                this.f44375a = publishableKey;
                this.f44376b = str;
                this.f44377c = z11;
                this.f44378d = linkedHashSet;
                this.f44379e = z12;
                this.f44380f = setupIntentClientSecret;
                this.f44381g = num;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44384c() {
                return this.f44377c;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: d, reason: from getter */
            public final boolean getF44386e() {
                return this.f44379e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: e */
            public final Set getF44385d() {
                return this.f44378d;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof SetupIntentNextActionArgs)) {
                    return false;
                }
                SetupIntentNextActionArgs setupIntentNextActionArgs = (SetupIntentNextActionArgs) obj;
                return Intrinsics.b(this.f44375a, setupIntentNextActionArgs.f44375a) && Intrinsics.b(this.f44376b, setupIntentNextActionArgs.f44376b) && this.f44377c == setupIntentNextActionArgs.f44377c && this.f44378d.equals(setupIntentNextActionArgs.f44378d) && this.f44379e == setupIntentNextActionArgs.f44379e && Intrinsics.b(this.f44380f, setupIntentNextActionArgs.f44380f) && Intrinsics.b(this.f44381g, setupIntentNextActionArgs.f44381g);
            }

            public final int hashCode() {
                int iHashCode = this.f44375a.hashCode() * 31;
                String str = this.f44376b;
                int iE = c0.e(c9.f((this.f44378d.hashCode() + c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44377c)) * 31, 31, this.f44379e), 31, this.f44380f);
                Integer num = this.f44381g;
                return iE + (num != null ? num.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44382a() {
                return this.f44375a;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: l, reason: from getter */
            public final Integer getF44388g() {
                return this.f44381g;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: m, reason: from getter */
            public final String getF44383b() {
                return this.f44376b;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            public final Object p() {
                int i5 = Result.f71687b;
                return Unit.f71706a;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("SetupIntentNextActionArgs(publishableKey=", this.f44375a, ", stripeAccountId=", this.f44376b, ", enableLogging=");
                sbW.append(this.f44377c);
                sbW.append(", productUsage=");
                sbW.append(this.f44378d);
                sbW.append(", includePaymentSheetNextHandlers=");
                c9.s(", setupIntentClientSecret=", this.f44380f, ", statusBarColor=", sbW, this.f44379e);
                sbW.append(this.f44381g);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44375a);
                dest.writeString(this.f44376b);
                dest.writeInt(this.f44377c ? 1 : 0);
                LinkedHashSet linkedHashSet = this.f44378d;
                dest.writeInt(linkedHashSet.size());
                Iterator it = linkedHashSet.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f44379e ? 1 : 0);
                dest.writeString(this.f44380f);
                Integer num = this.f44381g;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args$StripeIntentNextActionWithIntentArgs;", "Lcom/stripe/android/payments/paymentlauncher/PaymentLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class StripeIntentNextActionWithIntentArgs extends Args {

            @NotNull
            public static final Parcelable.Creator<StripeIntentNextActionWithIntentArgs> CREATOR = new h();

            /* renamed from: a, reason: collision with root package name */
            public final String f44382a;

            /* renamed from: b, reason: collision with root package name */
            public final String f44383b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f44384c;

            /* renamed from: d, reason: collision with root package name */
            public final Set f44385d;

            /* renamed from: e, reason: collision with root package name */
            public final boolean f44386e;

            /* renamed from: f, reason: collision with root package name */
            public final StripeIntent f44387f;

            /* renamed from: g, reason: collision with root package name */
            public final Integer f44388g;

            public StripeIntentNextActionWithIntentArgs(String publishableKey, String str, boolean z11, Set productUsage, boolean z12, StripeIntent stripeIntent, Integer num) {
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(productUsage, "productUsage");
                Intrinsics.g(stripeIntent, "stripeIntent");
                this.f44382a = publishableKey;
                this.f44383b = str;
                this.f44384c = z11;
                this.f44385d = productUsage;
                this.f44386e = z12;
                this.f44387f = stripeIntent;
                this.f44388g = num;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44384c() {
                return this.f44384c;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: d, reason: from getter */
            public final boolean getF44386e() {
                return this.f44386e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: e, reason: from getter */
            public final Set getF44385d() {
                return this.f44385d;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof StripeIntentNextActionWithIntentArgs)) {
                    return false;
                }
                StripeIntentNextActionWithIntentArgs stripeIntentNextActionWithIntentArgs = (StripeIntentNextActionWithIntentArgs) obj;
                return Intrinsics.b(this.f44382a, stripeIntentNextActionWithIntentArgs.f44382a) && Intrinsics.b(this.f44383b, stripeIntentNextActionWithIntentArgs.f44383b) && this.f44384c == stripeIntentNextActionWithIntentArgs.f44384c && Intrinsics.b(this.f44385d, stripeIntentNextActionWithIntentArgs.f44385d) && this.f44386e == stripeIntentNextActionWithIntentArgs.f44386e && Intrinsics.b(this.f44387f, stripeIntentNextActionWithIntentArgs.f44387f) && Intrinsics.b(this.f44388g, stripeIntentNextActionWithIntentArgs.f44388g);
            }

            public final int hashCode() {
                int iHashCode = this.f44382a.hashCode() * 31;
                String str = this.f44383b;
                int iHashCode2 = (this.f44387f.hashCode() + c9.f(c1.k(this.f44385d, c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44384c), 31), 31, this.f44386e)) * 31;
                Integer num = this.f44388g;
                return iHashCode2 + (num != null ? num.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44382a() {
                return this.f44382a;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: l, reason: from getter */
            public final Integer getF44388g() {
                return this.f44388g;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            /* renamed from: m, reason: from getter */
            public final String getF44383b() {
                return this.f44383b;
            }

            @Override // com.stripe.android.payments.paymentlauncher.PaymentLauncherContract.Args
            public final Object p() {
                int i5 = Result.f71687b;
                return Unit.f71706a;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("StripeIntentNextActionWithIntentArgs(publishableKey=", this.f44382a, ", stripeAccountId=", this.f44383b, ", enableLogging=");
                sbW.append(this.f44384c);
                sbW.append(", productUsage=");
                sbW.append(this.f44385d);
                sbW.append(", includePaymentSheetNextHandlers=");
                sbW.append(this.f44386e);
                sbW.append(", stripeIntent=");
                sbW.append(this.f44387f);
                sbW.append(", statusBarColor=");
                sbW.append(this.f44388g);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44382a);
                dest.writeString(this.f44383b);
                dest.writeInt(this.f44384c ? 1 : 0);
                Set set = this.f44385d;
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f44386e ? 1 : 0);
                dest.writeParcelable(this.f44387f, i5);
                Integer num = this.f44388g;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
            }
        }

        /* renamed from: b */
        public abstract boolean getF44384c();

        /* renamed from: d */
        public abstract boolean getF44386e();

        /* renamed from: e */
        public abstract Set getF44385d();

        /* renamed from: i */
        public abstract String getF44382a();

        /* renamed from: l */
        public abstract Integer getF44388g();

        /* renamed from: m */
        public abstract String getF44383b();

        public abstract Object p();
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) PaymentLauncherConfirmationActivity.class).putExtras(w.b.a(new Pair("extra_args", input)));
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        InternalPaymentResult internalPaymentResult;
        return (intent == null || (internalPaymentResult = (InternalPaymentResult) intent.getParcelableExtra("extra_args")) == null) ? new InternalPaymentResult.Failed(new IllegalStateException("Failed to get PaymentSheetResult from Intent")) : internalPaymentResult;
    }
}
