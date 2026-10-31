package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/LinkPaymentMethod;", "Landroid/os/Parcelable;", "ConsumerPaymentDetails", "LinkPaymentDetails", "Lcom/stripe/android/link/LinkPaymentMethod$ConsumerPaymentDetails;", "Lcom/stripe/android/link/LinkPaymentMethod$LinkPaymentDetails;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class LinkPaymentMethod implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final ConsumerPaymentDetails.PaymentDetails f42941a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkPaymentMethod$ConsumerPaymentDetails;", "Lcom/stripe/android/link/LinkPaymentMethod;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ConsumerPaymentDetails extends LinkPaymentMethod {

        @NotNull
        public static final Parcelable.Creator<ConsumerPaymentDetails> CREATOR = new c0();

        /* renamed from: b, reason: collision with root package name */
        public final ConsumerPaymentDetails.PaymentDetails f42942b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42943c;

        /* renamed from: d, reason: collision with root package name */
        public final String f42944d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ConsumerPaymentDetails(ConsumerPaymentDetails.PaymentDetails details, String str, String str2) {
            super(details);
            Intrinsics.g(details, "details");
            this.f42942b = details;
            this.f42943c = str;
            this.f42944d = str2;
        }

        public static ConsumerPaymentDetails e(ConsumerPaymentDetails consumerPaymentDetails, ConsumerPaymentDetails.PaymentDetails details, String str, int i5) {
            if ((i5 & 1) != 0) {
                details = consumerPaymentDetails.f42942b;
            }
            String str2 = consumerPaymentDetails.f42943c;
            if ((i5 & 4) != 0) {
                str = consumerPaymentDetails.f42944d;
            }
            Intrinsics.g(details, "details");
            return new ConsumerPaymentDetails(details, str2, str);
        }

        @Override // com.stripe.android.link.LinkPaymentMethod
        /* renamed from: b, reason: from getter */
        public final String getF42946c() {
            return this.f42943c;
        }

        @Override // com.stripe.android.link.LinkPaymentMethod
        /* renamed from: d, reason: from getter */
        public final ConsumerPaymentDetails.PaymentDetails getF42941a() {
            return this.f42942b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ConsumerPaymentDetails)) {
                return false;
            }
            ConsumerPaymentDetails consumerPaymentDetails = (ConsumerPaymentDetails) obj;
            return Intrinsics.b(this.f42942b, consumerPaymentDetails.f42942b) && Intrinsics.b(this.f42943c, consumerPaymentDetails.f42943c) && Intrinsics.b(this.f42944d, consumerPaymentDetails.f42944d);
        }

        public final int hashCode() {
            int iHashCode = this.f42942b.hashCode() * 31;
            String str = this.f42943c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f42944d;
            return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ConsumerPaymentDetails(details=");
            sb2.append(this.f42942b);
            sb2.append(", collectedCvc=");
            sb2.append(this.f42943c);
            sb2.append(", billingPhone=");
            return b.c0.q(sb2, this.f42944d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42942b, i5);
            dest.writeString(this.f42943c);
            dest.writeString(this.f42944d);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkPaymentMethod$LinkPaymentDetails;", "Lcom/stripe/android/link/LinkPaymentMethod;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class LinkPaymentDetails extends LinkPaymentMethod {

        @NotNull
        public static final Parcelable.Creator<LinkPaymentDetails> CREATOR = new d0();

        /* renamed from: b, reason: collision with root package name */
        public final com.stripe.android.link.LinkPaymentDetails f42945b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42946c;

        /* renamed from: d, reason: collision with root package name */
        public final String f42947d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public LinkPaymentDetails(com.stripe.android.link.LinkPaymentDetails linkPaymentDetails, String str, String str2) {
            super(linkPaymentDetails.getF42935a());
            Intrinsics.g(linkPaymentDetails, "linkPaymentDetails");
            this.f42945b = linkPaymentDetails;
            this.f42946c = str;
            this.f42947d = str2;
        }

        @Override // com.stripe.android.link.LinkPaymentMethod
        /* renamed from: b, reason: from getter */
        public final String getF42946c() {
            return this.f42946c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof LinkPaymentDetails)) {
                return false;
            }
            LinkPaymentDetails linkPaymentDetails = (LinkPaymentDetails) obj;
            return Intrinsics.b(this.f42945b, linkPaymentDetails.f42945b) && Intrinsics.b(this.f42946c, linkPaymentDetails.f42946c) && Intrinsics.b(this.f42947d, linkPaymentDetails.f42947d);
        }

        public final int hashCode() {
            int iHashCode = this.f42945b.hashCode() * 31;
            String str = this.f42946c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f42947d;
            return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("LinkPaymentDetails(linkPaymentDetails=");
            sb2.append(this.f42945b);
            sb2.append(", collectedCvc=");
            sb2.append(this.f42946c);
            sb2.append(", billingPhone=");
            return b.c0.q(sb2, this.f42947d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42945b, i5);
            dest.writeString(this.f42946c);
            dest.writeString(this.f42947d);
        }
    }

    public LinkPaymentMethod(ConsumerPaymentDetails.PaymentDetails paymentDetails) {
        this.f42941a = paymentDetails;
    }

    /* renamed from: b */
    public abstract String getF42946c();

    /* renamed from: d, reason: from getter */
    public ConsumerPaymentDetails.PaymentDetails getF42941a() {
        return this.f42941a;
    }
}
