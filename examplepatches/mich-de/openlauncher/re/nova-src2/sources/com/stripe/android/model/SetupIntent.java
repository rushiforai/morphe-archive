package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/SetupIntent;", "Lcom/stripe/android/model/StripeIntent;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e, "ft/r0", "ft/q0", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SetupIntent implements StripeIntent {

    @NotNull
    public static final Parcelable.Creator<SetupIntent> CREATOR = new p4();

    /* renamed from: a, reason: collision with root package name */
    public final String f43763a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.q0 f43764b;

    /* renamed from: c, reason: collision with root package name */
    public final long f43765c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43766d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43767e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43768f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f43769g;

    /* renamed from: h, reason: collision with root package name */
    public final PaymentMethod f43770h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43771i;

    /* renamed from: j, reason: collision with root package name */
    public final List f43772j;

    /* renamed from: k, reason: collision with root package name */
    public final StripeIntent.Status f43773k;

    /* renamed from: l, reason: collision with root package name */
    public final StripeIntent.Usage f43774l;

    /* renamed from: m, reason: collision with root package name */
    public final Error f43775m;
    public final List n;
    public final List o;

    /* renamed from: p, reason: collision with root package name */
    public final StripeIntent.NextActionData f43776p;

    /* renamed from: q, reason: collision with root package name */
    public final String f43777q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f43778r;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/SetupIntent$Error;", "Lcom/stripe/android/core/model/StripeModel;", "com/stripe/android/model/s4", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Error implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Error> CREATOR = new q4();

        /* renamed from: a, reason: collision with root package name */
        public final String f43779a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43780b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43781c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43782d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43783e;

        /* renamed from: f, reason: collision with root package name */
        public final PaymentMethod f43784f;

        /* renamed from: g, reason: collision with root package name */
        public final s4 f43785g;

        public Error(String str, String str2, String str3, String str4, String str5, PaymentMethod paymentMethod, s4 s4Var) {
            this.f43779a = str;
            this.f43780b = str2;
            this.f43781c = str3;
            this.f43782d = str4;
            this.f43783e = str5;
            this.f43784f = paymentMethod;
            this.f43785g = s4Var;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Error)) {
                return false;
            }
            Error error = (Error) obj;
            return Intrinsics.b(this.f43779a, error.f43779a) && Intrinsics.b(this.f43780b, error.f43780b) && Intrinsics.b(this.f43781c, error.f43781c) && Intrinsics.b(this.f43782d, error.f43782d) && Intrinsics.b(this.f43783e, error.f43783e) && Intrinsics.b(this.f43784f, error.f43784f) && this.f43785g == error.f43785g;
        }

        public final int hashCode() {
            String str = this.f43779a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43780b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43781c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43782d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43783e;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            PaymentMethod paymentMethod = this.f43784f;
            int iHashCode6 = (iHashCode5 + (paymentMethod == null ? 0 : paymentMethod.hashCode())) * 31;
            s4 s4Var = this.f43785g;
            return iHashCode6 + (s4Var != null ? s4Var.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Error(code=", this.f43779a, ", declineCode=", this.f43780b, ", docUrl=");
            b.c0.D(sbW, this.f43781c, ", message=", this.f43782d, ", param=");
            sbW.append(this.f43783e);
            sbW.append(", paymentMethod=");
            sbW.append(this.f43784f);
            sbW.append(", type=");
            sbW.append(this.f43785g);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43779a);
            dest.writeString(this.f43780b);
            dest.writeString(this.f43781c);
            dest.writeString(this.f43782d);
            dest.writeString(this.f43783e);
            PaymentMethod paymentMethod = this.f43784f;
            if (paymentMethod == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentMethod.writeToParcel(dest, i5);
            }
            s4 s4Var = this.f43785g;
            if (s4Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(s4Var.name());
            }
        }
    }

    public /* synthetic */ SetupIntent(String str, long j11, String str2, boolean z11, List list, StripeIntent.Usage usage, List list2, List list3, boolean z12) {
        this(str, null, j11, str2, null, null, z11, null, null, list, null, usage, null, list2, list3, null, null, z12);
    }

    public static SetupIntent a(SetupIntent setupIntent, PaymentMethod paymentMethod, List list, int i5) {
        String str = setupIntent.f43763a;
        ft.q0 q0Var = setupIntent.f43764b;
        long j11 = setupIntent.f43765c;
        String str2 = setupIntent.f43766d;
        String str3 = setupIntent.f43767e;
        String str4 = setupIntent.f43768f;
        boolean z11 = setupIntent.f43769g;
        PaymentMethod paymentMethod2 = (i5 & 128) != 0 ? setupIntent.f43770h : paymentMethod;
        String str5 = setupIntent.f43771i;
        List paymentMethodTypes = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? setupIntent.f43772j : list;
        StripeIntent.Status status = setupIntent.f43773k;
        StripeIntent.Usage usage = setupIntent.f43774l;
        Error error = setupIntent.f43775m;
        List unactivatedPaymentMethods = setupIntent.n;
        List linkFundingSources = setupIntent.o;
        StripeIntent.NextActionData nextActionData = setupIntent.f43776p;
        String str6 = setupIntent.f43777q;
        boolean z12 = setupIntent.f43778r;
        setupIntent.getClass();
        Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
        Intrinsics.g(unactivatedPaymentMethods, "unactivatedPaymentMethods");
        Intrinsics.g(linkFundingSources, "linkFundingSources");
        return new SetupIntent(str, q0Var, j11, str2, str3, str4, z11, paymentMethod2, str5, paymentMethodTypes, status, usage, error, unactivatedPaymentMethods, linkFundingSources, nextActionData, str6, z12);
    }

    @Override // com.stripe.android.model.StripeIntent
    public final boolean D() {
        return this.f43773k == StripeIntent.Status.f43983e;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: F0, reason: from getter */
    public final boolean getF43769g() {
        return this.f43769g;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final Map N() {
        Map mapE;
        String str = this.f43777q;
        return (str == null || (mapE = vh.a.E(new JSONObject(str))) == null) ? b70.h.f17594a : mapE;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final StripeIntent.NextActionType X() {
        StripeIntent.NextActionData nextActionData = this.f43776p;
        if (nextActionData instanceof StripeIntent.NextActionData.SdkData) {
            return StripeIntent.NextActionType.f43967d;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.RedirectToUrl) {
            return StripeIntent.NextActionType.f43966c;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayOxxoDetails) {
            return StripeIntent.NextActionType.f43968e;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayBoletoDetails) {
            return StripeIntent.NextActionType.f43973j;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayKonbiniDetails) {
            return StripeIntent.NextActionType.f43974k;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayMultibancoDetails) {
            return StripeIntent.NextActionType.f43975l;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.VerifyWithMicrodeposits) {
            return StripeIntent.NextActionType.f43970g;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.CashAppRedirect) {
            return StripeIntent.NextActionType.f43972i;
        }
        if ((nextActionData instanceof StripeIntent.NextActionData.AlipayRedirect) || (nextActionData instanceof StripeIntent.NextActionData.BlikAuthorize) || (nextActionData instanceof StripeIntent.NextActionData.WeChatPayRedirect) || (nextActionData instanceof StripeIntent.NextActionData.UpiAwaitNotification) || (nextActionData instanceof StripeIntent.NextActionData.SwishRedirect) || (nextActionData instanceof StripeIntent.NextActionData.DisplayPayNowDetails) || (nextActionData instanceof StripeIntent.NextActionData.DisplayPromptPayDetails) || nextActionData == null) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SetupIntent)) {
            return false;
        }
        SetupIntent setupIntent = (SetupIntent) obj;
        return Intrinsics.b(this.f43763a, setupIntent.f43763a) && this.f43764b == setupIntent.f43764b && this.f43765c == setupIntent.f43765c && Intrinsics.b(this.f43766d, setupIntent.f43766d) && Intrinsics.b(this.f43767e, setupIntent.f43767e) && Intrinsics.b(this.f43768f, setupIntent.f43768f) && this.f43769g == setupIntent.f43769g && Intrinsics.b(this.f43770h, setupIntent.f43770h) && Intrinsics.b(this.f43771i, setupIntent.f43771i) && Intrinsics.b(this.f43772j, setupIntent.f43772j) && this.f43773k == setupIntent.f43773k && this.f43774l == setupIntent.f43774l && Intrinsics.b(this.f43775m, setupIntent.f43775m) && Intrinsics.b(this.n, setupIntent.n) && Intrinsics.b(this.o, setupIntent.o) && Intrinsics.b(this.f43776p, setupIntent.f43776p) && Intrinsics.b(this.f43777q, setupIntent.f43777q) && this.f43778r == setupIntent.f43778r;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: g, reason: from getter */
    public final String getF43767e() {
        return this.f43767e;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: getCountryCode, reason: from getter */
    public final String getF43766d() {
        return this.f43766d;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: getId, reason: from getter */
    public final String getF43763a() {
        return this.f43763a;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: h, reason: from getter */
    public final StripeIntent.Status getF43773k() {
        return this.f43773k;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: h0, reason: from getter */
    public final boolean getF43778r() {
        return this.f43778r;
    }

    public final int hashCode() {
        String str = this.f43763a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        ft.q0 q0Var = this.f43764b;
        int iD = b.c0.d((iHashCode + (q0Var == null ? 0 : q0Var.hashCode())) * 31, 31, this.f43765c);
        String str2 = this.f43766d;
        int iHashCode2 = (iD + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f43767e;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43768f;
        int iF = c9.f((iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31, 31, this.f43769g);
        PaymentMethod paymentMethod = this.f43770h;
        int iHashCode4 = (iF + (paymentMethod == null ? 0 : paymentMethod.hashCode())) * 31;
        String str5 = this.f43771i;
        int iC = b.u4.c((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43772j);
        StripeIntent.Status status = this.f43773k;
        int iHashCode5 = (iC + (status == null ? 0 : status.hashCode())) * 31;
        StripeIntent.Usage usage = this.f43774l;
        int iHashCode6 = (iHashCode5 + (usage == null ? 0 : usage.hashCode())) * 31;
        Error error = this.f43775m;
        int iC2 = b.u4.c(b.u4.c((iHashCode6 + (error == null ? 0 : error.hashCode())) * 31, 31, this.n), 31, this.o);
        StripeIntent.NextActionData nextActionData = this.f43776p;
        int iHashCode7 = (iC2 + (nextActionData == null ? 0 : nextActionData.hashCode())) * 31;
        String str6 = this.f43777q;
        return Boolean.hashCode(this.f43778r) + ((iHashCode7 + (str6 != null ? str6.hashCode() : 0)) * 31);
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: i0, reason: from getter */
    public final PaymentMethod getF43770h() {
        return this.f43770h;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: q, reason: from getter */
    public final StripeIntent.NextActionData getF43776p() {
        return this.f43776p;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: s0, reason: from getter */
    public final List getN() {
        return this.n;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetupIntent(id=");
        sb2.append(this.f43763a);
        sb2.append(", cancellationReason=");
        sb2.append(this.f43764b);
        sb2.append(", created=");
        sb2.append(this.f43765c);
        sb2.append(", countryCode=");
        sb2.append(this.f43766d);
        b.c0.D(sb2, ", clientSecret=", this.f43767e, ", description=", this.f43768f);
        sb2.append(", isLiveMode=");
        sb2.append(this.f43769g);
        sb2.append(", paymentMethod=");
        sb2.append(this.f43770h);
        sb2.append(", paymentMethodId=");
        sb2.append(this.f43771i);
        sb2.append(", paymentMethodTypes=");
        sb2.append(this.f43772j);
        sb2.append(", status=");
        sb2.append(this.f43773k);
        sb2.append(", usage=");
        sb2.append(this.f43774l);
        sb2.append(", lastSetupError=");
        sb2.append(this.f43775m);
        sb2.append(", unactivatedPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", linkFundingSources=");
        sb2.append(this.o);
        sb2.append(", nextActionData=");
        sb2.append(this.f43776p);
        sb2.append(", paymentMethodOptionsJsonString=");
        sb2.append(this.f43777q);
        sb2.append(", automaticPaymentMethodsEnabled=");
        sb2.append(this.f43778r);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: u, reason: from getter */
    public final List getF43772j() {
        return this.f43772j;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: u0, reason: from getter */
    public final List getO() {
        return this.o;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final boolean w0() {
        return b70.g.O0(kotlin.collections.c.f1(new StripeIntent.Status[]{StripeIntent.Status.f43982d, StripeIntent.Status.f43985g}), this.f43773k);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43763a);
        ft.q0 q0Var = this.f43764b;
        if (q0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(q0Var.name());
        }
        dest.writeLong(this.f43765c);
        dest.writeString(this.f43766d);
        dest.writeString(this.f43767e);
        dest.writeString(this.f43768f);
        dest.writeInt(this.f43769g ? 1 : 0);
        PaymentMethod paymentMethod = this.f43770h;
        if (paymentMethod == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethod.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43771i);
        dest.writeStringList(this.f43772j);
        StripeIntent.Status status = this.f43773k;
        if (status == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(status.name());
        }
        StripeIntent.Usage usage = this.f43774l;
        if (usage == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(usage.name());
        }
        Error error = this.f43775m;
        if (error == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            error.writeToParcel(dest, i5);
        }
        dest.writeStringList(this.n);
        dest.writeStringList(this.o);
        dest.writeParcelable(this.f43776p, i5);
        dest.writeString(this.f43777q);
        dest.writeInt(this.f43778r ? 1 : 0);
    }

    public SetupIntent(String str, ft.q0 q0Var, long j11, String str2, String str3, String str4, boolean z11, PaymentMethod paymentMethod, String str5, List paymentMethodTypes, StripeIntent.Status status, StripeIntent.Usage usage, Error error, List unactivatedPaymentMethods, List linkFundingSources, StripeIntent.NextActionData nextActionData, String str6, boolean z12) {
        Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
        Intrinsics.g(unactivatedPaymentMethods, "unactivatedPaymentMethods");
        Intrinsics.g(linkFundingSources, "linkFundingSources");
        this.f43763a = str;
        this.f43764b = q0Var;
        this.f43765c = j11;
        this.f43766d = str2;
        this.f43767e = str3;
        this.f43768f = str4;
        this.f43769g = z11;
        this.f43770h = paymentMethod;
        this.f43771i = str5;
        this.f43772j = paymentMethodTypes;
        this.f43773k = status;
        this.f43774l = usage;
        this.f43775m = error;
        this.n = unactivatedPaymentMethods;
        this.o = linkFundingSources;
        this.f43776p = nextActionData;
        this.f43777q = str6;
        this.f43778r = z12;
    }
}
