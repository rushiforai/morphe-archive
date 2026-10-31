package com.stripe.android.paymentsheet;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.paymentsheet.state.PaymentSheetState$Full;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentOptionContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/PaymentOptionContract$Args;", "Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentOptionContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentOptionContract$Args;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheetState$Full f44429a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentSheet$Configuration f44430b;

        /* renamed from: c, reason: collision with root package name */
        public final LinkAccountUpdate.Value f44431c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f44432d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f44433e;

        /* renamed from: f, reason: collision with root package name */
        public final LinkedHashSet f44434f;

        /* renamed from: g, reason: collision with root package name */
        public final String f44435g;

        public Args(PaymentSheetState$Full state, PaymentSheet$Configuration configuration, LinkAccountUpdate.Value linkAccountInfo, boolean z11, boolean z12, LinkedHashSet linkedHashSet, String paymentElementCallbackIdentifier) {
            Intrinsics.g(state, "state");
            Intrinsics.g(configuration, "configuration");
            Intrinsics.g(linkAccountInfo, "linkAccountInfo");
            Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
            this.f44429a = state;
            this.f44430b = configuration;
            this.f44431c = linkAccountInfo;
            this.f44432d = z11;
            this.f44433e = z12;
            this.f44434f = linkedHashSet;
            this.f44435g = paymentElementCallbackIdentifier;
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
            return Intrinsics.b(this.f44429a, args.f44429a) && Intrinsics.b(this.f44430b, args.f44430b) && Intrinsics.b(this.f44431c, args.f44431c) && this.f44432d == args.f44432d && this.f44433e == args.f44433e && this.f44434f.equals(args.f44434f) && Intrinsics.b(this.f44435g, args.f44435g);
        }

        public final int hashCode() {
            return this.f44435g.hashCode() + ((this.f44434f.hashCode() + c9.f(c9.f((this.f44431c.hashCode() + ((this.f44430b.hashCode() + (this.f44429a.hashCode() * 31)) * 31)) * 31, 31, this.f44432d), 31, this.f44433e)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Args(state=");
            sb2.append(this.f44429a);
            sb2.append(", configuration=");
            sb2.append(this.f44430b);
            sb2.append(", linkAccountInfo=");
            sb2.append(this.f44431c);
            sb2.append(", enableLogging=");
            sb2.append(this.f44432d);
            sb2.append(", walletButtonsRendered=");
            sb2.append(this.f44433e);
            sb2.append(", productUsage=");
            sb2.append(this.f44434f);
            sb2.append(", paymentElementCallbackIdentifier=");
            return b.c0.q(sb2, this.f44435g, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44429a, i5);
            this.f44430b.writeToParcel(dest, i5);
            dest.writeParcelable(this.f44431c, i5);
            dest.writeInt(this.f44432d ? 1 : 0);
            dest.writeInt(this.f44433e ? 1 : 0);
            LinkedHashSet linkedHashSet = this.f44434f;
            dest.writeInt(linkedHashSet.size());
            Iterator it = linkedHashSet.iterator();
            while (it.hasNext()) {
                dest.writeString((String) it.next());
            }
            dest.writeString(this.f44435g);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) PaymentOptionsActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (intent != null) {
            return (PaymentOptionsActivityResult) intent.getParcelableExtra("extra_activity_result");
        }
        return null;
    }
}
