package com.stripe.android.paymentelement.confirmation.cpms;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult;", "Landroid/os/Parcelable;", "Completed", "Failed", "Canceled", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Canceled;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Completed;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Failed;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class InternalCustomPaymentMethodResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Canceled;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends InternalCustomPaymentMethodResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f44153a = new Canceled();

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
            return 52141336;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Completed;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends InternalCustomPaymentMethodResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Completed f44154a = new Completed();

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
            return -263131732;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult$Failed;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends InternalCustomPaymentMethodResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f44155a;

        public Failed(Throwable throwable) {
            Intrinsics.g(throwable, "throwable");
            this.f44155a = throwable;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44155a);
        }
    }
}
