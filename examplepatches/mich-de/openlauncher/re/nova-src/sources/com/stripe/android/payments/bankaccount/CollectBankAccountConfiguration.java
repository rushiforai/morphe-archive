package com.stripe.android.payments.bankaccount;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.financialconnections.ElementsSessionContext;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration;", "Landroid/os/Parcelable;", "USBankAccount", "USBankAccountInternal", "InstantDebits", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$InstantDebits;", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$USBankAccount;", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$USBankAccountInternal;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface CollectBankAccountConfiguration extends Parcelable {

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$InstantDebits;", "Landroid/os/Parcelable;", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class InstantDebits implements Parcelable, CollectBankAccountConfiguration {

        @NotNull
        public static final Parcelable.Creator<InstantDebits> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f44245a;

        /* renamed from: b, reason: collision with root package name */
        public final ElementsSessionContext f44246b;

        public InstantDebits(String str, ElementsSessionContext elementsSessionContext) {
            this.f44245a = str;
            this.f44246b = elementsSessionContext;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof InstantDebits)) {
                return false;
            }
            InstantDebits instantDebits = (InstantDebits) obj;
            return Intrinsics.b(this.f44245a, instantDebits.f44245a) && Intrinsics.b(this.f44246b, instantDebits.f44246b);
        }

        public final int hashCode() {
            String str = this.f44245a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            ElementsSessionContext elementsSessionContext = this.f44246b;
            return iHashCode + (elementsSessionContext != null ? elementsSessionContext.hashCode() : 0);
        }

        public final String toString() {
            return "InstantDebits(email=" + this.f44245a + ", elementsSessionContext=" + this.f44246b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44245a);
            dest.writeParcelable(this.f44246b, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$USBankAccount;", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class USBankAccount implements CollectBankAccountConfiguration {

        @NotNull
        public static final Parcelable.Creator<USBankAccount> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f44247a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44248b;

        public USBankAccount(String name, String str) {
            Intrinsics.g(name, "name");
            this.f44247a = name;
            this.f44248b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof USBankAccount)) {
                return false;
            }
            USBankAccount uSBankAccount = (USBankAccount) obj;
            return Intrinsics.b(this.f44247a, uSBankAccount.f44247a) && Intrinsics.b(this.f44248b, uSBankAccount.f44248b);
        }

        public final int hashCode() {
            int iHashCode = this.f44247a.hashCode() * 31;
            String str = this.f44248b;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return c0.n("USBankAccount(name=", this.f44247a, ", email=", this.f44248b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44247a);
            dest.writeString(this.f44248b);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration$USBankAccountInternal;", "Landroid/os/Parcelable;", "Lcom/stripe/android/payments/bankaccount/CollectBankAccountConfiguration;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class USBankAccountInternal implements Parcelable, CollectBankAccountConfiguration {

        @NotNull
        public static final Parcelable.Creator<USBankAccountInternal> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f44249a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44250b;

        /* renamed from: c, reason: collision with root package name */
        public final ElementsSessionContext f44251c;

        public USBankAccountInternal(String name, String str, ElementsSessionContext elementsSessionContext) {
            Intrinsics.g(name, "name");
            this.f44249a = name;
            this.f44250b = str;
            this.f44251c = elementsSessionContext;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof USBankAccountInternal)) {
                return false;
            }
            USBankAccountInternal uSBankAccountInternal = (USBankAccountInternal) obj;
            return Intrinsics.b(this.f44249a, uSBankAccountInternal.f44249a) && Intrinsics.b(this.f44250b, uSBankAccountInternal.f44250b) && Intrinsics.b(this.f44251c, uSBankAccountInternal.f44251c);
        }

        public final int hashCode() {
            int iHashCode = this.f44249a.hashCode() * 31;
            String str = this.f44250b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            ElementsSessionContext elementsSessionContext = this.f44251c;
            return iHashCode2 + (elementsSessionContext != null ? elementsSessionContext.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = c0.w("USBankAccountInternal(name=", this.f44249a, ", email=", this.f44250b, ", elementsSessionContext=");
            sbW.append(this.f44251c);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44249a);
            dest.writeString(this.f44250b);
            dest.writeParcelable(this.f44251c, i5);
        }
    }
}
