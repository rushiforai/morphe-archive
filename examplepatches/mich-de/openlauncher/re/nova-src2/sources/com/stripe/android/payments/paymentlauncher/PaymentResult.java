package com.stripe.android.payments.paymentlauncher;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentResult;", "Landroid/os/Parcelable;", "Completed", "Failed", "Canceled", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Canceled;", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Completed;", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Canceled;", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends PaymentResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f44389a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new o();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -953289798;
        }

        public final String toString() {
            return "Canceled";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Completed;", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends PaymentResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Completed f44390a = new Completed();

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new p();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Completed);
        }

        public final int hashCode() {
            return -1366725814;
        }

        public final String toString() {
            return "Completed";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/PaymentResult$Failed;", "Lcom/stripe/android/payments/paymentlauncher/PaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends PaymentResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new q();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44391a;

        public Failed(Throwable throwable) {
            Intrinsics.g(throwable, "throwable");
            this.f44391a = throwable;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44391a);
        }
    }
}
