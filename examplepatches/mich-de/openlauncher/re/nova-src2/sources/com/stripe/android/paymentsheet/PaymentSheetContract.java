package com.stripe.android.paymentsheet;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0002\u0006\u0007B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/PaymentSheetContract$Args;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "<init>", "()V", "Args", "Result", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheetContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetContract$Args;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new q0();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentElementLoader$InitializationMode f44663a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentSheet$Configuration f44664b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44665c;

        /* renamed from: d, reason: collision with root package name */
        public final Integer f44666d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f44667e;

        public Args(PaymentElementLoader$InitializationMode initializationMode, PaymentSheet$Configuration config, String paymentElementCallbackIdentifier, Integer num, boolean z11) {
            Intrinsics.g(initializationMode, "initializationMode");
            Intrinsics.g(config, "config");
            Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
            this.f44663a = initializationMode;
            this.f44664b = config;
            this.f44665c = paymentElementCallbackIdentifier;
            this.f44666d = num;
            this.f44667e = z11;
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
            return Intrinsics.b(this.f44663a, args.f44663a) && Intrinsics.b(this.f44664b, args.f44664b) && Intrinsics.b(this.f44665c, args.f44665c) && Intrinsics.b(this.f44666d, args.f44666d) && this.f44667e == args.f44667e;
        }

        public final int hashCode() {
            int iE = b.c0.e((this.f44664b.hashCode() + (this.f44663a.hashCode() * 31)) * 31, 31, this.f44665c);
            Integer num = this.f44666d;
            return Boolean.hashCode(this.f44667e) + ((iE + (num == null ? 0 : num.hashCode())) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Args(initializationMode=");
            sb2.append(this.f44663a);
            sb2.append(", config=");
            sb2.append(this.f44664b);
            sb2.append(", paymentElementCallbackIdentifier=");
            sb2.append(this.f44665c);
            sb2.append(", statusBarColor=");
            sb2.append(this.f44666d);
            sb2.append(", initializedViaCompose=");
            return a80.m.k(sb2, this.f44667e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44663a, i5);
            this.f44664b.writeToParcel(dest, i5);
            dest.writeString(this.f44665c);
            Integer num = this.f44666d;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeInt(this.f44667e ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetContract$Result;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Result implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Result> CREATOR = new r0();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheetResult f44668a;

        public Result(PaymentSheetResult paymentSheetResult) {
            Intrinsics.g(paymentSheetResult, "paymentSheetResult");
            this.f44668a = paymentSheetResult;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Result) && Intrinsics.b(this.f44668a, ((Result) obj).f44668a);
        }

        public final int hashCode() {
            return this.f44668a.hashCode();
        }

        public final String toString() {
            return "Result(paymentSheetResult=" + this.f44668a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44668a, i5);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) PaymentSheetActivity.class).putExtra("com.stripe.android.paymentsheet.PaymentSheetContract.extra_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Result result;
        PaymentSheetResult paymentSheetResult = (intent == null || (result = (Result) intent.getParcelableExtra("com.stripe.android.paymentsheet.PaymentSheetContract.extra_result")) == null) ? null : result.f44668a;
        return paymentSheetResult == null ? new PaymentSheetResult.Failed(new IllegalArgumentException("Failed to retrieve a PaymentSheetResult.")) : paymentSheetResult;
    }
}
