package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\b\t\nJ\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\u0007\u0010\u0006\u0082\u0001\u0003\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior;", "Landroid/os/Parcelable;", "Lwu/c;", "customerRequestedSave", "Lcom/stripe/android/model/PaymentMethod$AllowRedisplay;", "allowRedisplayForSetupIntent", "(Lwu/c;)Lcom/stripe/android/model/PaymentMethod$AllowRedisplay;", "allowRedisplayForPaymentIntent", "Legacy", "Enabled", "Disabled", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Disabled;", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Enabled;", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Legacy;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface PaymentMethodSaveConsentBehavior extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Disabled;", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Disabled implements PaymentMethodSaveConsentBehavior {

        @NotNull
        public static final Parcelable.Creator<Disabled> CREATOR = new p();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod.AllowRedisplay f43116a;

        public Disabled(PaymentMethod.AllowRedisplay allowRedisplay) {
            this.f43116a = allowRedisplay;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior
        public final PaymentMethod.AllowRedisplay e0(boolean z11, wu.c cVar) {
            return o.a(this, z11, cVar);
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Disabled) && this.f43116a == ((Disabled) obj).f43116a;
        }

        public final int hashCode() {
            PaymentMethod.AllowRedisplay allowRedisplay = this.f43116a;
            if (allowRedisplay == null) {
                return 0;
            }
            return allowRedisplay.hashCode();
        }

        public final String toString() {
            return "Disabled(overrideAllowRedisplay=" + this.f43116a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f43116a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Enabled;", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Enabled implements PaymentMethodSaveConsentBehavior {

        /* renamed from: a, reason: collision with root package name */
        public static final Enabled f43117a = new Enabled();

        @NotNull
        public static final Parcelable.Creator<Enabled> CREATOR = new q();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior
        public final PaymentMethod.AllowRedisplay e0(boolean z11, wu.c cVar) {
            return o.a(this, z11, cVar);
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Enabled);
        }

        public final int hashCode() {
            return -1481436890;
        }

        public final String toString() {
            return "Enabled";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior$Legacy;", "Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentMethodSaveConsentBehavior;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Legacy implements PaymentMethodSaveConsentBehavior {

        /* renamed from: a, reason: collision with root package name */
        public static final Legacy f43118a = new Legacy();

        @NotNull
        public static final Parcelable.Creator<Legacy> CREATOR = new r();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior
        public final PaymentMethod.AllowRedisplay e0(boolean z11, wu.c cVar) {
            return o.a(this, z11, cVar);
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Legacy);
        }

        public final int hashCode() {
            return 144481604;
        }

        public final String toString() {
            return "Legacy";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    PaymentMethod.AllowRedisplay e0(boolean z11, wu.c cVar);
}
