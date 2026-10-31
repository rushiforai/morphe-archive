package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/paymentsheet/PaymentSheetResult$Canceled;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult$Completed;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult$Failed;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentSheetResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetResult$Canceled;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Canceled extends PaymentSheetResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new s0();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f44669a;

        public Canceled(boolean z11) {
            this.f44669a = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Canceled) && this.f44669a == ((Canceled) obj).f44669a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f44669a);
        }

        public final String toString() {
            return a80.m.i("Canceled(irrelevantValueForGeneratedCode=", ")", this.f44669a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f44669a ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetResult$Completed;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Completed extends PaymentSheetResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new t0();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f44670a;

        public Completed(boolean z11) {
            this.f44670a = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Completed) && this.f44670a == ((Completed) obj).f44670a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f44670a);
        }

        public final String toString() {
            return a80.m.i("Completed(irrelevantValueForGeneratedCode=", ")", this.f44670a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f44670a ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetResult$Failed;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends PaymentSheetResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new u0();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44671a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f44671a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f44671a, ((Failed) obj).f44671a);
        }

        public final int hashCode() {
            return this.f44671a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f44671a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44671a);
        }
    }
}
