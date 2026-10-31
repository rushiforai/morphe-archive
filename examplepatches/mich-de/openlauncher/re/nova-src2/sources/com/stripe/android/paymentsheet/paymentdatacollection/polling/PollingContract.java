package com.stripe.android.paymentsheet.paymentdatacollection.polling;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.u4;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/polling/PollingContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/polling/PollingContract$Args;", "Lcom/stripe/android/payments/PaymentFlowResult$Unvalidated;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PollingContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/polling/PollingContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f44938a;

        /* renamed from: b, reason: collision with root package name */
        public final Integer f44939b;

        /* renamed from: c, reason: collision with root package name */
        public final int f44940c;

        /* renamed from: d, reason: collision with root package name */
        public final int f44941d;

        /* renamed from: e, reason: collision with root package name */
        public final int f44942e;

        /* renamed from: f, reason: collision with root package name */
        public final String f44943f;

        /* renamed from: g, reason: collision with root package name */
        public final String f44944g;

        public Args(String clientSecret, Integer num, int i5, int i11, int i12, String str, String str2) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f44938a = clientSecret;
            this.f44939b = num;
            this.f44940c = i5;
            this.f44941d = i11;
            this.f44942e = i12;
            this.f44943f = str;
            this.f44944g = str2;
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
            return Intrinsics.b(this.f44938a, args.f44938a) && Intrinsics.b(this.f44939b, args.f44939b) && this.f44940c == args.f44940c && this.f44941d == args.f44941d && this.f44942e == args.f44942e && Intrinsics.b(this.f44943f, args.f44943f) && Intrinsics.b(this.f44944g, args.f44944g);
        }

        public final int hashCode() {
            int iHashCode = this.f44938a.hashCode() * 31;
            Integer num = this.f44939b;
            int iA = u4.a(this.f44942e, u4.a(this.f44941d, u4.a(this.f44940c, (iHashCode + (num == null ? 0 : num.hashCode())) * 31, 31), 31), 31);
            String str = this.f44943f;
            int iHashCode2 = (iA + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44944g;
            return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Args(clientSecret=");
            sb2.append(this.f44938a);
            sb2.append(", statusBarColor=");
            sb2.append(this.f44939b);
            sb2.append(", timeLimitInSeconds=");
            c0.A(sb2, this.f44940c, ", initialDelayInSeconds=", this.f44941d, ", ctaText=");
            sb2.append(this.f44942e);
            sb2.append(", stripeAccountId=");
            sb2.append(this.f44943f);
            sb2.append(", qrCodeUrl=");
            return c0.q(sb2, this.f44944g, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44938a);
            Integer num = this.f44939b;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeInt(this.f44940c);
            dest.writeInt(this.f44941d);
            dest.writeInt(this.f44942e);
            dest.writeString(this.f44943f);
            dest.writeString(this.f44944g);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) PollingActivity.class).putExtras(w.b.a(new Pair("extra_args", input)));
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        return (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) ? new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) : paymentFlowResult$Unvalidated;
    }
}
