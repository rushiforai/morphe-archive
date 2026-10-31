package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult;", "Landroid/os/Parcelable;", "Completed", "Failed", "Cancelled", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Cancelled;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Completed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface CollectBankAccountForInstantDebitsResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Cancelled;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Cancelled implements CollectBankAccountForInstantDebitsResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Cancelled f44287a = new Cancelled();

        @NotNull
        public static final Parcelable.Creator<Cancelled> CREATOR = new f();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Cancelled);
        }

        public final int hashCode() {
            return 1430639253;
        }

        public final String toString() {
            return "Cancelled";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Completed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed implements CollectBankAccountForInstantDebitsResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new g();

        /* renamed from: a, reason: collision with root package name */
        public final StripeIntent f44288a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethod f44289b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44290c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44291d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f44292e;

        public Completed(StripeIntent stripeIntent, PaymentMethod paymentMethod, String str, String str2, boolean z11) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f44288a = stripeIntent;
            this.f44289b = paymentMethod;
            this.f44290c = str;
            this.f44291d = str2;
            this.f44292e = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Completed)) {
                return false;
            }
            Completed completed = (Completed) obj;
            return Intrinsics.b(this.f44288a, completed.f44288a) && Intrinsics.b(this.f44289b, completed.f44289b) && Intrinsics.b(this.f44290c, completed.f44290c) && Intrinsics.b(this.f44291d, completed.f44291d) && this.f44292e == completed.f44292e;
        }

        public final int hashCode() {
            StripeIntent stripeIntent = this.f44288a;
            int iHashCode = (this.f44289b.hashCode() + ((stripeIntent == null ? 0 : stripeIntent.hashCode()) * 31)) * 31;
            String str = this.f44290c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44291d;
            return Boolean.hashCode(this.f44292e) + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Completed(intent=");
            sb2.append(this.f44288a);
            sb2.append(", paymentMethod=");
            sb2.append(this.f44289b);
            sb2.append(", last4=");
            c0.D(sb2, this.f44290c, ", bankName=", this.f44291d, ", eligibleForIncentive=");
            return a80.m.k(sb2, this.f44292e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44288a, i5);
            this.f44289b.writeToParcel(dest, i5);
            dest.writeString(this.f44290c);
            dest.writeString(this.f44291d);
            dest.writeInt(this.f44292e ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult$Failed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountForInstantDebitsResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements CollectBankAccountForInstantDebitsResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new h();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44293a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f44293a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f44293a, ((Failed) obj).f44293a);
        }

        public final int hashCode() {
            return this.f44293a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f44293a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44293a);
        }
    }
}
