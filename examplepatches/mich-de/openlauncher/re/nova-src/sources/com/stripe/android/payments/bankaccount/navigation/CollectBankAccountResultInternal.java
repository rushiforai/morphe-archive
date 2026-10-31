package com.stripe.android.payments.bankaccount.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal;", "Landroid/os/Parcelable;", "Completed", "Failed", "Cancelled", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Cancelled;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Completed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class CollectBankAccountResultInternal implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Cancelled;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Cancelled extends CollectBankAccountResultInternal {

        /* renamed from: a, reason: collision with root package name */
        public static final Cancelled f44302a = new Cancelled();

        @NotNull
        public static final Parcelable.Creator<Cancelled> CREATOR = new l();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Cancelled);
        }

        public final int hashCode() {
            return -338128877;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Completed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends CollectBankAccountResultInternal {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new m();

        /* renamed from: a, reason: collision with root package name */
        public final CollectBankAccountResponseInternal f44303a;

        public Completed(CollectBankAccountResponseInternal response) {
            Intrinsics.g(response, "response");
            this.f44303a = response;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Completed) && Intrinsics.b(this.f44303a, ((Completed) obj).f44303a);
        }

        public final int hashCode() {
            return this.f44303a.hashCode();
        }

        public final String toString() {
            return "Completed(response=" + this.f44303a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f44303a.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal$Failed;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends CollectBankAccountResultInternal {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new n();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44304a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f44304a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f44304a, ((Failed) obj).f44304a);
        }

        public final int hashCode() {
            return this.f44304a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f44304a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44304a);
        }
    }
}
