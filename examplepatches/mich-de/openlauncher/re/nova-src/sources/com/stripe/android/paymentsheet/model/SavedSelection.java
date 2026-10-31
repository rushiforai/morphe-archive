package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/stripe/android/paymentsheet/model/SavedSelection;", "Landroid/os/Parcelable;", "GooglePay", "Link", "PaymentMethod", "None", "Lcom/stripe/android/paymentsheet/model/SavedSelection$GooglePay;", "Lcom/stripe/android/paymentsheet/model/SavedSelection$Link;", "Lcom/stripe/android/paymentsheet/model/SavedSelection$None;", "Lcom/stripe/android/paymentsheet/model/SavedSelection$PaymentMethod;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class SavedSelection implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/SavedSelection$GooglePay;", "Lcom/stripe/android/paymentsheet/model/SavedSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class GooglePay extends SavedSelection {

        /* renamed from: a, reason: collision with root package name */
        public static final GooglePay f44850a = new GooglePay();

        @NotNull
        public static final Parcelable.Creator<GooglePay> CREATOR = new p();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof GooglePay);
        }

        public final int hashCode() {
            return 763345101;
        }

        public final String toString() {
            return "GooglePay";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/SavedSelection$Link;", "Lcom/stripe/android/paymentsheet/model/SavedSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Link extends SavedSelection {

        /* renamed from: a, reason: collision with root package name */
        public static final Link f44851a = new Link();

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new q();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Link);
        }

        public final int hashCode() {
            return -1587232740;
        }

        public final String toString() {
            return "Link";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/SavedSelection$None;", "Lcom/stripe/android/paymentsheet/model/SavedSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class None extends SavedSelection {

        /* renamed from: a, reason: collision with root package name */
        public static final None f44852a = new None();

        @NotNull
        public static final Parcelable.Creator<None> CREATOR = new r();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof None);
        }

        public final int hashCode() {
            return -1587167398;
        }

        public final String toString() {
            return "None";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/SavedSelection$PaymentMethod;", "Lcom/stripe/android/paymentsheet/model/SavedSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentMethod extends SavedSelection {

        @NotNull
        public static final Parcelable.Creator<PaymentMethod> CREATOR = new s();

        /* renamed from: a, reason: collision with root package name */
        public final String f44853a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f44854b;

        public PaymentMethod(String id2, boolean z11) {
            Intrinsics.g(id2, "id");
            this.f44853a = id2;
            this.f44854b = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PaymentMethod)) {
                return false;
            }
            PaymentMethod paymentMethod = (PaymentMethod) obj;
            return Intrinsics.b(this.f44853a, paymentMethod.f44853a) && this.f44854b == paymentMethod.f44854b;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f44854b) + (this.f44853a.hashCode() * 31);
        }

        public final String toString() {
            return "PaymentMethod(id=" + this.f44853a + ", isLinkOrigin=" + this.f44854b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44853a);
            dest.writeInt(this.f44854b ? 1 : 0);
        }
    }
}
