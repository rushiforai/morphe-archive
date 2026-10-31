package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u00002\u00020\u0001:\u0006\u0002\u0003\u0004\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/model/PaymentIntent;", "Lcom/stripe/android/model/StripeIntent;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e, "Shipping", "ft/m0", "ft/k0", "ft/l0", "ft/n0", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentIntent implements StripeIntent {

    @NotNull
    public static final Parcelable.Creator<PaymentIntent> CREATOR = new c2();

    /* renamed from: a, reason: collision with root package name */
    public final String f43533a;

    /* renamed from: b, reason: collision with root package name */
    public final List f43534b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f43535c;

    /* renamed from: d, reason: collision with root package name */
    public final long f43536d;

    /* renamed from: e, reason: collision with root package name */
    public final ft.k0 f43537e;

    /* renamed from: f, reason: collision with root package name */
    public final ft.l0 f43538f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43539g;

    /* renamed from: h, reason: collision with root package name */
    public final ft.n0 f43540h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43541i;

    /* renamed from: j, reason: collision with root package name */
    public final long f43542j;

    /* renamed from: k, reason: collision with root package name */
    public final String f43543k;

    /* renamed from: l, reason: collision with root package name */
    public final String f43544l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f43545m;
    public final PaymentMethod n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f43546p;

    /* renamed from: q, reason: collision with root package name */
    public final StripeIntent.Status f43547q;

    /* renamed from: r, reason: collision with root package name */
    public final StripeIntent.Usage f43548r;

    /* renamed from: s, reason: collision with root package name */
    public final Error f43549s;

    /* renamed from: t, reason: collision with root package name */
    public final Shipping f43550t;

    /* renamed from: u, reason: collision with root package name */
    public final List f43551u;

    /* renamed from: v, reason: collision with root package name */
    public final List f43552v;

    /* renamed from: w, reason: collision with root package name */
    public final StripeIntent.NextActionData f43553w;

    /* renamed from: x, reason: collision with root package name */
    public final String f43554x;

    /* renamed from: y, reason: collision with root package name */
    public final boolean f43555y;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentIntent$Error;", "Lcom/stripe/android/core/model/StripeModel;", "com/stripe/android/model/f2", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Error implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Error> CREATOR = new d2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43556a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43557b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43558c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43559d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43560e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43561f;

        /* renamed from: g, reason: collision with root package name */
        public final PaymentMethod f43562g;

        /* renamed from: h, reason: collision with root package name */
        public final f2 f43563h;

        public Error(String str, String str2, String str3, String str4, String str5, String str6, PaymentMethod paymentMethod, f2 f2Var) {
            this.f43556a = str;
            this.f43557b = str2;
            this.f43558c = str3;
            this.f43559d = str4;
            this.f43560e = str5;
            this.f43561f = str6;
            this.f43562g = paymentMethod;
            this.f43563h = f2Var;
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
            return Intrinsics.b(this.f43556a, error.f43556a) && Intrinsics.b(this.f43557b, error.f43557b) && Intrinsics.b(this.f43558c, error.f43558c) && Intrinsics.b(this.f43559d, error.f43559d) && Intrinsics.b(this.f43560e, error.f43560e) && Intrinsics.b(this.f43561f, error.f43561f) && Intrinsics.b(this.f43562g, error.f43562g) && this.f43563h == error.f43563h;
        }

        public final int hashCode() {
            String str = this.f43556a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43557b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43558c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43559d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43560e;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f43561f;
            int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
            PaymentMethod paymentMethod = this.f43562g;
            int iHashCode7 = (iHashCode6 + (paymentMethod == null ? 0 : paymentMethod.hashCode())) * 31;
            f2 f2Var = this.f43563h;
            return iHashCode7 + (f2Var != null ? f2Var.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Error(charge=", this.f43556a, ", code=", this.f43557b, ", declineCode=");
            b.c0.D(sbW, this.f43558c, ", docUrl=", this.f43559d, ", message=");
            b.c0.D(sbW, this.f43560e, ", param=", this.f43561f, ", paymentMethod=");
            sbW.append(this.f43562g);
            sbW.append(", type=");
            sbW.append(this.f43563h);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43556a);
            dest.writeString(this.f43557b);
            dest.writeString(this.f43558c);
            dest.writeString(this.f43559d);
            dest.writeString(this.f43560e);
            dest.writeString(this.f43561f);
            PaymentMethod paymentMethod = this.f43562g;
            if (paymentMethod == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentMethod.writeToParcel(dest, i5);
            }
            f2 f2Var = this.f43563h;
            if (f2Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(f2Var.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentIntent$Shipping;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Shipping implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Shipping> CREATOR = new g2();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43564a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43565b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43566c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43567d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43568e;

        public Shipping(Address address, String str, String str2, String str3, String str4) {
            Intrinsics.g(address, "address");
            this.f43564a = address;
            this.f43565b = str;
            this.f43566c = str2;
            this.f43567d = str3;
            this.f43568e = str4;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Shipping)) {
                return false;
            }
            Shipping shipping = (Shipping) obj;
            return Intrinsics.b(this.f43564a, shipping.f43564a) && Intrinsics.b(this.f43565b, shipping.f43565b) && Intrinsics.b(this.f43566c, shipping.f43566c) && Intrinsics.b(this.f43567d, shipping.f43567d) && Intrinsics.b(this.f43568e, shipping.f43568e);
        }

        public final int hashCode() {
            int iHashCode = this.f43564a.hashCode() * 31;
            String str = this.f43565b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43566c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43567d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43568e;
            return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shipping(address=");
            sb2.append(this.f43564a);
            sb2.append(", carrier=");
            sb2.append(this.f43565b);
            sb2.append(", name=");
            b.c0.D(sb2, this.f43566c, ", phone=", this.f43567d, ", trackingNumber=");
            return b.c0.q(sb2, this.f43568e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43564a.writeToParcel(dest, i5);
            dest.writeString(this.f43565b);
            dest.writeString(this.f43566c);
            dest.writeString(this.f43567d);
            dest.writeString(this.f43568e);
        }
    }

    public PaymentIntent(String str, List paymentMethodTypes, Long l9, long j11, ft.k0 k0Var, ft.l0 captureMethod, String str2, ft.n0 confirmationMethod, String str3, long j12, String str4, String str5, boolean z11, PaymentMethod paymentMethod, String str6, String str7, StripeIntent.Status status, StripeIntent.Usage usage, Error error, Shipping shipping, List unactivatedPaymentMethods, List linkFundingSources, StripeIntent.NextActionData nextActionData, String str8, boolean z12) {
        Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
        Intrinsics.g(captureMethod, "captureMethod");
        Intrinsics.g(confirmationMethod, "confirmationMethod");
        Intrinsics.g(unactivatedPaymentMethods, "unactivatedPaymentMethods");
        Intrinsics.g(linkFundingSources, "linkFundingSources");
        this.f43533a = str;
        this.f43534b = paymentMethodTypes;
        this.f43535c = l9;
        this.f43536d = j11;
        this.f43537e = k0Var;
        this.f43538f = captureMethod;
        this.f43539g = str2;
        this.f43540h = confirmationMethod;
        this.f43541i = str3;
        this.f43542j = j12;
        this.f43543k = str4;
        this.f43544l = str5;
        this.f43545m = z11;
        this.n = paymentMethod;
        this.o = str6;
        this.f43546p = str7;
        this.f43547q = status;
        this.f43548r = usage;
        this.f43549s = error;
        this.f43550t = shipping;
        this.f43551u = unactivatedPaymentMethods;
        this.f43552v = linkFundingSources;
        this.f43553w = nextActionData;
        this.f43554x = str8;
        this.f43555y = z12;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final boolean D() {
        return this.f43547q == StripeIntent.Status.f43983e;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: F0, reason: from getter */
    public final boolean getF43769g() {
        return this.f43545m;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final Map N() {
        Map mapE;
        String str = this.f43554x;
        return (str == null || (mapE = vh.a.E(new JSONObject(str))) == null) ? b70.h.f17594a : mapE;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final StripeIntent.NextActionType X() {
        StripeIntent.NextActionData nextActionData = this.f43553w;
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
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayPayNowDetails) {
            return StripeIntent.NextActionType.f43976m;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.DisplayPromptPayDetails) {
            return StripeIntent.NextActionType.n;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.VerifyWithMicrodeposits) {
            return StripeIntent.NextActionType.f43970g;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.UpiAwaitNotification) {
            return StripeIntent.NextActionType.f43971h;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.CashAppRedirect) {
            return StripeIntent.NextActionType.f43972i;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.BlikAuthorize) {
            return StripeIntent.NextActionType.f43969f;
        }
        if (nextActionData instanceof StripeIntent.NextActionData.SwishRedirect) {
            return StripeIntent.NextActionType.o;
        }
        if ((nextActionData instanceof StripeIntent.NextActionData.AlipayRedirect) || (nextActionData instanceof StripeIntent.NextActionData.WeChatPayRedirect) || nextActionData == null) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(String code) {
        JSONObject jSONObjectOptJSONObject;
        boolean zB;
        Intrinsics.g(code, "code");
        StripeIntent.Usage usage = this.f43548r;
        int i5 = usage == null ? -1 : h2.f44037a[usage.ordinal()];
        String str = this.f43554x;
        if (i5 == -1) {
            if ((str != null || (jSONObjectOptJSONObject = new JSONObject(str).optJSONObject(code)) == null) ? false : jSONObjectOptJSONObject.has("setup_future_usage")) {
                if (str == null) {
                    JSONObject jSONObjectOptJSONObject2 = new JSONObject(str).optJSONObject(code);
                    zB = Intrinsics.b(jSONObjectOptJSONObject2 != null ? jSONObjectOptJSONObject2.optString("setup_future_usage") : null, "none");
                } else {
                    zB = false;
                }
                if (zB) {
                    return true;
                }
            }
        } else {
            if (i5 != 1 && i5 != 2) {
                if (i5 != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                if (str != null) {
                    if ((str != null || (jSONObjectOptJSONObject = new JSONObject(str).optJSONObject(code)) == null) ? false : jSONObjectOptJSONObject.has("setup_future_usage")) {
                    }
                }
            }
            if (str == null) {
            }
            if (zB) {
            }
        }
        return false;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentIntent)) {
            return false;
        }
        PaymentIntent paymentIntent = (PaymentIntent) obj;
        return Intrinsics.b(this.f43533a, paymentIntent.f43533a) && Intrinsics.b(this.f43534b, paymentIntent.f43534b) && Intrinsics.b(this.f43535c, paymentIntent.f43535c) && this.f43536d == paymentIntent.f43536d && this.f43537e == paymentIntent.f43537e && this.f43538f == paymentIntent.f43538f && Intrinsics.b(this.f43539g, paymentIntent.f43539g) && this.f43540h == paymentIntent.f43540h && Intrinsics.b(this.f43541i, paymentIntent.f43541i) && this.f43542j == paymentIntent.f43542j && Intrinsics.b(this.f43543k, paymentIntent.f43543k) && Intrinsics.b(this.f43544l, paymentIntent.f43544l) && this.f43545m == paymentIntent.f43545m && Intrinsics.b(this.n, paymentIntent.n) && Intrinsics.b(this.o, paymentIntent.o) && Intrinsics.b(this.f43546p, paymentIntent.f43546p) && this.f43547q == paymentIntent.f43547q && this.f43548r == paymentIntent.f43548r && Intrinsics.b(this.f43549s, paymentIntent.f43549s) && Intrinsics.b(this.f43550t, paymentIntent.f43550t) && Intrinsics.b(this.f43551u, paymentIntent.f43551u) && Intrinsics.b(this.f43552v, paymentIntent.f43552v) && Intrinsics.b(this.f43553w, paymentIntent.f43553w) && Intrinsics.b(this.f43554x, paymentIntent.f43554x) && this.f43555y == paymentIntent.f43555y;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: g, reason: from getter */
    public final String getF43767e() {
        return this.f43539g;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: getCountryCode, reason: from getter */
    public final String getF43766d() {
        return this.f43541i;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: getId, reason: from getter */
    public final String getF43763a() {
        return this.f43533a;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: h, reason: from getter */
    public final StripeIntent.Status getF43773k() {
        return this.f43547q;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: h0, reason: from getter */
    public final boolean getF43778r() {
        return this.f43555y;
    }

    public final int hashCode() {
        String str = this.f43533a;
        int iC = b.u4.c((str == null ? 0 : str.hashCode()) * 31, 31, this.f43534b);
        Long l9 = this.f43535c;
        int iD = b.c0.d((iC + (l9 == null ? 0 : l9.hashCode())) * 31, 31, this.f43536d);
        ft.k0 k0Var = this.f43537e;
        int iHashCode = (this.f43538f.hashCode() + ((iD + (k0Var == null ? 0 : k0Var.hashCode())) * 31)) * 31;
        String str2 = this.f43539g;
        int iHashCode2 = (this.f43540h.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        String str3 = this.f43541i;
        int iD2 = b.c0.d((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.f43542j);
        String str4 = this.f43543k;
        int iHashCode3 = (iD2 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43544l;
        int iF = c9.f((iHashCode3 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43545m);
        PaymentMethod paymentMethod = this.n;
        int iHashCode4 = (iF + (paymentMethod == null ? 0 : paymentMethod.hashCode())) * 31;
        String str6 = this.o;
        int iHashCode5 = (iHashCode4 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f43546p;
        int iHashCode6 = (iHashCode5 + (str7 == null ? 0 : str7.hashCode())) * 31;
        StripeIntent.Status status = this.f43547q;
        int iHashCode7 = (iHashCode6 + (status == null ? 0 : status.hashCode())) * 31;
        StripeIntent.Usage usage = this.f43548r;
        int iHashCode8 = (iHashCode7 + (usage == null ? 0 : usage.hashCode())) * 31;
        Error error = this.f43549s;
        int iHashCode9 = (iHashCode8 + (error == null ? 0 : error.hashCode())) * 31;
        Shipping shipping = this.f43550t;
        int iC2 = b.u4.c(b.u4.c((iHashCode9 + (shipping == null ? 0 : shipping.hashCode())) * 31, 31, this.f43551u), 31, this.f43552v);
        StripeIntent.NextActionData nextActionData = this.f43553w;
        int iHashCode10 = (iC2 + (nextActionData == null ? 0 : nextActionData.hashCode())) * 31;
        String str8 = this.f43554x;
        return Boolean.hashCode(this.f43555y) + ((iHashCode10 + (str8 != null ? str8.hashCode() : 0)) * 31);
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: i0, reason: from getter */
    public final PaymentMethod getF43770h() {
        return this.n;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: q, reason: from getter */
    public final StripeIntent.NextActionData getF43776p() {
        return this.f43553w;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: s0, reason: from getter */
    public final List getN() {
        return this.f43551u;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PaymentIntent(id=");
        sb2.append(this.f43533a);
        sb2.append(", paymentMethodTypes=");
        sb2.append(this.f43534b);
        sb2.append(", amount=");
        sb2.append(this.f43535c);
        sb2.append(", canceledAt=");
        sb2.append(this.f43536d);
        sb2.append(", cancellationReason=");
        sb2.append(this.f43537e);
        sb2.append(", captureMethod=");
        sb2.append(this.f43538f);
        sb2.append(", clientSecret=");
        sb2.append(this.f43539g);
        sb2.append(", confirmationMethod=");
        sb2.append(this.f43540h);
        b.c0.C(sb2, ", countryCode=", this.f43541i, ", created=");
        sb2.append(this.f43542j);
        sb2.append(", currency=");
        sb2.append(this.f43543k);
        sb2.append(", description=");
        sb2.append(this.f43544l);
        sb2.append(", isLiveMode=");
        sb2.append(this.f43545m);
        sb2.append(", paymentMethod=");
        sb2.append(this.n);
        sb2.append(", paymentMethodId=");
        sb2.append(this.o);
        sb2.append(", receiptEmail=");
        sb2.append(this.f43546p);
        sb2.append(", status=");
        sb2.append(this.f43547q);
        sb2.append(", setupFutureUsage=");
        sb2.append(this.f43548r);
        sb2.append(", lastPaymentError=");
        sb2.append(this.f43549s);
        sb2.append(", shipping=");
        sb2.append(this.f43550t);
        sb2.append(", unactivatedPaymentMethods=");
        sb2.append(this.f43551u);
        sb2.append(", linkFundingSources=");
        sb2.append(this.f43552v);
        sb2.append(", nextActionData=");
        sb2.append(this.f43553w);
        sb2.append(", paymentMethodOptionsJsonString=");
        sb2.append(this.f43554x);
        sb2.append(", automaticPaymentMethodsEnabled=");
        sb2.append(this.f43555y);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: u, reason: from getter */
    public final List getF43772j() {
        return this.f43534b;
    }

    @Override // com.stripe.android.model.StripeIntent
    /* renamed from: u0, reason: from getter */
    public final List getO() {
        return this.f43552v;
    }

    @Override // com.stripe.android.model.StripeIntent
    public final boolean w0() {
        return b70.g.O0(kotlin.collections.c.f1(new StripeIntent.Status[]{StripeIntent.Status.f43982d, StripeIntent.Status.f43986h, StripeIntent.Status.f43985g}), this.f43547q);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43533a);
        dest.writeStringList(this.f43534b);
        Long l9 = this.f43535c;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeLong(this.f43536d);
        ft.k0 k0Var = this.f43537e;
        if (k0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(k0Var.name());
        }
        dest.writeString(this.f43538f.name());
        dest.writeString(this.f43539g);
        dest.writeString(this.f43540h.name());
        dest.writeString(this.f43541i);
        dest.writeLong(this.f43542j);
        dest.writeString(this.f43543k);
        dest.writeString(this.f43544l);
        dest.writeInt(this.f43545m ? 1 : 0);
        PaymentMethod paymentMethod = this.n;
        if (paymentMethod == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethod.writeToParcel(dest, i5);
        }
        dest.writeString(this.o);
        dest.writeString(this.f43546p);
        StripeIntent.Status status = this.f43547q;
        if (status == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(status.name());
        }
        StripeIntent.Usage usage = this.f43548r;
        if (usage == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(usage.name());
        }
        Error error = this.f43549s;
        if (error == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            error.writeToParcel(dest, i5);
        }
        Shipping shipping = this.f43550t;
        if (shipping == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shipping.writeToParcel(dest, i5);
        }
        dest.writeStringList(this.f43551u);
        dest.writeStringList(this.f43552v);
        dest.writeParcelable(this.f43553w, i5);
        dest.writeString(this.f43554x);
        dest.writeInt(this.f43555y ? 1 : 0);
    }

    public PaymentIntent(String str, List list, Long l9, long j11, ft.k0 k0Var, ft.l0 l0Var, String str2, ft.n0 n0Var, String str3, long j12, String str4, String str5, boolean z11, PaymentMethod paymentMethod, String str6, String str7, StripeIntent.Status status, StripeIntent.Usage usage, Error error, Shipping shipping, List list2, List list3, StripeIntent.NextActionData nextActionData, String str8, boolean z12, int i5) {
        this(str, list, l9, (i5 & 8) != 0 ? 0L : j11, (i5 & 16) != 0 ? null : k0Var, (i5 & 32) != 0 ? ft.l0.f55961c : l0Var, str2, (i5 & 128) != 0 ? ft.n0.f55983c : n0Var, str3, j12, str4, (i5 & 2048) != 0 ? null : str5, z11, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : paymentMethod, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : str6, (32768 & i5) != 0 ? null : str7, (65536 & i5) != 0 ? null : status, (131072 & i5) != 0 ? null : usage, (262144 & i5) != 0 ? null : error, (524288 & i5) != 0 ? null : shipping, list2, (2097152 & i5) != 0 ? EmptyList.f71733a : list3, (4194304 & i5) != 0 ? null : nextActionData, str8, (i5 & 16777216) != 0 ? false : z12);
    }
}
