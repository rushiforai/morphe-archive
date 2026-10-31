package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResponseInternal;", "Lcom/stripe/android/core/model/StripeModel;", "USBankAccountData", "InstantDebitsData", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CollectBankAccountResponseInternal implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<CollectBankAccountResponseInternal> CREATOR = new i();

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f44294a;

    /* renamed from: b, reason: collision with root package name */
    public final USBankAccountData f44295b;

    /* renamed from: c, reason: collision with root package name */
    public final InstantDebitsData f44296c;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResponseInternal$InstantDebitsData;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class InstantDebitsData implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<InstantDebitsData> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod f44297a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44298b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44299c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f44300d;

        public InstantDebitsData(PaymentMethod paymentMethod, String str, String str2, boolean z11) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f44297a = paymentMethod;
            this.f44298b = str;
            this.f44299c = str2;
            this.f44300d = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof InstantDebitsData)) {
                return false;
            }
            InstantDebitsData instantDebitsData = (InstantDebitsData) obj;
            return Intrinsics.b(this.f44297a, instantDebitsData.f44297a) && Intrinsics.b(this.f44298b, instantDebitsData.f44298b) && Intrinsics.b(this.f44299c, instantDebitsData.f44299c) && this.f44300d == instantDebitsData.f44300d;
        }

        public final int hashCode() {
            int iHashCode = this.f44297a.hashCode() * 31;
            String str = this.f44298b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44299c;
            return Boolean.hashCode(this.f44300d) + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "InstantDebitsData(paymentMethod=" + this.f44297a + ", last4=" + this.f44298b + ", bankName=" + this.f44299c + ", eligibleForIncentive=" + this.f44300d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f44297a.writeToParcel(dest, i5);
            dest.writeString(this.f44298b);
            dest.writeString(this.f44299c);
            dest.writeInt(this.f44300d ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResponseInternal$USBankAccountData;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class USBankAccountData implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<USBankAccountData> CREATOR = new k();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSession f44301a;

        public USBankAccountData(FinancialConnectionsSession financialConnectionsSession) {
            Intrinsics.g(financialConnectionsSession, "financialConnectionsSession");
            this.f44301a = financialConnectionsSession;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof USBankAccountData) && Intrinsics.b(this.f44301a, ((USBankAccountData) obj).f44301a);
        }

        public final int hashCode() {
            return this.f44301a.hashCode();
        }

        public final String toString() {
            return "USBankAccountData(financialConnectionsSession=" + this.f44301a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44301a, i5);
        }
    }

    public CollectBankAccountResponseInternal(StripeIntent stripeIntent, USBankAccountData uSBankAccountData, InstantDebitsData instantDebitsData) {
        this.f44294a = stripeIntent;
        this.f44295b = uSBankAccountData;
        this.f44296c = instantDebitsData;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CollectBankAccountResponseInternal)) {
            return false;
        }
        CollectBankAccountResponseInternal collectBankAccountResponseInternal = (CollectBankAccountResponseInternal) obj;
        return Intrinsics.b(this.f44294a, collectBankAccountResponseInternal.f44294a) && Intrinsics.b(this.f44295b, collectBankAccountResponseInternal.f44295b) && Intrinsics.b(this.f44296c, collectBankAccountResponseInternal.f44296c);
    }

    public final int hashCode() {
        StripeIntent stripeIntent = this.f44294a;
        int iHashCode = (stripeIntent == null ? 0 : stripeIntent.hashCode()) * 31;
        USBankAccountData uSBankAccountData = this.f44295b;
        int iHashCode2 = (iHashCode + (uSBankAccountData == null ? 0 : uSBankAccountData.f44301a.hashCode())) * 31;
        InstantDebitsData instantDebitsData = this.f44296c;
        return iHashCode2 + (instantDebitsData != null ? instantDebitsData.hashCode() : 0);
    }

    public final String toString() {
        return "CollectBankAccountResponseInternal(intent=" + this.f44294a + ", usBankAccountData=" + this.f44295b + ", instantDebitsData=" + this.f44296c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44294a, i5);
        USBankAccountData uSBankAccountData = this.f44295b;
        if (uSBankAccountData == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            uSBankAccountData.writeToParcel(dest, i5);
        }
        InstantDebitsData instantDebitsData = this.f44296c;
        if (instantDebitsData == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            instantDebitsData.writeToParcel(dest, i5);
        }
    }
}
