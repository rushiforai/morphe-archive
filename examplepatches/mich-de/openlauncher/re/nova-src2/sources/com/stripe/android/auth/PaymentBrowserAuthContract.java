package com.stripe.android.auth;

import a80.m;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.payments.StripeBrowserLauncherActivity;
import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import com.vungle.ads.internal.protos.Sdk;
import k.b;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/auth/PaymentBrowserAuthContract;", "Lk/b;", "Lcom/stripe/android/auth/PaymentBrowserAuthContract$Args;", "Lcom/stripe/android/payments/PaymentFlowResult$Unvalidated;", "<init>", "()V", "Args", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentBrowserAuthContract extends b {
    /* JADX WARN: Removed duplicated region for block: B:9:0x0031  */
    @Override // k.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Intent createIntent(Context context, Object obj) {
        boolean z11;
        Class cls;
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        if (!input.o) {
            String str = input.f42474e;
            StringBuilder sb2 = new StringBuilder("stripesdk://payment_return_url/");
            sb2.append(packageName);
            z11 = Intrinsics.b(str, sb2.toString()) || input.f42482m;
        }
        Bundle bundleA = w.b.a(new Pair("extra_args", input));
        if (z11) {
            cls = StripeBrowserLauncherActivity.class;
        } else {
            if (z11) {
                throw new NoWhenBranchMatchedException();
            }
            cls = PaymentAuthWebViewActivity.class;
        }
        Intent intent = new Intent(context, (Class<?>) cls);
        intent.putExtras(bundleA);
        return intent;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        return (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) ? new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) : paymentFlowResult$Unvalidated;
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0081\b\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/auth/PaymentBrowserAuthContract$Args;", "Landroid/os/Parcelable;", "CREATOR", "com/stripe/android/auth/a", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final a CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f42470a;

        /* renamed from: b, reason: collision with root package name */
        public final int f42471b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42472c;

        /* renamed from: d, reason: collision with root package name */
        public final String f42473d;

        /* renamed from: e, reason: collision with root package name */
        public final String f42474e;

        /* renamed from: f, reason: collision with root package name */
        public final boolean f42475f;

        /* renamed from: g, reason: collision with root package name */
        public final StripeToolbarCustomization f42476g;

        /* renamed from: h, reason: collision with root package name */
        public final String f42477h;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f42478i;

        /* renamed from: j, reason: collision with root package name */
        public final boolean f42479j;

        /* renamed from: k, reason: collision with root package name */
        public final Integer f42480k;

        /* renamed from: l, reason: collision with root package name */
        public final String f42481l;

        /* renamed from: m, reason: collision with root package name */
        public final boolean f42482m;
        public final String n;
        public final boolean o;

        public Args(String objectId, int i5, String clientSecret, String url, String str, boolean z11, StripeToolbarCustomization stripeToolbarCustomization, String str2, boolean z12, boolean z13, Integer num, String publishableKey, boolean z14, String str3, boolean z15) {
            Intrinsics.g(objectId, "objectId");
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(url, "url");
            Intrinsics.g(publishableKey, "publishableKey");
            this.f42470a = objectId;
            this.f42471b = i5;
            this.f42472c = clientSecret;
            this.f42473d = url;
            this.f42474e = str;
            this.f42475f = z11;
            this.f42476g = stripeToolbarCustomization;
            this.f42477h = str2;
            this.f42478i = z12;
            this.f42479j = z13;
            this.f42480k = num;
            this.f42481l = publishableKey;
            this.f42482m = z14;
            this.n = str3;
            this.o = z15;
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
            return Intrinsics.b(this.f42470a, args.f42470a) && this.f42471b == args.f42471b && Intrinsics.b(this.f42472c, args.f42472c) && Intrinsics.b(this.f42473d, args.f42473d) && Intrinsics.b(this.f42474e, args.f42474e) && this.f42475f == args.f42475f && Intrinsics.b(this.f42476g, args.f42476g) && Intrinsics.b(this.f42477h, args.f42477h) && this.f42478i == args.f42478i && this.f42479j == args.f42479j && Intrinsics.b(this.f42480k, args.f42480k) && Intrinsics.b(this.f42481l, args.f42481l) && this.f42482m == args.f42482m && Intrinsics.b(this.n, args.n) && this.o == args.o;
        }

        public final int hashCode() {
            int iE = c0.e(c0.e(u4.a(this.f42471b, this.f42470a.hashCode() * 31, 31), 31, this.f42472c), 31, this.f42473d);
            String str = this.f42474e;
            int iF = c9.f((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.f42475f);
            StripeToolbarCustomization stripeToolbarCustomization = this.f42476g;
            int iHashCode = (iF + (stripeToolbarCustomization == null ? 0 : stripeToolbarCustomization.hashCode())) * 31;
            String str2 = this.f42477h;
            int iF2 = c9.f(c9.f((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f42478i), 31, this.f42479j);
            Integer num = this.f42480k;
            int iF3 = c9.f(c0.e((iF2 + (num == null ? 0 : num.hashCode())) * 31, 31, this.f42481l), 31, this.f42482m);
            String str3 = this.n;
            return Boolean.hashCode(this.o) + ((iF3 + (str3 != null ? str3.hashCode() : 0)) * 31);
        }

        public final String toString() {
            StringBuilder sbV = c0.v("Args(objectId=", this.f42471b, this.f42470a, ", requestCode=", ", clientSecret=");
            c0.D(sbV, this.f42472c, ", url=", this.f42473d, ", returnUrl=");
            m.q(this.f42474e, ", enableLogging=", ", toolbarCustomization=", sbV, this.f42475f);
            sbV.append(this.f42476g);
            sbV.append(", stripeAccountId=");
            sbV.append(this.f42477h);
            sbV.append(", shouldCancelSource=");
            m.s(sbV, this.f42478i, ", shouldCancelIntentOnUserNavigation=", this.f42479j, ", statusBarColor=");
            sbV.append(this.f42480k);
            sbV.append(", publishableKey=");
            sbV.append(this.f42481l);
            sbV.append(", isInstantApp=");
            c9.s(", referrer=", this.n, ", forceInAppWebView=", sbV, this.f42482m);
            return m.k(sbV, this.o, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            Intrinsics.g(parcel, "parcel");
            parcel.writeString(this.f42470a);
            parcel.writeInt(this.f42471b);
            parcel.writeString(this.f42472c);
            parcel.writeString(this.f42473d);
            parcel.writeString(this.f42474e);
            parcel.writeByte(this.f42475f ? (byte) 1 : (byte) 0);
            parcel.writeParcelable(this.f42476g, i5);
            parcel.writeString(this.f42477h);
            parcel.writeByte(this.f42478i ? (byte) 1 : (byte) 0);
            parcel.writeByte(this.f42479j ? (byte) 1 : (byte) 0);
            parcel.writeValue(this.f42480k);
            parcel.writeString(this.f42481l);
            parcel.writeByte(this.f42482m ? (byte) 1 : (byte) 0);
            parcel.writeString(this.n);
            parcel.writeByte(this.o ? (byte) 1 : (byte) 0);
        }

        public /* synthetic */ Args(String str, int i5, String str2, String str3, String str4, boolean z11, StripeToolbarCustomization stripeToolbarCustomization, String str5, boolean z12, boolean z13, Integer num, String str6, boolean z14, String str7, boolean z15, int i11) {
            this(str, i5, str2, str3, str4, z11, (i11 & 64) != 0 ? null : stripeToolbarCustomization, str5, z12, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? true : z13, num, str6, z14, (i11 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : str7, (i11 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? false : z15);
        }
    }
}
