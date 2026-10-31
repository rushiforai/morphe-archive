package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Canceled;", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Completed;", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Failed;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class ExternalPaymentMethodResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÁ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Canceled;", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends ExternalPaymentMethodResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f44426a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new b();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -1307955248;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÁ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Completed;", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends ExternalPaymentMethodResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Completed f44427a = new Completed();

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new c();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Completed);
        }

        public final int hashCode() {
            return 523547124;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult$Failed;", "Lcom/stripe/android/paymentsheet/ExternalPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends ExternalPaymentMethodResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final String f44428a;

        public Failed(String str) {
            this.f44428a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f44428a, ((Failed) obj).f44428a);
        }

        public final int hashCode() {
            String str = this.f44428a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return b.c0.l("Failed(displayMessage=", this.f44428a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44428a);
        }
    }
}
