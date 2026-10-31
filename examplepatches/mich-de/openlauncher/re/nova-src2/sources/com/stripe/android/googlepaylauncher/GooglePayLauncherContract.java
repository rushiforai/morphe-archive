package com.stripe.android.googlepaylauncher;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.googlepaylauncher.GooglePayLauncher$Result;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0003\u0006\u0007\bB\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\t"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract;", "Lk/b;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$Args;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result;", "<init>", "()V", "PaymentIntentArgs", "SetupIntentArgs", "Args", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayLauncherContract extends k.b {

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001\u0082\u0001\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$Args;", "Landroid/os/Parcelable;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$PaymentIntentArgs;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$SetupIntentArgs;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Args implements Parcelable {
        /* renamed from: b */
        public abstract GooglePayLauncher$Config getF42787b();
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$PaymentIntentArgs;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentIntentArgs extends Args {

        @NotNull
        public static final Parcelable.Creator<PaymentIntentArgs> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final String f42783a;

        /* renamed from: b, reason: collision with root package name */
        public final GooglePayLauncher$Config f42784b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42785c;

        public PaymentIntentArgs(String clientSecret, GooglePayLauncher$Config config, String str) {
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(config, "config");
            this.f42783a = clientSecret;
            this.f42784b = config;
            this.f42785c = str;
        }

        @Override // com.stripe.android.googlepaylauncher.GooglePayLauncherContract.Args
        /* renamed from: b, reason: from getter */
        public final GooglePayLauncher$Config getF42787b() {
            return this.f42784b;
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
            return Intrinsics.b(this.f42783a, paymentIntentArgs.f42783a) && Intrinsics.b(this.f42784b, paymentIntentArgs.f42784b) && Intrinsics.b(this.f42785c, paymentIntentArgs.f42785c);
        }

        public final int hashCode() {
            int iHashCode = (this.f42784b.hashCode() + (this.f42783a.hashCode() * 31)) * 31;
            String str = this.f42785c;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("PaymentIntentArgs(clientSecret=");
            sb2.append(this.f42783a);
            sb2.append(", config=");
            sb2.append(this.f42784b);
            sb2.append(", label=");
            return c0.q(sb2, this.f42785c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42783a);
            this.f42784b.writeToParcel(dest, i5);
            dest.writeString(this.f42785c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$SetupIntentArgs;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncherContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupIntentArgs extends Args {

        @NotNull
        public static final Parcelable.Creator<SetupIntentArgs> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final String f42786a;

        /* renamed from: b, reason: collision with root package name */
        public final GooglePayLauncher$Config f42787b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42788c;

        /* renamed from: d, reason: collision with root package name */
        public final Long f42789d;

        /* renamed from: e, reason: collision with root package name */
        public final String f42790e;

        public SetupIntentArgs(String clientSecret, GooglePayLauncher$Config config, String currencyCode, Long l9, String str) {
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(config, "config");
            Intrinsics.g(currencyCode, "currencyCode");
            this.f42786a = clientSecret;
            this.f42787b = config;
            this.f42788c = currencyCode;
            this.f42789d = l9;
            this.f42790e = str;
        }

        @Override // com.stripe.android.googlepaylauncher.GooglePayLauncherContract.Args
        /* renamed from: b, reason: from getter */
        public final GooglePayLauncher$Config getF42787b() {
            return this.f42787b;
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
            return Intrinsics.b(this.f42786a, setupIntentArgs.f42786a) && Intrinsics.b(this.f42787b, setupIntentArgs.f42787b) && Intrinsics.b(this.f42788c, setupIntentArgs.f42788c) && Intrinsics.b(this.f42789d, setupIntentArgs.f42789d) && Intrinsics.b(this.f42790e, setupIntentArgs.f42790e);
        }

        public final int hashCode() {
            int iE = c0.e((this.f42787b.hashCode() + (this.f42786a.hashCode() * 31)) * 31, 31, this.f42788c);
            Long l9 = this.f42789d;
            int iHashCode = (iE + (l9 == null ? 0 : l9.hashCode())) * 31;
            String str = this.f42790e;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("SetupIntentArgs(clientSecret=");
            sb2.append(this.f42786a);
            sb2.append(", config=");
            sb2.append(this.f42787b);
            sb2.append(", currencyCode=");
            sb2.append(this.f42788c);
            sb2.append(", amount=");
            sb2.append(this.f42789d);
            sb2.append(", label=");
            return c0.q(sb2, this.f42790e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42786a);
            this.f42787b.writeToParcel(dest, i5);
            dest.writeString(this.f42788c);
            Long l9 = this.f42789d;
            if (l9 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeLong(l9.longValue());
            }
            dest.writeString(this.f42790e);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) GooglePayLauncherActivity.class).putExtras(w.b.a(new Pair("extra_args", input)));
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        GooglePayLauncher$Result googlePayLauncher$Result;
        return (intent == null || (googlePayLauncher$Result = (GooglePayLauncher$Result) intent.getParcelableExtra("extra_result")) == null) ? new GooglePayLauncher$Result.Failed(new IllegalStateException("Error while processing result from Google Pay.")) : googlePayLauncher$Result;
    }
}
