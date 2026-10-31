package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result", "Landroid/os/Parcelable;", "Completed", "Failed", "Canceled", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Canceled;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Completed;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class GooglePayPaymentMethodLauncher$Result implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Canceled;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends GooglePayPaymentMethodLauncher$Result {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42802a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new k();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -299418266;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Completed;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Completed extends GooglePayPaymentMethodLauncher$Result {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new l();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod f42803a;

        public Completed(PaymentMethod paymentMethod) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f42803a = paymentMethod;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Completed) && Intrinsics.b(this.f42803a, ((Completed) obj).f42803a);
        }

        public final int hashCode() {
            return this.f42803a.hashCode();
        }

        public final String toString() {
            return "Completed(paymentMethod=" + this.f42803a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42803a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result$Failed;", "Lcom/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends GooglePayPaymentMethodLauncher$Result {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new m();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42804a;

        /* renamed from: b, reason: collision with root package name */
        public final int f42805b;

        public Failed(int i5, Throwable error) {
            Intrinsics.g(error, "error");
            this.f42804a = error;
            this.f42805b = i5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Failed)) {
                return false;
            }
            Failed failed = (Failed) obj;
            return Intrinsics.b(this.f42804a, failed.f42804a) && this.f42805b == failed.f42805b;
        }

        public final int hashCode() {
            return (this.f42804a.hashCode() * 31) + this.f42805b;
        }

        public final String toString() {
            return "Failed(error=" + this.f42804a + ", errorCode=" + this.f42805b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42804a);
            dest.writeInt(this.f42805b);
        }
    }
}
