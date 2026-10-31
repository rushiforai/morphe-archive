package com.stripe.android.paymentelement.confirmation.gpay;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ou.q0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/gpay/GooglePayConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "Config", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class GooglePayConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<GooglePayConfirmationOption> CREATOR = new c();

    /* renamed from: a, reason: collision with root package name */
    public final Config f44161a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/gpay/GooglePayConfirmationOption$Config;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Config implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Config> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final q0 f44162a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44163b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44164c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44165d;

        /* renamed from: e, reason: collision with root package name */
        public final Long f44166e;

        /* renamed from: f, reason: collision with root package name */
        public final String f44167f;

        /* renamed from: g, reason: collision with root package name */
        public final PaymentSheet$BillingDetailsCollectionConfiguration f44168g;

        /* renamed from: h, reason: collision with root package name */
        public final CardBrandFilter f44169h;

        /* renamed from: i, reason: collision with root package name */
        public final CardFundingFilter f44170i;

        /* renamed from: j, reason: collision with root package name */
        public final List f44171j;

        public Config(q0 q0Var, String merchantName, String merchantCountryCode, String str, Long l9, String str2, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, List additionalEnabledNetworks) {
            Intrinsics.g(merchantName, "merchantName");
            Intrinsics.g(merchantCountryCode, "merchantCountryCode");
            Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
            Intrinsics.g(cardBrandFilter, "cardBrandFilter");
            Intrinsics.g(cardFundingFilter, "cardFundingFilter");
            Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
            this.f44162a = q0Var;
            this.f44163b = merchantName;
            this.f44164c = merchantCountryCode;
            this.f44165d = str;
            this.f44166e = l9;
            this.f44167f = str2;
            this.f44168g = billingDetailsCollectionConfiguration;
            this.f44169h = cardBrandFilter;
            this.f44170i = cardFundingFilter;
            this.f44171j = additionalEnabledNetworks;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Config)) {
                return false;
            }
            Config config = (Config) obj;
            return this.f44162a == config.f44162a && Intrinsics.b(this.f44163b, config.f44163b) && Intrinsics.b(this.f44164c, config.f44164c) && Intrinsics.b(this.f44165d, config.f44165d) && Intrinsics.b(this.f44166e, config.f44166e) && Intrinsics.b(this.f44167f, config.f44167f) && Intrinsics.b(this.f44168g, config.f44168g) && Intrinsics.b(this.f44169h, config.f44169h) && Intrinsics.b(this.f44170i, config.f44170i) && Intrinsics.b(this.f44171j, config.f44171j);
        }

        public final int hashCode() {
            q0 q0Var = this.f44162a;
            int iE = c0.e(c0.e((q0Var == null ? 0 : q0Var.hashCode()) * 31, 31, this.f44163b), 31, this.f44164c);
            String str = this.f44165d;
            int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
            Long l9 = this.f44166e;
            int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
            String str2 = this.f44167f;
            return this.f44171j.hashCode() + ((this.f44170i.hashCode() + ((this.f44169h.hashCode() + ((this.f44168g.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Config(environment=");
            sb2.append(this.f44162a);
            sb2.append(", merchantName=");
            sb2.append(this.f44163b);
            sb2.append(", merchantCountryCode=");
            c0.D(sb2, this.f44164c, ", merchantCurrencyCode=", this.f44165d, ", customAmount=");
            sb2.append(this.f44166e);
            sb2.append(", customLabel=");
            sb2.append(this.f44167f);
            sb2.append(", billingDetailsCollectionConfiguration=");
            sb2.append(this.f44168g);
            sb2.append(", cardBrandFilter=");
            sb2.append(this.f44169h);
            sb2.append(", cardFundingFilter=");
            sb2.append(this.f44170i);
            sb2.append(", additionalEnabledNetworks=");
            sb2.append(this.f44171j);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            q0 q0Var = this.f44162a;
            if (q0Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(q0Var.name());
            }
            dest.writeString(this.f44163b);
            dest.writeString(this.f44164c);
            dest.writeString(this.f44165d);
            Long l9 = this.f44166e;
            if (l9 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeLong(l9.longValue());
            }
            dest.writeString(this.f44167f);
            this.f44168g.writeToParcel(dest, i5);
            dest.writeParcelable(this.f44169h, i5);
            dest.writeParcelable(this.f44170i, i5);
            dest.writeStringList(this.f44171j);
        }
    }

    public GooglePayConfirmationOption(Config config) {
        Intrinsics.g(config, "config");
        this.f44161a = config;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof GooglePayConfirmationOption) && Intrinsics.b(this.f44161a, ((GooglePayConfirmationOption) obj).f44161a);
    }

    public final int hashCode() {
        return this.f44161a.hashCode();
    }

    public final String toString() {
        return "GooglePayConfirmationOption(config=" + this.f44161a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44161a.writeToParcel(dest, i5);
    }
}
