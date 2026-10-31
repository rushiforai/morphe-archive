package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState;", "Landroid/os/Parcelable;", "LinkedBankAccount", "zu/a", "ResultIdentifier", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BankFormScreenState implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<BankFormScreenState> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f44861a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44862b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f44863c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedBankAccount f44864d;

    /* renamed from: e, reason: collision with root package name */
    public final ResolvableString f44865e;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$LinkedBankAccount;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class LinkedBankAccount implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<LinkedBankAccount> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final ResultIdentifier f44866a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44867b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44868c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44869d;

        /* renamed from: e, reason: collision with root package name */
        public final String f44870e;

        /* renamed from: f, reason: collision with root package name */
        public final ResolvableString f44871f;

        /* renamed from: g, reason: collision with root package name */
        public final boolean f44872g;

        /* renamed from: h, reason: collision with root package name */
        public final boolean f44873h;

        public LinkedBankAccount(ResultIdentifier resultIdentifier, String str, String str2, String str3, String str4, ResolvableString resolvableString, boolean z11, boolean z12) {
            Intrinsics.g(resultIdentifier, "resultIdentifier");
            this.f44866a = resultIdentifier;
            this.f44867b = str;
            this.f44868c = str2;
            this.f44869d = str3;
            this.f44870e = str4;
            this.f44871f = resolvableString;
            this.f44872g = z11;
            this.f44873h = z12;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof LinkedBankAccount)) {
                return false;
            }
            LinkedBankAccount linkedBankAccount = (LinkedBankAccount) obj;
            return Intrinsics.b(this.f44866a, linkedBankAccount.f44866a) && Intrinsics.b(this.f44867b, linkedBankAccount.f44867b) && Intrinsics.b(this.f44868c, linkedBankAccount.f44868c) && Intrinsics.b(this.f44869d, linkedBankAccount.f44869d) && Intrinsics.b(this.f44870e, linkedBankAccount.f44870e) && Intrinsics.b(this.f44871f, linkedBankAccount.f44871f) && this.f44872g == linkedBankAccount.f44872g && this.f44873h == linkedBankAccount.f44873h;
        }

        public final int hashCode() {
            int iHashCode = this.f44866a.hashCode() * 31;
            String str = this.f44867b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44868c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f44869d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f44870e;
            int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
            ResolvableString resolvableString = this.f44871f;
            return Boolean.hashCode(this.f44873h) + c9.f((iHashCode5 + (resolvableString != null ? resolvableString.hashCode() : 0)) * 31, 31, this.f44872g);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("LinkedBankAccount(resultIdentifier=");
            sb2.append(this.f44866a);
            sb2.append(", bankName=");
            sb2.append(this.f44867b);
            sb2.append(", last4=");
            c0.D(sb2, this.f44868c, ", intentId=", this.f44869d, ", financialConnectionsSessionId=");
            sb2.append(this.f44870e);
            sb2.append(", mandateText=");
            sb2.append(this.f44871f);
            sb2.append(", isVerifyingWithMicrodeposits=");
            sb2.append(this.f44872g);
            sb2.append(", eligibleForIncentive=");
            sb2.append(this.f44873h);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44866a, i5);
            dest.writeString(this.f44867b);
            dest.writeString(this.f44868c);
            dest.writeString(this.f44869d);
            dest.writeString(this.f44870e);
            dest.writeParcelable(this.f44871f, i5);
            dest.writeInt(this.f44872g ? 1 : 0);
            dest.writeInt(this.f44873h ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier;", "Landroid/os/Parcelable;", "Session", "PaymentMethod", "Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier$PaymentMethod;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier$Session;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface ResultIdentifier extends Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier$PaymentMethod;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class PaymentMethod implements ResultIdentifier {

            @NotNull
            public static final Parcelable.Creator<PaymentMethod> CREATOR = new c();

            /* renamed from: a, reason: collision with root package name */
            public final com.stripe.android.model.PaymentMethod f44874a;

            public PaymentMethod(com.stripe.android.model.PaymentMethod paymentMethod) {
                Intrinsics.g(paymentMethod, "paymentMethod");
                this.f44874a = paymentMethod;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof PaymentMethod) && Intrinsics.b(this.f44874a, ((PaymentMethod) obj).f44874a);
            }

            public final int hashCode() {
                return this.f44874a.hashCode();
            }

            public final String toString() {
                return "PaymentMethod(paymentMethod=" + this.f44874a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeParcelable(this.f44874a, i5);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier$Session;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/ach/BankFormScreenState$ResultIdentifier;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Session implements ResultIdentifier {

            @NotNull
            public static final Parcelable.Creator<Session> CREATOR = new d();

            /* renamed from: a, reason: collision with root package name */
            public final String f44875a;

            public Session(String id2) {
                Intrinsics.g(id2, "id");
                this.f44875a = id2;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof Session) && Intrinsics.b(this.f44875a, ((Session) obj).f44875a);
            }

            public final int hashCode() {
                return this.f44875a.hashCode();
            }

            public final String toString() {
                return c0.l("Session(id=", this.f44875a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44875a);
            }
        }
    }

    public BankFormScreenState(boolean z11, String str, boolean z12, LinkedBankAccount linkedBankAccount, ResolvableString resolvableString) {
        this.f44861a = z11;
        this.f44862b = str;
        this.f44863c = z12;
        this.f44864d = linkedBankAccount;
        this.f44865e = resolvableString;
    }

    public static BankFormScreenState a(BankFormScreenState bankFormScreenState, boolean z11, LinkedBankAccount linkedBankAccount, int i5) {
        boolean z12 = bankFormScreenState.f44861a;
        String str = bankFormScreenState.f44862b;
        if ((i5 & 4) != 0) {
            z11 = bankFormScreenState.f44863c;
        }
        boolean z13 = z11;
        if ((i5 & 8) != 0) {
            linkedBankAccount = bankFormScreenState.f44864d;
        }
        LinkedBankAccount linkedBankAccount2 = linkedBankAccount;
        ResolvableString resolvableString = (i5 & 16) != 0 ? bankFormScreenState.f44865e : null;
        bankFormScreenState.getClass();
        return new BankFormScreenState(z12, str, z13, linkedBankAccount2, resolvableString);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BankFormScreenState)) {
            return false;
        }
        BankFormScreenState bankFormScreenState = (BankFormScreenState) obj;
        return this.f44861a == bankFormScreenState.f44861a && Intrinsics.b(this.f44862b, bankFormScreenState.f44862b) && this.f44863c == bankFormScreenState.f44863c && Intrinsics.b(this.f44864d, bankFormScreenState.f44864d) && Intrinsics.b(this.f44865e, bankFormScreenState.f44865e);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f44861a) * 31;
        String str = this.f44862b;
        int iF = c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44863c);
        LinkedBankAccount linkedBankAccount = this.f44864d;
        int iHashCode2 = (iF + (linkedBankAccount == null ? 0 : linkedBankAccount.hashCode())) * 31;
        ResolvableString resolvableString = this.f44865e;
        return iHashCode2 + (resolvableString != null ? resolvableString.hashCode() : 0);
    }

    public final String toString() {
        return "BankFormScreenState(isPaymentFlow=" + this.f44861a + ", promoText=" + this.f44862b + ", _isProcessing=" + this.f44863c + ", linkedBankAccount=" + this.f44864d + ", error=" + this.f44865e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f44861a ? 1 : 0);
        dest.writeString(this.f44862b);
        dest.writeInt(this.f44863c ? 1 : 0);
        LinkedBankAccount linkedBankAccount = this.f44864d;
        if (linkedBankAccount == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkedBankAccount.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f44865e, i5);
    }
}
