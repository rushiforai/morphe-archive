package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.model.ConsumerShippingAddress;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/stripe/android/link/LinkActivityResult;", "Landroid/os/Parcelable;", "Completed", "PaymentMethodObtained", "Canceled", "Failed", "Lcom/stripe/android/link/LinkActivityResult$Canceled;", "Lcom/stripe/android/link/LinkActivityResult$Completed;", "Lcom/stripe/android/link/LinkActivityResult$Failed;", "Lcom/stripe/android/link/LinkActivityResult$PaymentMethodObtained;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class LinkActivityResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkActivityResult$Failed;", "Lcom/stripe/android/link/LinkActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends LinkActivityResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new i();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42879a;

        /* renamed from: b, reason: collision with root package name */
        public final LinkAccountUpdate f42880b;

        public Failed(Throwable error, LinkAccountUpdate linkAccountUpdate) {
            Intrinsics.g(error, "error");
            Intrinsics.g(linkAccountUpdate, "linkAccountUpdate");
            this.f42879a = error;
            this.f42880b = linkAccountUpdate;
        }

        @Override // com.stripe.android.link.LinkActivityResult
        /* renamed from: b, reason: from getter */
        public final LinkAccountUpdate getF42880b() {
            return this.f42880b;
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
            return Intrinsics.b(this.f42879a, failed.f42879a) && Intrinsics.b(this.f42880b, failed.f42880b);
        }

        public final int hashCode() {
            return this.f42880b.hashCode() + (this.f42879a.hashCode() * 31);
        }

        public final String toString() {
            return "Failed(error=" + this.f42879a + ", linkAccountUpdate=" + this.f42880b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42879a);
            dest.writeParcelable(this.f42880b, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkActivityResult$PaymentMethodObtained;", "Lcom/stripe/android/link/LinkActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentMethodObtained extends LinkActivityResult {

        @NotNull
        public static final Parcelable.Creator<PaymentMethodObtained> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod f42881a;

        public PaymentMethodObtained(PaymentMethod paymentMethod) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f42881a = paymentMethod;
        }

        @Override // com.stripe.android.link.LinkActivityResult
        /* renamed from: b */
        public final LinkAccountUpdate getF42880b() {
            return null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof PaymentMethodObtained) && Intrinsics.b(this.f42881a, ((PaymentMethodObtained) obj).f42881a);
        }

        public final int hashCode() {
            return this.f42881a.hashCode();
        }

        public final String toString() {
            return "PaymentMethodObtained(paymentMethod=" + this.f42881a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42881a, i5);
        }
    }

    /* renamed from: b */
    public abstract LinkAccountUpdate getF42880b();

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/link/LinkActivityResult$Canceled;", "Lcom/stripe/android/link/LinkActivityResult;", "com/stripe/android/link/g", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends LinkActivityResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final g f42873a;

        /* renamed from: b, reason: collision with root package name */
        public final LinkAccountUpdate f42874b;

        public Canceled(g reason, LinkAccountUpdate linkAccountUpdate) {
            Intrinsics.g(reason, "reason");
            Intrinsics.g(linkAccountUpdate, "linkAccountUpdate");
            this.f42873a = reason;
            this.f42874b = linkAccountUpdate;
        }

        @Override // com.stripe.android.link.LinkActivityResult
        /* renamed from: b, reason: from getter */
        public final LinkAccountUpdate getF42880b() {
            return this.f42874b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Canceled)) {
                return false;
            }
            Canceled canceled = (Canceled) obj;
            return this.f42873a == canceled.f42873a && Intrinsics.b(this.f42874b, canceled.f42874b);
        }

        public final int hashCode() {
            return this.f42874b.hashCode() + (this.f42873a.hashCode() * 31);
        }

        public final String toString() {
            return "Canceled(reason=" + this.f42873a + ", linkAccountUpdate=" + this.f42874b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42873a.name());
            dest.writeParcelable(this.f42874b, i5);
        }

        public /* synthetic */ Canceled(LinkAccountUpdate linkAccountUpdate) {
            this(g.f42980a, linkAccountUpdate);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkActivityResult$Completed;", "Lcom/stripe/android/link/LinkActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends LinkActivityResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new h();

        /* renamed from: a, reason: collision with root package name */
        public final LinkAccountUpdate f42875a;

        /* renamed from: b, reason: collision with root package name */
        public final LinkPaymentMethod f42876b;

        /* renamed from: c, reason: collision with root package name */
        public final ConsumerShippingAddress f42877c;

        /* renamed from: d, reason: collision with root package name */
        public final Boolean f42878d;

        public Completed(LinkAccountUpdate linkAccountUpdate, LinkPaymentMethod linkPaymentMethod, ConsumerShippingAddress consumerShippingAddress, Boolean bool) {
            Intrinsics.g(linkAccountUpdate, "linkAccountUpdate");
            this.f42875a = linkAccountUpdate;
            this.f42876b = linkPaymentMethod;
            this.f42877c = consumerShippingAddress;
            this.f42878d = bool;
        }

        @Override // com.stripe.android.link.LinkActivityResult
        /* renamed from: b, reason: from getter */
        public final LinkAccountUpdate getF42880b() {
            return this.f42875a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Completed)) {
                return false;
            }
            Completed completed = (Completed) obj;
            return Intrinsics.b(this.f42875a, completed.f42875a) && Intrinsics.b(this.f42876b, completed.f42876b) && Intrinsics.b(this.f42877c, completed.f42877c) && Intrinsics.b(this.f42878d, completed.f42878d);
        }

        public final int hashCode() {
            int iHashCode = this.f42875a.hashCode() * 31;
            LinkPaymentMethod linkPaymentMethod = this.f42876b;
            int iHashCode2 = (iHashCode + (linkPaymentMethod == null ? 0 : linkPaymentMethod.hashCode())) * 31;
            ConsumerShippingAddress consumerShippingAddress = this.f42877c;
            int iHashCode3 = (iHashCode2 + (consumerShippingAddress == null ? 0 : consumerShippingAddress.hashCode())) * 31;
            Boolean bool = this.f42878d;
            return iHashCode3 + (bool != null ? bool.hashCode() : 0);
        }

        public final String toString() {
            return "Completed(linkAccountUpdate=" + this.f42875a + ", selectedPayment=" + this.f42876b + ", shippingAddress=" + this.f42877c + ", authorizationConsentGranted=" + this.f42878d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42875a, i5);
            dest.writeParcelable(this.f42876b, i5);
            dest.writeParcelable(this.f42877c, i5);
            Boolean bool = this.f42878d;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                k2.w(dest, 1, bool);
            }
        }

        public /* synthetic */ Completed(LinkAccountUpdate linkAccountUpdate, LinkPaymentMethod linkPaymentMethod, ConsumerShippingAddress consumerShippingAddress, Boolean bool, int i5) {
            this(linkAccountUpdate, (i5 & 2) != 0 ? null : linkPaymentMethod, (i5 & 4) != 0 ? null : consumerShippingAddress, (i5 & 8) != 0 ? null : bool);
        }
    }
}
