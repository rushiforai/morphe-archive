package com.stripe.android.model;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.Keep;
import com.stripe.android.core.model.StripeModel;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/model/StripeIntent;", "Lcom/stripe/android/core/model/StripeModel;", "NextActionType", "Status", "Usage", "NextActionData", "Lcom/stripe/android/model/PaymentIntent;", "Lcom/stripe/android/model/SetupIntent;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface StripeIntent extends StripeModel {

    @Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0010\u0002\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0082\u0001\u000f\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f ¨\u0006!"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lcom/stripe/android/core/model/StripeModel;", "com/stripe/android/model/z5", "DisplayOxxoDetails", "DisplayBoletoDetails", "DisplayKonbiniDetails", "DisplayMultibancoDetails", "DisplayPayNowDetails", "DisplayPromptPayDetails", "RedirectToUrl", "AlipayRedirect", "SdkData", "BlikAuthorize", "WeChatPayRedirect", "VerifyWithMicrodeposits", "UpiAwaitNotification", "CashAppRedirect", "SwishRedirect", "Lcom/stripe/android/model/StripeIntent$NextActionData$AlipayRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData$BlikAuthorize;", "Lcom/stripe/android/model/StripeIntent$NextActionData$CashAppRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayBoletoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayKonbiniDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayMultibancoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayOxxoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayPayNowDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayPromptPayDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData$RedirectToUrl;", "Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData;", "Lcom/stripe/android/model/StripeIntent$NextActionData$SwishRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData$UpiAwaitNotification;", "Lcom/stripe/android/model/StripeIntent$NextActionData$VerifyWithMicrodeposits;", "Lcom/stripe/android/model/StripeIntent$NextActionData$WeChatPayRedirect;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class NextActionData implements StripeModel {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$AlipayRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class AlipayRedirect extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<AlipayRedirect> CREATOR = new q5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43932a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43933b;

            /* renamed from: c, reason: collision with root package name */
            public final Uri f43934c;

            /* renamed from: d, reason: collision with root package name */
            public final String f43935d;

            public AlipayRedirect(String data, String str, Uri webViewUrl, String str2) {
                Intrinsics.g(data, "data");
                Intrinsics.g(webViewUrl, "webViewUrl");
                this.f43932a = data;
                this.f43933b = str;
                this.f43934c = webViewUrl;
                this.f43935d = str2;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof AlipayRedirect)) {
                    return false;
                }
                AlipayRedirect alipayRedirect = (AlipayRedirect) obj;
                return Intrinsics.b(this.f43932a, alipayRedirect.f43932a) && Intrinsics.b(this.f43933b, alipayRedirect.f43933b) && Intrinsics.b(this.f43934c, alipayRedirect.f43934c) && Intrinsics.b(this.f43935d, alipayRedirect.f43935d);
            }

            public final int hashCode() {
                int iHashCode = this.f43932a.hashCode() * 31;
                String str = this.f43933b;
                int iHashCode2 = (this.f43934c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31;
                String str2 = this.f43935d;
                return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
            }

            public final String toString() {
                StringBuilder sbW = b.c0.w("AlipayRedirect(data=", this.f43932a, ", authCompleteUrl=", this.f43933b, ", webViewUrl=");
                sbW.append(this.f43934c);
                sbW.append(", returnUrl=");
                sbW.append(this.f43935d);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43932a);
                dest.writeString(this.f43933b);
                dest.writeParcelable(this.f43934c, i5);
                dest.writeString(this.f43935d);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$BlikAuthorize;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class BlikAuthorize extends NextActionData {

            /* renamed from: a, reason: collision with root package name */
            public static final BlikAuthorize f43936a = new BlikAuthorize();

            @NotNull
            public static final Parcelable.Creator<BlikAuthorize> CREATOR = new r5();

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return this == obj || (obj instanceof BlikAuthorize);
            }

            public final int hashCode() {
                return 1031794127;
            }

            public final String toString() {
                return "BlikAuthorize";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(1);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$CashAppRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class CashAppRedirect extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<CashAppRedirect> CREATOR = new s5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43937a;

            public CashAppRedirect(String mobileAuthUrl) {
                Intrinsics.g(mobileAuthUrl, "mobileAuthUrl");
                this.f43937a = mobileAuthUrl;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof CashAppRedirect) && Intrinsics.b(this.f43937a, ((CashAppRedirect) obj).f43937a);
            }

            public final int hashCode() {
                return this.f43937a.hashCode();
            }

            public final String toString() {
                return b.c0.l("CashAppRedirect(mobileAuthUrl=", this.f43937a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43937a);
            }
        }

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayBoletoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lcom/stripe/android/model/z5;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayBoletoDetails extends NextActionData implements z5 {

            @NotNull
            public static final Parcelable.Creator<DisplayBoletoDetails> CREATOR = new t5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43938a;

            public DisplayBoletoDetails(String str) {
                this.f43938a = str;
            }

            @Override // com.stripe.android.model.z5
            /* renamed from: b, reason: from getter */
            public final String getF43943c() {
                return this.f43938a;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof DisplayBoletoDetails) && Intrinsics.b(this.f43938a, ((DisplayBoletoDetails) obj).f43938a);
            }

            public final int hashCode() {
                String str = this.f43938a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return b.c0.l("DisplayBoletoDetails(hostedVoucherUrl=", this.f43938a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43938a);
            }
        }

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayKonbiniDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lcom/stripe/android/model/z5;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayKonbiniDetails extends NextActionData implements z5 {

            @NotNull
            public static final Parcelable.Creator<DisplayKonbiniDetails> CREATOR = new u5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43939a;

            public DisplayKonbiniDetails(String str) {
                this.f43939a = str;
            }

            @Override // com.stripe.android.model.z5
            /* renamed from: b, reason: from getter */
            public final String getF43943c() {
                return this.f43939a;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof DisplayKonbiniDetails) && Intrinsics.b(this.f43939a, ((DisplayKonbiniDetails) obj).f43939a);
            }

            public final int hashCode() {
                String str = this.f43939a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return b.c0.l("DisplayKonbiniDetails(hostedVoucherUrl=", this.f43939a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43939a);
            }
        }

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayMultibancoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lcom/stripe/android/model/z5;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayMultibancoDetails extends NextActionData implements z5 {

            @NotNull
            public static final Parcelable.Creator<DisplayMultibancoDetails> CREATOR = new v5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43940a;

            public DisplayMultibancoDetails(String str) {
                this.f43940a = str;
            }

            @Override // com.stripe.android.model.z5
            /* renamed from: b, reason: from getter */
            public final String getF43943c() {
                return this.f43940a;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof DisplayMultibancoDetails) && Intrinsics.b(this.f43940a, ((DisplayMultibancoDetails) obj).f43940a);
            }

            public final int hashCode() {
                String str = this.f43940a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return b.c0.l("DisplayMultibancoDetails(hostedVoucherUrl=", this.f43940a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43940a);
            }
        }

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayOxxoDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lcom/stripe/android/model/z5;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayOxxoDetails extends NextActionData implements z5 {

            @NotNull
            public static final Parcelable.Creator<DisplayOxxoDetails> CREATOR = new w5();

            /* renamed from: a, reason: collision with root package name */
            public final int f43941a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43942b;

            /* renamed from: c, reason: collision with root package name */
            public final String f43943c;

            public DisplayOxxoDetails(int i5, String str, String str2) {
                this.f43941a = i5;
                this.f43942b = str;
                this.f43943c = str2;
            }

            @Override // com.stripe.android.model.z5
            /* renamed from: b, reason: from getter */
            public final String getF43943c() {
                return this.f43943c;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof DisplayOxxoDetails)) {
                    return false;
                }
                DisplayOxxoDetails displayOxxoDetails = (DisplayOxxoDetails) obj;
                return this.f43941a == displayOxxoDetails.f43941a && Intrinsics.b(this.f43942b, displayOxxoDetails.f43942b) && Intrinsics.b(this.f43943c, displayOxxoDetails.f43943c);
            }

            public final int hashCode() {
                int iHashCode = Integer.hashCode(this.f43941a) * 31;
                String str = this.f43942b;
                int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
                String str2 = this.f43943c;
                return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
            }

            public final String toString() {
                StringBuilder sb2 = new StringBuilder("DisplayOxxoDetails(expiresAfter=");
                sb2.append(this.f43941a);
                sb2.append(", number=");
                sb2.append(this.f43942b);
                sb2.append(", hostedVoucherUrl=");
                return b.c0.q(sb2, this.f43943c, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(this.f43941a);
                dest.writeString(this.f43942b);
                dest.writeString(this.f43943c);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayPayNowDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayPayNowDetails extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<DisplayPayNowDetails> CREATOR = new x5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43944a;

            public DisplayPayNowDetails(String str) {
                this.f43944a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof DisplayPayNowDetails) && Intrinsics.b(this.f43944a, ((DisplayPayNowDetails) obj).f43944a);
            }

            public final int hashCode() {
                String str = this.f43944a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return b.c0.l("DisplayPayNowDetails(qrCodeUrl=", this.f43944a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43944a);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$DisplayPromptPayDetails;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class DisplayPromptPayDetails extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<DisplayPromptPayDetails> CREATOR = new y5();

            /* renamed from: a, reason: collision with root package name */
            public final String f43945a;

            public DisplayPromptPayDetails(String str) {
                this.f43945a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof DisplayPromptPayDetails) && Intrinsics.b(this.f43945a, ((DisplayPromptPayDetails) obj).f43945a);
            }

            public final int hashCode() {
                String str = this.f43945a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return b.c0.l("DisplayPromptPayDetails(qrCodeUrl=", this.f43945a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43945a);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$RedirectToUrl;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class RedirectToUrl extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<RedirectToUrl> CREATOR = new a6();

            /* renamed from: a, reason: collision with root package name */
            public final Uri f43946a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43947b;

            public RedirectToUrl(Uri url, String str) {
                Intrinsics.g(url, "url");
                this.f43946a = url;
                this.f43947b = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof RedirectToUrl)) {
                    return false;
                }
                RedirectToUrl redirectToUrl = (RedirectToUrl) obj;
                return Intrinsics.b(this.f43946a, redirectToUrl.f43946a) && Intrinsics.b(this.f43947b, redirectToUrl.f43947b);
            }

            public final int hashCode() {
                int iHashCode = this.f43946a.hashCode() * 31;
                String str = this.f43947b;
                return iHashCode + (str == null ? 0 : str.hashCode());
            }

            public final String toString() {
                return "RedirectToUrl(url=" + this.f43946a + ", returnUrl=" + this.f43947b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeParcelable(this.f43946a, i5);
                dest.writeString(this.f43947b);
            }
        }

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Use3DS2", "IntentConfirmationChallenge", "Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData$IntentConfirmationChallenge;", "Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData$Use3DS2;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static abstract class SdkData extends NextActionData {

            @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData$IntentConfirmationChallenge;", "Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final /* data */ class IntentConfirmationChallenge extends SdkData {

                /* renamed from: a, reason: collision with root package name */
                public static final IntentConfirmationChallenge f43948a = new IntentConfirmationChallenge();

                @NotNull
                public static final Parcelable.Creator<IntentConfirmationChallenge> CREATOR = new b6();

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    return this == obj || (obj instanceof IntentConfirmationChallenge);
                }

                public final int hashCode() {
                    return -208193446;
                }

                public final String toString() {
                    return "IntentConfirmationChallenge";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeInt(1);
                }
            }

            @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData$Use3DS2;", "Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData;", "DirectoryServerEncryption", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class Use3DS2 extends SdkData {

                @NotNull
                public static final Parcelable.Creator<Use3DS2> CREATOR = new c6();

                /* renamed from: a, reason: collision with root package name */
                public final String f43949a;

                /* renamed from: b, reason: collision with root package name */
                public final String f43950b;

                /* renamed from: c, reason: collision with root package name */
                public final String f43951c;

                /* renamed from: d, reason: collision with root package name */
                public final DirectoryServerEncryption f43952d;

                /* renamed from: e, reason: collision with root package name */
                public final String f43953e;

                /* renamed from: f, reason: collision with root package name */
                public final String f43954f;

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$SdkData$Use3DS2$DirectoryServerEncryption;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final class DirectoryServerEncryption implements Parcelable {

                    @NotNull
                    public static final Parcelable.Creator<DirectoryServerEncryption> CREATOR = new d6();

                    /* renamed from: a, reason: collision with root package name */
                    public final String f43955a;

                    /* renamed from: b, reason: collision with root package name */
                    public final String f43956b;

                    /* renamed from: c, reason: collision with root package name */
                    public final List f43957c;

                    /* renamed from: d, reason: collision with root package name */
                    public final String f43958d;

                    public DirectoryServerEncryption(String directoryServerId, String dsCertificateData, List rootCertsData, String str) {
                        Intrinsics.g(directoryServerId, "directoryServerId");
                        Intrinsics.g(dsCertificateData, "dsCertificateData");
                        Intrinsics.g(rootCertsData, "rootCertsData");
                        this.f43955a = directoryServerId;
                        this.f43956b = dsCertificateData;
                        this.f43957c = rootCertsData;
                        this.f43958d = str;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof DirectoryServerEncryption)) {
                            return false;
                        }
                        DirectoryServerEncryption directoryServerEncryption = (DirectoryServerEncryption) obj;
                        return Intrinsics.b(this.f43955a, directoryServerEncryption.f43955a) && Intrinsics.b(this.f43956b, directoryServerEncryption.f43956b) && Intrinsics.b(this.f43957c, directoryServerEncryption.f43957c) && Intrinsics.b(this.f43958d, directoryServerEncryption.f43958d);
                    }

                    public final int hashCode() {
                        int iC = b.u4.c(b.c0.e(this.f43955a.hashCode() * 31, 31, this.f43956b), 31, this.f43957c);
                        String str = this.f43958d;
                        return iC + (str == null ? 0 : str.hashCode());
                    }

                    public final String toString() {
                        StringBuilder sbW = b.c0.w("DirectoryServerEncryption(directoryServerId=", this.f43955a, ", dsCertificateData=", this.f43956b, ", rootCertsData=");
                        sbW.append(this.f43957c);
                        sbW.append(", keyId=");
                        sbW.append(this.f43958d);
                        sbW.append(")");
                        return sbW.toString();
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeString(this.f43955a);
                        dest.writeString(this.f43956b);
                        dest.writeStringList(this.f43957c);
                        dest.writeString(this.f43958d);
                    }
                }

                public Use3DS2(String source, String serverName, String transactionId, DirectoryServerEncryption serverEncryption, String str, String str2) {
                    Intrinsics.g(source, "source");
                    Intrinsics.g(serverName, "serverName");
                    Intrinsics.g(transactionId, "transactionId");
                    Intrinsics.g(serverEncryption, "serverEncryption");
                    this.f43949a = source;
                    this.f43950b = serverName;
                    this.f43951c = transactionId;
                    this.f43952d = serverEncryption;
                    this.f43953e = str;
                    this.f43954f = str2;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof Use3DS2)) {
                        return false;
                    }
                    Use3DS2 use3DS2 = (Use3DS2) obj;
                    return Intrinsics.b(this.f43949a, use3DS2.f43949a) && Intrinsics.b(this.f43950b, use3DS2.f43950b) && Intrinsics.b(this.f43951c, use3DS2.f43951c) && Intrinsics.b(this.f43952d, use3DS2.f43952d) && Intrinsics.b(this.f43953e, use3DS2.f43953e) && Intrinsics.b(this.f43954f, use3DS2.f43954f);
                }

                public final int hashCode() {
                    int iHashCode = (this.f43952d.hashCode() + b.c0.e(b.c0.e(this.f43949a.hashCode() * 31, 31, this.f43950b), 31, this.f43951c)) * 31;
                    String str = this.f43953e;
                    int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
                    String str2 = this.f43954f;
                    return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
                }

                public final String toString() {
                    StringBuilder sbW = b.c0.w("Use3DS2(source=", this.f43949a, ", serverName=", this.f43950b, ", transactionId=");
                    sbW.append(this.f43951c);
                    sbW.append(", serverEncryption=");
                    sbW.append(this.f43952d);
                    sbW.append(", threeDS2IntentId=");
                    return b.c0.s(sbW, this.f43953e, ", publishableKey=", this.f43954f, ")");
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeString(this.f43949a);
                    dest.writeString(this.f43950b);
                    dest.writeString(this.f43951c);
                    this.f43952d.writeToParcel(dest, i5);
                    dest.writeString(this.f43953e);
                    dest.writeString(this.f43954f);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$SwishRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class SwishRedirect extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<SwishRedirect> CREATOR = new e6();

            /* renamed from: a, reason: collision with root package name */
            public final String f43959a;

            public SwishRedirect(String mobileAuthUrl) {
                Intrinsics.g(mobileAuthUrl, "mobileAuthUrl");
                this.f43959a = mobileAuthUrl;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof SwishRedirect) && Intrinsics.b(this.f43959a, ((SwishRedirect) obj).f43959a);
            }

            public final int hashCode() {
                return this.f43959a.hashCode();
            }

            public final String toString() {
                return b.c0.l("SwishRedirect(mobileAuthUrl=", this.f43959a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43959a);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$UpiAwaitNotification;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class UpiAwaitNotification extends NextActionData {

            /* renamed from: a, reason: collision with root package name */
            public static final UpiAwaitNotification f43960a = new UpiAwaitNotification();

            @NotNull
            public static final Parcelable.Creator<UpiAwaitNotification> CREATOR = new f6();

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return this == obj || (obj instanceof UpiAwaitNotification);
            }

            public final int hashCode() {
                return -1021414879;
            }

            public final String toString() {
                return "UpiAwaitNotification";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(1);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$VerifyWithMicrodeposits;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class VerifyWithMicrodeposits extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<VerifyWithMicrodeposits> CREATOR = new g6();

            /* renamed from: a, reason: collision with root package name */
            public final long f43961a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43962b;

            /* renamed from: c, reason: collision with root package name */
            public final ft.f0 f43963c;

            public VerifyWithMicrodeposits(long j11, String hostedVerificationUrl, ft.f0 microdepositType) {
                Intrinsics.g(hostedVerificationUrl, "hostedVerificationUrl");
                Intrinsics.g(microdepositType, "microdepositType");
                this.f43961a = j11;
                this.f43962b = hostedVerificationUrl;
                this.f43963c = microdepositType;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof VerifyWithMicrodeposits)) {
                    return false;
                }
                VerifyWithMicrodeposits verifyWithMicrodeposits = (VerifyWithMicrodeposits) obj;
                return this.f43961a == verifyWithMicrodeposits.f43961a && Intrinsics.b(this.f43962b, verifyWithMicrodeposits.f43962b) && this.f43963c == verifyWithMicrodeposits.f43963c;
            }

            public final int hashCode() {
                return this.f43963c.hashCode() + b.c0.e(Long.hashCode(this.f43961a) * 31, 31, this.f43962b);
            }

            public final String toString() {
                StringBuilder sbL = a80.m.l(this.f43961a, "VerifyWithMicrodeposits(arrivalDate=", ", hostedVerificationUrl=", this.f43962b);
                sbL.append(", microdepositType=");
                sbL.append(this.f43963c);
                sbL.append(")");
                return sbL.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeLong(this.f43961a);
                dest.writeString(this.f43962b);
                dest.writeString(this.f43963c.name());
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionData$WeChatPayRedirect;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class WeChatPayRedirect extends NextActionData {

            @NotNull
            public static final Parcelable.Creator<WeChatPayRedirect> CREATOR = new h6();

            /* renamed from: a, reason: collision with root package name */
            public final WeChat f43964a;

            public WeChatPayRedirect(WeChat weChat) {
                Intrinsics.g(weChat, "weChat");
                this.f43964a = weChat;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof WeChatPayRedirect) && Intrinsics.b(this.f43964a, ((WeChatPayRedirect) obj).f43964a);
            }

            public final int hashCode() {
                return this.f43964a.hashCode();
            }

            public final String toString() {
                return "WeChatPayRedirect(weChat=" + this.f43964a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                this.f43964a.writeToParcel(dest, i5);
            }
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/StripeIntent$NextActionType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/i6", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NextActionType {

        /* renamed from: b, reason: collision with root package name */
        public static final i6 f43965b;

        /* renamed from: c, reason: collision with root package name */
        public static final NextActionType f43966c;

        /* renamed from: d, reason: collision with root package name */
        public static final NextActionType f43967d;

        /* renamed from: e, reason: collision with root package name */
        public static final NextActionType f43968e;

        /* renamed from: f, reason: collision with root package name */
        public static final NextActionType f43969f;

        /* renamed from: g, reason: collision with root package name */
        public static final NextActionType f43970g;

        /* renamed from: h, reason: collision with root package name */
        public static final NextActionType f43971h;

        /* renamed from: i, reason: collision with root package name */
        public static final NextActionType f43972i;

        /* renamed from: j, reason: collision with root package name */
        public static final NextActionType f43973j;

        /* renamed from: k, reason: collision with root package name */
        public static final NextActionType f43974k;

        /* renamed from: l, reason: collision with root package name */
        public static final NextActionType f43975l;

        /* renamed from: m, reason: collision with root package name */
        public static final NextActionType f43976m;
        public static final NextActionType n;
        public static final NextActionType o;

        /* renamed from: p, reason: collision with root package name */
        public static final /* synthetic */ NextActionType[] f43977p;

        /* renamed from: q, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43978q;

        /* renamed from: a, reason: collision with root package name */
        public final String f43979a;

        static {
            NextActionType nextActionType = new NextActionType("RedirectToUrl", 0, "redirect_to_url");
            f43966c = nextActionType;
            NextActionType nextActionType2 = new NextActionType("UseStripeSdk", 1, "use_stripe_sdk");
            f43967d = nextActionType2;
            NextActionType nextActionType3 = new NextActionType("DisplayOxxoDetails", 2, "oxxo_display_details");
            f43968e = nextActionType3;
            NextActionType nextActionType4 = new NextActionType("AlipayRedirect", 3, "alipay_handle_redirect");
            NextActionType nextActionType5 = new NextActionType("BlikAuthorize", 4, "blik_authorize");
            f43969f = nextActionType5;
            NextActionType nextActionType6 = new NextActionType("WeChatPayRedirect", 5, "wechat_pay_redirect_to_android_app");
            NextActionType nextActionType7 = new NextActionType("VerifyWithMicrodeposits", 6, "verify_with_microdeposits");
            f43970g = nextActionType7;
            NextActionType nextActionType8 = new NextActionType("UpiAwaitNotification", 7, "upi_await_notification");
            f43971h = nextActionType8;
            NextActionType nextActionType9 = new NextActionType("CashAppRedirect", 8, "cashapp_handle_redirect_or_display_qr_code");
            f43972i = nextActionType9;
            NextActionType nextActionType10 = new NextActionType("DisplayBoletoDetails", 9, "boleto_display_details");
            f43973j = nextActionType10;
            NextActionType nextActionType11 = new NextActionType("DisplayKonbiniDetails", 10, "konbini_display_details");
            f43974k = nextActionType11;
            NextActionType nextActionType12 = new NextActionType("DisplayMultibancoDetails", 11, "multibanco_display_details");
            f43975l = nextActionType12;
            NextActionType nextActionType13 = new NextActionType("DisplayPayNowDetails", 12, "paynow_display_qr_code");
            f43976m = nextActionType13;
            NextActionType nextActionType14 = new NextActionType("DisplayPromptPayDetails", 13, "promptpay_display_qr_code");
            n = nextActionType14;
            NextActionType nextActionType15 = new NextActionType("SwishRedirect", 14, "swish_handle_redirect_or_display_qr_code");
            o = nextActionType15;
            NextActionType[] nextActionTypeArr = {nextActionType, nextActionType2, nextActionType3, nextActionType4, nextActionType5, nextActionType6, nextActionType7, nextActionType8, nextActionType9, nextActionType10, nextActionType11, nextActionType12, nextActionType13, nextActionType14, nextActionType15};
            f43977p = nextActionTypeArr;
            f43978q = EnumEntriesKt.a(nextActionTypeArr);
            f43965b = new i6();
        }

        public NextActionType(String str, int i5, String str2) {
            this.f43979a = str2;
        }

        public static NextActionType valueOf(String str) {
            return (NextActionType) Enum.valueOf(NextActionType.class, str);
        }

        public static NextActionType[] values() {
            return (NextActionType[]) f43977p.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43979a;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/StripeIntent$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/j6", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Status {

        /* renamed from: b, reason: collision with root package name */
        public static final j6 f43980b;

        /* renamed from: c, reason: collision with root package name */
        public static final Status f43981c;

        /* renamed from: d, reason: collision with root package name */
        public static final Status f43982d;

        /* renamed from: e, reason: collision with root package name */
        public static final Status f43983e;

        /* renamed from: f, reason: collision with root package name */
        public static final Status f43984f;

        /* renamed from: g, reason: collision with root package name */
        public static final Status f43985g;

        /* renamed from: h, reason: collision with root package name */
        public static final Status f43986h;

        /* renamed from: i, reason: collision with root package name */
        public static final /* synthetic */ Status[] f43987i;

        /* renamed from: j, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43988j;

        /* renamed from: a, reason: collision with root package name */
        public final String f43989a;

        static {
            Status status = new Status("Canceled", 0, "canceled");
            f43981c = status;
            Status status2 = new Status("Processing", 1, "processing");
            f43982d = status2;
            Status status3 = new Status("RequiresAction", 2, "requires_action");
            f43983e = status3;
            Status status4 = new Status("RequiresConfirmation", 3, "requires_confirmation");
            Status status5 = new Status("RequiresPaymentMethod", 4, "requires_payment_method");
            f43984f = status5;
            Status status6 = new Status("Succeeded", 5, "succeeded");
            f43985g = status6;
            Status status7 = new Status("RequiresCapture", 6, "requires_capture");
            f43986h = status7;
            Status[] statusArr = {status, status2, status3, status4, status5, status6, status7};
            f43987i = statusArr;
            f43988j = EnumEntriesKt.a(statusArr);
            f43980b = new j6();
        }

        public Status(String str, int i5, String str2) {
            this.f43989a = str2;
        }

        public static Status valueOf(String str) {
            return (Status) Enum.valueOf(Status.class, str);
        }

        public static Status[] values() {
            return (Status[]) f43987i.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43989a;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/StripeIntent$Usage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/k6", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Usage {

        /* renamed from: b, reason: collision with root package name */
        public static final k6 f43990b;

        /* renamed from: c, reason: collision with root package name */
        public static final Usage f43991c;

        /* renamed from: d, reason: collision with root package name */
        public static final Usage f43992d;

        /* renamed from: e, reason: collision with root package name */
        public static final /* synthetic */ Usage[] f43993e;

        /* renamed from: f, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43994f;

        /* renamed from: a, reason: collision with root package name */
        public final String f43995a;

        static {
            Usage usage = new Usage("OnSession", 0, "on_session");
            f43991c = usage;
            Usage usage2 = new Usage("OffSession", 1, "off_session");
            f43992d = usage2;
            Usage[] usageArr = {usage, usage2, new Usage("OneTime", 2, "one_time")};
            f43993e = usageArr;
            f43994f = EnumEntriesKt.a(usageArr);
            f43990b = new k6();
        }

        public Usage(String str, int i5, String str2) {
            this.f43995a = str2;
        }

        public static Usage valueOf(String str) {
            return (Usage) Enum.valueOf(Usage.class, str);
        }

        public static Usage[] values() {
            return (Usage[]) f43993e.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43995a;
        }
    }

    boolean D();

    /* renamed from: F0 */
    boolean getF43769g();

    Map N();

    NextActionType X();

    /* renamed from: g */
    String getF43767e();

    /* renamed from: getCountryCode */
    String getF43766d();

    /* renamed from: getId */
    String getF43763a();

    /* renamed from: h */
    Status getF43773k();

    /* renamed from: h0 */
    boolean getF43778r();

    /* renamed from: i0 */
    PaymentMethod getF43770h();

    /* renamed from: q */
    NextActionData getF43776p();

    /* renamed from: s0 */
    List getN();

    /* renamed from: u */
    List getF43772j();

    /* renamed from: u0 */
    List getO();

    boolean w0();
}
