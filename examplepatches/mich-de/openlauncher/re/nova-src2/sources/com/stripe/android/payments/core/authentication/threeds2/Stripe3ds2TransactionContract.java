package com.stripe.android.payments.core.authentication.threeds2;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.PaymentAuthConfig$Stripe3ds2Config;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/payments/core/authentication/threeds2/Stripe3ds2TransactionContract;", "Lk/b;", "Lcom/stripe/android/payments/core/authentication/threeds2/Stripe3ds2TransactionContract$Args;", "Lcom/stripe/android/payments/PaymentFlowResult$Unvalidated;", "<init>", "()V", "Args", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class Stripe3ds2TransactionContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/core/authentication/threeds2/Stripe3ds2TransactionContract$Args;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final SdkTransactionId f44311a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentAuthConfig$Stripe3ds2Config f44312b;

        /* renamed from: c, reason: collision with root package name */
        public final StripeIntent f44313c;

        /* renamed from: d, reason: collision with root package name */
        public final StripeIntent.NextActionData.SdkData.Use3DS2 f44314d;

        /* renamed from: e, reason: collision with root package name */
        public final ApiRequest$Options f44315e;

        /* renamed from: f, reason: collision with root package name */
        public final boolean f44316f;

        /* renamed from: g, reason: collision with root package name */
        public final Integer f44317g;

        /* renamed from: h, reason: collision with root package name */
        public final String f44318h;

        /* renamed from: i, reason: collision with root package name */
        public final Set f44319i;

        public Args(SdkTransactionId sdkTransactionId, PaymentAuthConfig$Stripe3ds2Config config, StripeIntent stripeIntent, StripeIntent.NextActionData.SdkData.Use3DS2 nextActionData, ApiRequest$Options requestOptions, boolean z11, Integer num, String publishableKey, Set productUsage) {
            Intrinsics.g(sdkTransactionId, "sdkTransactionId");
            Intrinsics.g(config, "config");
            Intrinsics.g(stripeIntent, "stripeIntent");
            Intrinsics.g(nextActionData, "nextActionData");
            Intrinsics.g(requestOptions, "requestOptions");
            Intrinsics.g(publishableKey, "publishableKey");
            Intrinsics.g(productUsage, "productUsage");
            this.f44311a = sdkTransactionId;
            this.f44312b = config;
            this.f44313c = stripeIntent;
            this.f44314d = nextActionData;
            this.f44315e = requestOptions;
            this.f44316f = z11;
            this.f44317g = num;
            this.f44318h = publishableKey;
            this.f44319i = productUsage;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Args)) {
                return false;
            }
            Args args = (Args) obj;
            return Intrinsics.b(this.f44311a, args.f44311a) && Intrinsics.b(this.f44312b, args.f44312b) && Intrinsics.b(this.f44313c, args.f44313c) && Intrinsics.b(this.f44314d, args.f44314d) && Intrinsics.b(this.f44315e, args.f44315e) && this.f44316f == args.f44316f && Intrinsics.b(this.f44317g, args.f44317g) && Intrinsics.b(this.f44318h, args.f44318h) && Intrinsics.b(this.f44319i, args.f44319i);
        }

        public final int hashCode() {
            int iF = c9.f((this.f44315e.hashCode() + ((this.f44314d.hashCode() + ((this.f44313c.hashCode() + ((this.f44312b.hashCode() + (this.f44311a.f45118a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31, 31, this.f44316f);
            Integer num = this.f44317g;
            return this.f44319i.hashCode() + c0.e((iF + (num == null ? 0 : num.hashCode())) * 31, 31, this.f44318h);
        }

        public final String toString() {
            return "Args(sdkTransactionId=" + this.f44311a + ", config=" + this.f44312b + ", stripeIntent=" + this.f44313c + ", nextActionData=" + this.f44314d + ", requestOptions=" + this.f44315e + ", enableLogging=" + this.f44316f + ", statusBarColor=" + this.f44317g + ", publishableKey=" + this.f44318h + ", productUsage=" + this.f44319i + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44311a, i5);
            dest.writeParcelable(this.f44312b, i5);
            dest.writeParcelable(this.f44313c, i5);
            dest.writeParcelable(this.f44314d, i5);
            dest.writeParcelable(this.f44315e, i5);
            dest.writeInt(this.f44316f ? 1 : 0);
            Integer num = this.f44317g;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeString(this.f44318h);
            Set set = this.f44319i;
            dest.writeInt(set.size());
            Iterator it = set.iterator();
            while (it.hasNext()) {
                dest.writeString((String) it.next());
            }
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) Stripe3ds2TransactionActivity.class).putExtras(w.b.a(new Pair("extra_args", input)));
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        return (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) ? new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) : paymentFlowResult$Unvalidated;
    }
}
