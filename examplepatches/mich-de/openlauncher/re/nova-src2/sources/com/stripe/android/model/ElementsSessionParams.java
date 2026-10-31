package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0006\u0002\u0003\u0004\u0005\u0006\u0007\u0082\u0001\u0004\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams;", "Landroid/os/Parcelable;", "PaymentIntentType", "SetupIntentType", "DeferredIntentType", "CheckoutSessionType", "SellerDetails", "Link", "Lcom/stripe/android/model/ElementsSessionParams$CheckoutSessionType;", "Lcom/stripe/android/model/ElementsSessionParams$DeferredIntentType;", "Lcom/stripe/android/model/ElementsSessionParams$PaymentIntentType;", "Lcom/stripe/android/model/ElementsSessionParams$SetupIntentType;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ElementsSessionParams extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$Link;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class Link implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new m1();

        /* renamed from: a, reason: collision with root package name */
        public final Set f43471a;

        public Link(Set disallowFundingSourceCreation) {
            Intrinsics.g(disallowFundingSourceCreation, "disallowFundingSourceCreation");
            this.f43471a = disallowFundingSourceCreation;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Link) && Intrinsics.b(this.f43471a, ((Link) obj).f43471a);
        }

        public final int hashCode() {
            return this.f43471a.hashCode();
        }

        public final String toString() {
            return "Link(disallowFundingSourceCreation=" + this.f43471a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Set set = this.f43471a;
            dest.writeInt(set.size());
            Iterator it = set.iterator();
            while (it.hasNext()) {
                dest.writeString((String) it.next());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$PaymentIntentType;", "Lcom/stripe/android/model/ElementsSessionParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentIntentType implements ElementsSessionParams {

        @NotNull
        public static final Parcelable.Creator<PaymentIntentType> CREATOR = new n1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43472a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43473b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43474c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43475d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43476e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43477f;

        /* renamed from: g, reason: collision with root package name */
        public final List f43478g;

        /* renamed from: h, reason: collision with root package name */
        public final List f43479h;

        /* renamed from: i, reason: collision with root package name */
        public final String f43480i;

        /* renamed from: j, reason: collision with root package name */
        public final Link f43481j;

        /* renamed from: k, reason: collision with root package name */
        public final String f43482k;

        public PaymentIntentType(String clientSecret, String str, String str2, String str3, String str4, String str5, ArrayList customPaymentMethods, List externalPaymentMethods, String appId, Link link, String str6) {
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(customPaymentMethods, "customPaymentMethods");
            Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
            Intrinsics.g(appId, "appId");
            Intrinsics.g(link, "link");
            this.f43472a = clientSecret;
            this.f43473b = str;
            this.f43474c = str2;
            this.f43475d = str3;
            this.f43476e = str4;
            this.f43477f = str5;
            this.f43478g = customPaymentMethods;
            this.f43479h = externalPaymentMethods;
            this.f43480i = appId;
            this.f43481j = link;
            this.f43482k = str6;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: G0, reason: from getter */
        public final List getF43491g() {
            return this.f43478g;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: H0, reason: from getter */
        public final String getF43495k() {
            return this.f43482k;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: J, reason: from getter */
        public final String getF43487c() {
            return this.f43474c;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: Z, reason: from getter */
        public final String getF43490f() {
            return this.f43477f;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: c0, reason: from getter */
        public final Link getF43494j() {
            return this.f43481j;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PaymentIntentType)) {
                return false;
            }
            PaymentIntentType paymentIntentType = (PaymentIntentType) obj;
            return Intrinsics.b(this.f43472a, paymentIntentType.f43472a) && Intrinsics.b(this.f43473b, paymentIntentType.f43473b) && Intrinsics.b(this.f43474c, paymentIntentType.f43474c) && Intrinsics.b(this.f43475d, paymentIntentType.f43475d) && Intrinsics.b(this.f43476e, paymentIntentType.f43476e) && Intrinsics.b(this.f43477f, paymentIntentType.f43477f) && Intrinsics.b(this.f43478g, paymentIntentType.f43478g) && Intrinsics.b(this.f43479h, paymentIntentType.f43479h) && Intrinsics.b(this.f43480i, paymentIntentType.f43480i) && Intrinsics.b(this.f43481j, paymentIntentType.f43481j) && Intrinsics.b(this.f43482k, paymentIntentType.f43482k);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g, reason: from getter */
        public final String getF43485a() {
            return this.f43472a;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g0 */
        public final SellerDetails getF43468j() {
            return null;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getAppId, reason: from getter */
        public final String getF43493i() {
            return this.f43480i;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getLocale, reason: from getter */
        public final String getF43486b() {
            return this.f43473b;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final String getType() {
            return "payment_intent";
        }

        public final int hashCode() {
            int iHashCode = this.f43472a.hashCode() * 31;
            String str = this.f43473b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43474c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43475d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43476e;
            int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43477f;
            int iK = h6.c1.k(this.f43481j.f43471a, b.c0.e(b.u4.c(b.u4.c((iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43478g), 31, this.f43479h), 31, this.f43480i), 31);
            String str6 = this.f43482k;
            return iK + (str6 != null ? str6.hashCode() : 0);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: o, reason: from getter */
        public final String getF43488d() {
            return this.f43475d;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final List o0() {
            return ul.b.P("payment_method_preference.payment_intent.payment_method");
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("PaymentIntentType(clientSecret=", this.f43472a, ", locale=", this.f43473b, ", customerSessionClientSecret=");
            b.c0.D(sbW, this.f43474c, ", legacyCustomerEphemeralKey=", this.f43475d, ", savedPaymentMethodSelectionId=");
            b.c0.D(sbW, this.f43476e, ", mobileSessionId=", this.f43477f, ", customPaymentMethods=");
            sbW.append(this.f43478g);
            sbW.append(", externalPaymentMethods=");
            sbW.append(this.f43479h);
            sbW.append(", appId=");
            sbW.append(this.f43480i);
            sbW.append(", link=");
            sbW.append(this.f43481j);
            sbW.append(", countryOverride=");
            return b.c0.q(sbW, this.f43482k, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43472a);
            dest.writeString(this.f43473b);
            dest.writeString(this.f43474c);
            dest.writeString(this.f43475d);
            dest.writeString(this.f43476e);
            dest.writeString(this.f43477f);
            dest.writeStringList(this.f43478g);
            dest.writeStringList(this.f43479h);
            dest.writeString(this.f43480i);
            this.f43481j.writeToParcel(dest, i5);
            dest.writeString(this.f43482k);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: x, reason: from getter */
        public final List getF43492h() {
            return this.f43479h;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: y, reason: from getter */
        public final String getF43489e() {
            return this.f43476e;
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$SellerDetails;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SellerDetails implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<SellerDetails> CREATOR = new o1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43483a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43484b;

        public SellerDetails(String networkId, String externalId) {
            Intrinsics.g(networkId, "networkId");
            Intrinsics.g(externalId, "externalId");
            this.f43483a = networkId;
            this.f43484b = externalId;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SellerDetails)) {
                return false;
            }
            SellerDetails sellerDetails = (SellerDetails) obj;
            return Intrinsics.b(this.f43483a, sellerDetails.f43483a) && Intrinsics.b(this.f43484b, sellerDetails.f43484b);
        }

        public final int hashCode() {
            return this.f43484b.hashCode() + (this.f43483a.hashCode() * 31);
        }

        public final String toString() {
            return b.c0.n("SellerDetails(networkId=", this.f43483a, ", externalId=", this.f43484b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43483a);
            dest.writeString(this.f43484b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$SetupIntentType;", "Lcom/stripe/android/model/ElementsSessionParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupIntentType implements ElementsSessionParams {

        @NotNull
        public static final Parcelable.Creator<SetupIntentType> CREATOR = new p1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43485a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43486b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43487c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43488d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43489e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43490f;

        /* renamed from: g, reason: collision with root package name */
        public final List f43491g;

        /* renamed from: h, reason: collision with root package name */
        public final List f43492h;

        /* renamed from: i, reason: collision with root package name */
        public final String f43493i;

        /* renamed from: j, reason: collision with root package name */
        public final Link f43494j;

        /* renamed from: k, reason: collision with root package name */
        public final String f43495k;

        public SetupIntentType(String clientSecret, String str, String str2, String str3, String str4, String str5, ArrayList customPaymentMethods, List externalPaymentMethods, String appId, Link link, String str6) {
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(customPaymentMethods, "customPaymentMethods");
            Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
            Intrinsics.g(appId, "appId");
            Intrinsics.g(link, "link");
            this.f43485a = clientSecret;
            this.f43486b = str;
            this.f43487c = str2;
            this.f43488d = str3;
            this.f43489e = str4;
            this.f43490f = str5;
            this.f43491g = customPaymentMethods;
            this.f43492h = externalPaymentMethods;
            this.f43493i = appId;
            this.f43494j = link;
            this.f43495k = str6;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: G0, reason: from getter */
        public final List getF43491g() {
            return this.f43491g;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: H0, reason: from getter */
        public final String getF43495k() {
            return this.f43495k;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: J, reason: from getter */
        public final String getF43487c() {
            return this.f43487c;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: Z, reason: from getter */
        public final String getF43490f() {
            return this.f43490f;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: c0, reason: from getter */
        public final Link getF43494j() {
            return this.f43494j;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SetupIntentType)) {
                return false;
            }
            SetupIntentType setupIntentType = (SetupIntentType) obj;
            return Intrinsics.b(this.f43485a, setupIntentType.f43485a) && Intrinsics.b(this.f43486b, setupIntentType.f43486b) && Intrinsics.b(this.f43487c, setupIntentType.f43487c) && Intrinsics.b(this.f43488d, setupIntentType.f43488d) && Intrinsics.b(this.f43489e, setupIntentType.f43489e) && Intrinsics.b(this.f43490f, setupIntentType.f43490f) && Intrinsics.b(this.f43491g, setupIntentType.f43491g) && Intrinsics.b(this.f43492h, setupIntentType.f43492h) && Intrinsics.b(this.f43493i, setupIntentType.f43493i) && Intrinsics.b(this.f43494j, setupIntentType.f43494j) && Intrinsics.b(this.f43495k, setupIntentType.f43495k);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g, reason: from getter */
        public final String getF43485a() {
            return this.f43485a;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g0 */
        public final SellerDetails getF43468j() {
            return null;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getAppId, reason: from getter */
        public final String getF43493i() {
            return this.f43493i;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getLocale, reason: from getter */
        public final String getF43486b() {
            return this.f43486b;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final String getType() {
            return "setup_intent";
        }

        public final int hashCode() {
            int iHashCode = this.f43485a.hashCode() * 31;
            String str = this.f43486b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43487c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43488d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43489e;
            int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43490f;
            int iK = h6.c1.k(this.f43494j.f43471a, b.c0.e(b.u4.c(b.u4.c((iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43491g), 31, this.f43492h), 31, this.f43493i), 31);
            String str6 = this.f43495k;
            return iK + (str6 != null ? str6.hashCode() : 0);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: o, reason: from getter */
        public final String getF43488d() {
            return this.f43488d;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final List o0() {
            return ul.b.P("payment_method_preference.setup_intent.payment_method");
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("SetupIntentType(clientSecret=", this.f43485a, ", locale=", this.f43486b, ", customerSessionClientSecret=");
            b.c0.D(sbW, this.f43487c, ", legacyCustomerEphemeralKey=", this.f43488d, ", savedPaymentMethodSelectionId=");
            b.c0.D(sbW, this.f43489e, ", mobileSessionId=", this.f43490f, ", customPaymentMethods=");
            sbW.append(this.f43491g);
            sbW.append(", externalPaymentMethods=");
            sbW.append(this.f43492h);
            sbW.append(", appId=");
            sbW.append(this.f43493i);
            sbW.append(", link=");
            sbW.append(this.f43494j);
            sbW.append(", countryOverride=");
            return b.c0.q(sbW, this.f43495k, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43485a);
            dest.writeString(this.f43486b);
            dest.writeString(this.f43487c);
            dest.writeString(this.f43488d);
            dest.writeString(this.f43489e);
            dest.writeString(this.f43490f);
            dest.writeStringList(this.f43491g);
            dest.writeStringList(this.f43492h);
            dest.writeString(this.f43493i);
            this.f43494j.writeToParcel(dest, i5);
            dest.writeString(this.f43495k);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: x, reason: from getter */
        public final List getF43492h() {
            return this.f43492h;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: y, reason: from getter */
        public final String getF43489e() {
            return this.f43489e;
        }
    }

    /* renamed from: G0 */
    List getF43491g();

    /* renamed from: H0 */
    String getF43495k();

    /* renamed from: J */
    String getF43487c();

    /* renamed from: Z */
    String getF43490f();

    /* renamed from: c0 */
    Link getF43494j();

    /* renamed from: g */
    String getF43485a();

    /* renamed from: g0 */
    SellerDetails getF43468j();

    /* renamed from: getAppId */
    String getF43493i();

    /* renamed from: getLocale */
    String getF43486b();

    String getType();

    /* renamed from: o */
    String getF43488d();

    List o0();

    /* renamed from: x */
    List getF43492h();

    /* renamed from: y */
    String getF43489e();

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$DeferredIntentType;", "Lcom/stripe/android/model/ElementsSessionParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DeferredIntentType implements ElementsSessionParams {

        @NotNull
        public static final Parcelable.Creator<DeferredIntentType> CREATOR = new l1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43459a;

        /* renamed from: b, reason: collision with root package name */
        public final DeferredIntentParams f43460b;

        /* renamed from: c, reason: collision with root package name */
        public final List f43461c;

        /* renamed from: d, reason: collision with root package name */
        public final List f43462d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43463e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43464f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43465g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43466h;

        /* renamed from: i, reason: collision with root package name */
        public final String f43467i;

        /* renamed from: j, reason: collision with root package name */
        public final SellerDetails f43468j;

        /* renamed from: k, reason: collision with root package name */
        public final Link f43469k;

        /* renamed from: l, reason: collision with root package name */
        public final String f43470l;

        public DeferredIntentType(String str, DeferredIntentParams deferredIntentParams, ArrayList customPaymentMethods, List externalPaymentMethods, String str2, String str3, String str4, String str5, String appId, SellerDetails sellerDetails, Link link, String str6) {
            Intrinsics.g(deferredIntentParams, "deferredIntentParams");
            Intrinsics.g(customPaymentMethods, "customPaymentMethods");
            Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
            Intrinsics.g(appId, "appId");
            Intrinsics.g(link, "link");
            this.f43459a = str;
            this.f43460b = deferredIntentParams;
            this.f43461c = customPaymentMethods;
            this.f43462d = externalPaymentMethods;
            this.f43463e = str2;
            this.f43464f = str3;
            this.f43465g = str4;
            this.f43466h = str5;
            this.f43467i = appId;
            this.f43468j = sellerDetails;
            this.f43469k = link;
            this.f43470l = str6;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: G0, reason: from getter */
        public final List getF43491g() {
            return this.f43461c;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: H0, reason: from getter */
        public final String getF43495k() {
            return this.f43470l;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: J, reason: from getter */
        public final String getF43487c() {
            return this.f43464f;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: Z, reason: from getter */
        public final String getF43490f() {
            return this.f43466h;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: c0, reason: from getter */
        public final Link getF43494j() {
            return this.f43469k;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof DeferredIntentType)) {
                return false;
            }
            DeferredIntentType deferredIntentType = (DeferredIntentType) obj;
            return Intrinsics.b(this.f43459a, deferredIntentType.f43459a) && Intrinsics.b(this.f43460b, deferredIntentType.f43460b) && Intrinsics.b(this.f43461c, deferredIntentType.f43461c) && Intrinsics.b(this.f43462d, deferredIntentType.f43462d) && Intrinsics.b(this.f43463e, deferredIntentType.f43463e) && Intrinsics.b(this.f43464f, deferredIntentType.f43464f) && Intrinsics.b(this.f43465g, deferredIntentType.f43465g) && Intrinsics.b(this.f43466h, deferredIntentType.f43466h) && Intrinsics.b(this.f43467i, deferredIntentType.f43467i) && Intrinsics.b(this.f43468j, deferredIntentType.f43468j) && Intrinsics.b(this.f43469k, deferredIntentType.f43469k) && Intrinsics.b(this.f43470l, deferredIntentType.f43470l);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g */
        public final String getF43485a() {
            return null;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g0, reason: from getter */
        public final SellerDetails getF43468j() {
            return this.f43468j;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getAppId, reason: from getter */
        public final String getF43493i() {
            return this.f43467i;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getLocale, reason: from getter */
        public final String getF43486b() {
            return this.f43459a;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final String getType() {
            return "deferred_intent";
        }

        public final int hashCode() {
            String str = this.f43459a;
            int iC = b.u4.c(b.u4.c((this.f43460b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31)) * 31, 31, this.f43461c), 31, this.f43462d);
            String str2 = this.f43463e;
            int iHashCode = (iC + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43464f;
            int iHashCode2 = (iHashCode + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43465g;
            int iHashCode3 = (iHashCode2 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43466h;
            int iE = b.c0.e((iHashCode3 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43467i);
            SellerDetails sellerDetails = this.f43468j;
            int iK = h6.c1.k(this.f43469k.f43471a, (iE + (sellerDetails == null ? 0 : sellerDetails.hashCode())) * 31, 31);
            String str6 = this.f43470l;
            return iK + (str6 != null ? str6.hashCode() : 0);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: o, reason: from getter */
        public final String getF43488d() {
            return this.f43465g;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final List o0() {
            return EmptyList.f71733a;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("DeferredIntentType(locale=");
            sb2.append(this.f43459a);
            sb2.append(", deferredIntentParams=");
            sb2.append(this.f43460b);
            sb2.append(", customPaymentMethods=");
            sb2.append(this.f43461c);
            sb2.append(", externalPaymentMethods=");
            sb2.append(this.f43462d);
            sb2.append(", savedPaymentMethodSelectionId=");
            b.c0.D(sb2, this.f43463e, ", customerSessionClientSecret=", this.f43464f, ", legacyCustomerEphemeralKey=");
            b.c0.D(sb2, this.f43465g, ", mobileSessionId=", this.f43466h, ", appId=");
            sb2.append(this.f43467i);
            sb2.append(", sellerDetails=");
            sb2.append(this.f43468j);
            sb2.append(", link=");
            sb2.append(this.f43469k);
            sb2.append(", countryOverride=");
            sb2.append(this.f43470l);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43459a);
            dest.writeParcelable(this.f43460b, i5);
            dest.writeStringList(this.f43461c);
            dest.writeStringList(this.f43462d);
            dest.writeString(this.f43463e);
            dest.writeString(this.f43464f);
            dest.writeString(this.f43465g);
            dest.writeString(this.f43466h);
            dest.writeString(this.f43467i);
            SellerDetails sellerDetails = this.f43468j;
            if (sellerDetails == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                sellerDetails.writeToParcel(dest, i5);
            }
            this.f43469k.writeToParcel(dest, i5);
            dest.writeString(this.f43470l);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: x, reason: from getter */
        public final List getF43492h() {
            return this.f43462d;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: y, reason: from getter */
        public final String getF43489e() {
            return this.f43463e;
        }

        public /* synthetic */ DeferredIntentType(DeferredIntentParams deferredIntentParams, ArrayList arrayList, List list, String str, String str2, String str3, String str4, String str5, SellerDetails sellerDetails, Link link, String str6) {
            this(Locale.getDefault().toLanguageTag(), deferredIntentParams, arrayList, list, str, str2, str3, str4, str5, sellerDetails, link, str6);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSessionParams$CheckoutSessionType;", "Lcom/stripe/android/model/ElementsSessionParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CheckoutSessionType implements ElementsSessionParams {

        @NotNull
        public static final Parcelable.Creator<CheckoutSessionType> CREATOR = new k1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43446a;

        /* renamed from: b, reason: collision with root package name */
        public final DeferredIntentParams f43447b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43448c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43449d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43450e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43451f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43452g;

        /* renamed from: h, reason: collision with root package name */
        public final List f43453h;

        /* renamed from: i, reason: collision with root package name */
        public final List f43454i;

        /* renamed from: j, reason: collision with root package name */
        public final String f43455j;

        /* renamed from: k, reason: collision with root package name */
        public final SellerDetails f43456k;

        /* renamed from: l, reason: collision with root package name */
        public final Link f43457l;

        /* renamed from: m, reason: collision with root package name */
        public final String f43458m;

        public CheckoutSessionType(String clientSecret, DeferredIntentParams deferredIntentParams, String str, String str2, String str3, String str4, String str5, List customPaymentMethods, List externalPaymentMethods, String appId, SellerDetails sellerDetails, Link link, String str6) {
            Intrinsics.g(clientSecret, "clientSecret");
            Intrinsics.g(customPaymentMethods, "customPaymentMethods");
            Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
            Intrinsics.g(appId, "appId");
            Intrinsics.g(link, "link");
            this.f43446a = clientSecret;
            this.f43447b = deferredIntentParams;
            this.f43448c = str;
            this.f43449d = str2;
            this.f43450e = str3;
            this.f43451f = str4;
            this.f43452g = str5;
            this.f43453h = customPaymentMethods;
            this.f43454i = externalPaymentMethods;
            this.f43455j = appId;
            this.f43456k = sellerDetails;
            this.f43457l = link;
            this.f43458m = str6;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: G0, reason: from getter */
        public final List getF43491g() {
            return this.f43453h;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: H0, reason: from getter */
        public final String getF43495k() {
            return this.f43458m;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: J, reason: from getter */
        public final String getF43487c() {
            return this.f43449d;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: Z, reason: from getter */
        public final String getF43490f() {
            return this.f43451f;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: c0, reason: from getter */
        public final Link getF43494j() {
            return this.f43457l;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof CheckoutSessionType)) {
                return false;
            }
            CheckoutSessionType checkoutSessionType = (CheckoutSessionType) obj;
            return Intrinsics.b(this.f43446a, checkoutSessionType.f43446a) && Intrinsics.b(this.f43447b, checkoutSessionType.f43447b) && Intrinsics.b(this.f43448c, checkoutSessionType.f43448c) && Intrinsics.b(this.f43449d, checkoutSessionType.f43449d) && Intrinsics.b(this.f43450e, checkoutSessionType.f43450e) && Intrinsics.b(this.f43451f, checkoutSessionType.f43451f) && Intrinsics.b(this.f43452g, checkoutSessionType.f43452g) && Intrinsics.b(this.f43453h, checkoutSessionType.f43453h) && Intrinsics.b(this.f43454i, checkoutSessionType.f43454i) && Intrinsics.b(this.f43455j, checkoutSessionType.f43455j) && Intrinsics.b(this.f43456k, checkoutSessionType.f43456k) && Intrinsics.b(this.f43457l, checkoutSessionType.f43457l) && Intrinsics.b(this.f43458m, checkoutSessionType.f43458m);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g, reason: from getter */
        public final String getF43485a() {
            return this.f43446a;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: g0, reason: from getter */
        public final SellerDetails getF43468j() {
            return this.f43456k;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getAppId, reason: from getter */
        public final String getF43493i() {
            return this.f43455j;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: getLocale, reason: from getter */
        public final String getF43486b() {
            return this.f43448c;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final String getType() {
            return "checkout_session";
        }

        public final int hashCode() {
            int iHashCode = this.f43446a.hashCode() * 31;
            DeferredIntentParams deferredIntentParams = this.f43447b;
            int iHashCode2 = (iHashCode + (deferredIntentParams == null ? 0 : deferredIntentParams.hashCode())) * 31;
            String str = this.f43448c;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43449d;
            int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43450e;
            int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43451f;
            int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43452g;
            int iE = b.c0.e(b.u4.c(b.u4.c((iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f43453h), 31, this.f43454i), 31, this.f43455j);
            SellerDetails sellerDetails = this.f43456k;
            int iK = h6.c1.k(this.f43457l.f43471a, (iE + (sellerDetails == null ? 0 : sellerDetails.hashCode())) * 31, 31);
            String str6 = this.f43458m;
            return iK + (str6 != null ? str6.hashCode() : 0);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: o, reason: from getter */
        public final String getF43488d() {
            return this.f43450e;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        public final List o0() {
            return EmptyList.f71733a;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("CheckoutSessionType(clientSecret=");
            sb2.append(this.f43446a);
            sb2.append(", deferredIntentParams=");
            sb2.append(this.f43447b);
            sb2.append(", locale=");
            b.c0.D(sb2, this.f43448c, ", customerSessionClientSecret=", this.f43449d, ", legacyCustomerEphemeralKey=");
            b.c0.D(sb2, this.f43450e, ", mobileSessionId=", this.f43451f, ", savedPaymentMethodSelectionId=");
            sb2.append(this.f43452g);
            sb2.append(", customPaymentMethods=");
            sb2.append(this.f43453h);
            sb2.append(", externalPaymentMethods=");
            sb2.append(this.f43454i);
            sb2.append(", appId=");
            sb2.append(this.f43455j);
            sb2.append(", sellerDetails=");
            sb2.append(this.f43456k);
            sb2.append(", link=");
            sb2.append(this.f43457l);
            sb2.append(", countryOverride=");
            return b.c0.q(sb2, this.f43458m, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43446a);
            dest.writeParcelable(this.f43447b, i5);
            dest.writeString(this.f43448c);
            dest.writeString(this.f43449d);
            dest.writeString(this.f43450e);
            dest.writeString(this.f43451f);
            dest.writeString(this.f43452g);
            dest.writeStringList(this.f43453h);
            dest.writeStringList(this.f43454i);
            dest.writeString(this.f43455j);
            SellerDetails sellerDetails = this.f43456k;
            if (sellerDetails == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                sellerDetails.writeToParcel(dest, i5);
            }
            this.f43457l.writeToParcel(dest, i5);
            dest.writeString(this.f43458m);
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: x, reason: from getter */
        public final List getF43492h() {
            return this.f43454i;
        }

        @Override // com.stripe.android.model.ElementsSessionParams
        /* renamed from: y, reason: from getter */
        public final String getF43489e() {
            return this.f43452g;
        }

        public CheckoutSessionType(String str, String str2, String str3, String str4, String str5, ArrayList arrayList, List list, String str6, Link link, String str7, int i5) {
            this(str, null, Locale.getDefault().toLanguageTag(), (i5 & 8) != 0 ? null : str2, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : str4, (i5 & 64) != 0 ? null : str5, (i5 & 128) != 0 ? EmptyList.f71733a : arrayList, (i5 & 256) != 0 ? EmptyList.f71733a : list, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str6, null, (i5 & 2048) != 0 ? new Link(EmptySet.f71734a) : link, (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str7);
        }
    }
}
