package com.stripe.android.googlepaylauncher;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Result;
import com.stripe.android.model.ClientAttributionMetadata;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncherContractV2;", "Lk/b;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncherContractV2$Args;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result;", "<init>", "()V", "Args", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayPaymentMethodLauncherContractV2 extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncherContractV2$Args;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new p();

        /* renamed from: a, reason: collision with root package name */
        public final GooglePayPaymentMethodLauncher$Config f42809a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42810b;

        /* renamed from: c, reason: collision with root package name */
        public final long f42811c;

        /* renamed from: d, reason: collision with root package name */
        public final String f42812d;

        /* renamed from: e, reason: collision with root package name */
        public final String f42813e;

        /* renamed from: f, reason: collision with root package name */
        public final CardBrandFilter f42814f;

        /* renamed from: g, reason: collision with root package name */
        public final CardFundingFilter f42815g;

        /* renamed from: h, reason: collision with root package name */
        public final ClientAttributionMetadata f42816h;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f42817i;

        public Args(GooglePayPaymentMethodLauncher$Config config, String currencyCode, long j11, String str, String str2, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, ClientAttributionMetadata clientAttributionMetadata, boolean z11) {
            Intrinsics.g(config, "config");
            Intrinsics.g(currencyCode, "currencyCode");
            Intrinsics.g(cardBrandFilter, "cardBrandFilter");
            Intrinsics.g(cardFundingFilter, "cardFundingFilter");
            this.f42809a = config;
            this.f42810b = currencyCode;
            this.f42811c = j11;
            this.f42812d = str;
            this.f42813e = str2;
            this.f42814f = cardBrandFilter;
            this.f42815g = cardFundingFilter;
            this.f42816h = clientAttributionMetadata;
            this.f42817i = z11;
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
            return Intrinsics.b(this.f42809a, args.f42809a) && Intrinsics.b(this.f42810b, args.f42810b) && this.f42811c == args.f42811c && Intrinsics.b(this.f42812d, args.f42812d) && Intrinsics.b(this.f42813e, args.f42813e) && Intrinsics.b(this.f42814f, args.f42814f) && Intrinsics.b(this.f42815g, args.f42815g) && Intrinsics.b(this.f42816h, args.f42816h) && this.f42817i == args.f42817i;
        }

        public final int hashCode() {
            int iD = c0.d(c0.e(this.f42809a.hashCode() * 31, 31, this.f42810b), 31, this.f42811c);
            String str = this.f42812d;
            int iHashCode = (iD + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f42813e;
            int iHashCode2 = (this.f42815g.hashCode() + ((this.f42814f.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31)) * 31;
            ClientAttributionMetadata clientAttributionMetadata = this.f42816h;
            return Boolean.hashCode(this.f42817i) + ((iHashCode2 + (clientAttributionMetadata != null ? clientAttributionMetadata.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "Args(config=" + this.f42809a + ", currencyCode=" + this.f42810b + ", amount=" + this.f42811c + ", label=" + this.f42812d + ", transactionId=" + this.f42813e + ", cardBrandFilter=" + this.f42814f + ", cardFundingFilter=" + this.f42815g + ", clientAttributionMetadata=" + this.f42816h + ", isElements=" + this.f42817i + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42809a.writeToParcel(dest, i5);
            dest.writeString(this.f42810b);
            dest.writeLong(this.f42811c);
            dest.writeString(this.f42812d);
            dest.writeString(this.f42813e);
            dest.writeParcelable(this.f42814f, i5);
            dest.writeParcelable(this.f42815g, i5);
            ClientAttributionMetadata clientAttributionMetadata = this.f42816h;
            if (clientAttributionMetadata == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                clientAttributionMetadata.writeToParcel(dest, i5);
            }
            dest.writeInt(this.f42817i ? 1 : 0);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) GooglePayPaymentMethodLauncherActivity.class).putExtras(w.b.a(new Pair("extra_args", input)));
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        GooglePayPaymentMethodLauncher$Result googlePayPaymentMethodLauncher$Result;
        return (intent == null || (googlePayPaymentMethodLauncher$Result = (GooglePayPaymentMethodLauncher$Result) intent.getParcelableExtra("extra_result")) == null) ? new GooglePayPaymentMethodLauncher$Result.Failed(1, new IllegalArgumentException("Could not parse a valid result.")) : googlePayPaymentMethodLauncher$Result;
    }
}
