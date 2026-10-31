package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0005\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode;", "Landroid/os/Parcelable;", "PaymentMethodSelection", "Full", "Confirmation", "Authentication", "Authorization", "Lcom/stripe/android/link/LinkLaunchMode$Authentication;", "Lcom/stripe/android/link/LinkLaunchMode$Authorization;", "Lcom/stripe/android/link/LinkLaunchMode$Confirmation;", "Lcom/stripe/android/link/LinkLaunchMode$Full;", "Lcom/stripe/android/link/LinkLaunchMode$PaymentMethodSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface LinkLaunchMode extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode$Authentication;", "Lcom/stripe/android/link/LinkLaunchMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Authentication implements LinkLaunchMode {

        @NotNull
        public static final Parcelable.Creator<Authentication> CREATOR = new t();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f42927a;

        public Authentication(boolean z11) {
            this.f42927a = z11;
        }

        @Override // com.stripe.android.link.LinkLaunchMode
        public final ConsumerPaymentDetails.PaymentDetails B0() {
            return w.a(this);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Authentication) && this.f42927a == ((Authentication) obj).f42927a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f42927a);
        }

        public final String toString() {
            return a80.m.i("Authentication(existingOnly=", ")", this.f42927a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f42927a ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode$Authorization;", "Lcom/stripe/android/link/LinkLaunchMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Authorization implements LinkLaunchMode {

        @NotNull
        public static final Parcelable.Creator<Authorization> CREATOR = new u();

        /* renamed from: a, reason: collision with root package name */
        public final String f42928a;

        public Authorization(String linkAuthIntentId) {
            Intrinsics.g(linkAuthIntentId, "linkAuthIntentId");
            this.f42928a = linkAuthIntentId;
        }

        @Override // com.stripe.android.link.LinkLaunchMode
        public final ConsumerPaymentDetails.PaymentDetails B0() {
            return w.a(this);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Authorization) && Intrinsics.b(this.f42928a, ((Authorization) obj).f42928a);
        }

        public final int hashCode() {
            return this.f42928a.hashCode();
        }

        public final String toString() {
            return b.c0.l("Authorization(linkAuthIntentId=", this.f42928a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42928a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode$Confirmation;", "Lcom/stripe/android/link/LinkLaunchMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Confirmation implements LinkLaunchMode {

        @NotNull
        public static final Parcelable.Creator<Confirmation> CREATOR = new v();

        /* renamed from: a, reason: collision with root package name */
        public final LinkPaymentMethod f42929a;

        public Confirmation(LinkPaymentMethod selectedPayment) {
            Intrinsics.g(selectedPayment, "selectedPayment");
            this.f42929a = selectedPayment;
        }

        @Override // com.stripe.android.link.LinkLaunchMode
        public final ConsumerPaymentDetails.PaymentDetails B0() {
            return w.a(this);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Confirmation) && Intrinsics.b(this.f42929a, ((Confirmation) obj).f42929a);
        }

        public final int hashCode() {
            return this.f42929a.hashCode();
        }

        public final String toString() {
            return "Confirmation(selectedPayment=" + this.f42929a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42929a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode$Full;", "Lcom/stripe/android/link/LinkLaunchMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Full implements LinkLaunchMode {

        /* renamed from: a, reason: collision with root package name */
        public static final Full f42930a = new Full();

        @NotNull
        public static final Parcelable.Creator<Full> CREATOR = new x();

        @Override // com.stripe.android.link.LinkLaunchMode
        public final ConsumerPaymentDetails.PaymentDetails B0() {
            return w.a(this);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Full);
        }

        public final int hashCode() {
            return 115601132;
        }

        public final String toString() {
            return "Full";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkLaunchMode$PaymentMethodSelection;", "Lcom/stripe/android/link/LinkLaunchMode;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentMethodSelection implements LinkLaunchMode {

        @NotNull
        public static final Parcelable.Creator<PaymentMethodSelection> CREATOR = new y();

        /* renamed from: a, reason: collision with root package name */
        public final ConsumerPaymentDetails.PaymentDetails f42931a;

        /* renamed from: b, reason: collision with root package name */
        public final es.q f42932b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f42933c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f42934d;

        public PaymentMethodSelection(ConsumerPaymentDetails.PaymentDetails paymentDetails, es.q qVar, boolean z11, boolean z12) {
            this.f42931a = paymentDetails;
            this.f42932b = qVar;
            this.f42933c = z11;
            this.f42934d = z12;
        }

        @Override // com.stripe.android.link.LinkLaunchMode
        public final ConsumerPaymentDetails.PaymentDetails B0() {
            return w.a(this);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PaymentMethodSelection)) {
                return false;
            }
            PaymentMethodSelection paymentMethodSelection = (PaymentMethodSelection) obj;
            return Intrinsics.b(this.f42931a, paymentMethodSelection.f42931a) && this.f42932b == paymentMethodSelection.f42932b && this.f42933c == paymentMethodSelection.f42933c && this.f42934d == paymentMethodSelection.f42934d;
        }

        public final int hashCode() {
            ConsumerPaymentDetails.PaymentDetails paymentDetails = this.f42931a;
            int iHashCode = (paymentDetails == null ? 0 : paymentDetails.hashCode()) * 31;
            es.q qVar = this.f42932b;
            return Boolean.hashCode(this.f42934d) + c9.f((iHashCode + (qVar != null ? qVar.hashCode() : 0)) * 31, 31, this.f42933c);
        }

        public final String toString() {
            return "PaymentMethodSelection(selectedPayment=" + this.f42931a + ", paymentMethodFilter=" + this.f42932b + ", sharePaymentDetailsImmediatelyAfterCreation=" + this.f42933c + ", shouldShowSecondaryCta=" + this.f42934d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42931a, i5);
            es.q qVar = this.f42932b;
            if (qVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(qVar.name());
            }
            dest.writeInt(this.f42933c ? 1 : 0);
            dest.writeInt(this.f42934d ? 1 : 0);
        }
    }

    ConsumerPaymentDetails.PaymentDetails B0();
}
