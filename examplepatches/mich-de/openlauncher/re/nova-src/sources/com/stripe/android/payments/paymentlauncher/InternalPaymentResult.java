package com.stripe.android.payments.paymentlauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult;", "Landroid/os/Parcelable;", "Completed", "Failed", "Canceled", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Canceled;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Completed;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class InternalPaymentResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Canceled;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Canceled extends InternalPaymentResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f44348a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new a();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Completed;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends InternalPaymentResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final StripeIntent f44349a;

        public Completed(StripeIntent intent) {
            Intrinsics.g(intent, "intent");
            this.f44349a = intent;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Completed) && Intrinsics.b(this.f44349a, ((Completed) obj).f44349a);
        }

        public final int hashCode() {
            return this.f44349a.hashCode();
        }

        public final String toString() {
            return "Completed(intent=" + this.f44349a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44349a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult$Failed;", "Lcom/stripe/android/payments/paymentlauncher/InternalPaymentResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends InternalPaymentResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44350a;

        public Failed(Throwable throwable) {
            Intrinsics.g(throwable, "throwable");
            this.f44350a = throwable;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44350a);
        }
    }
}
