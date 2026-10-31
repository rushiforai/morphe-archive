package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType", "Landroid/os/Parcelable;", "LegacyCustomerEphemeralKey", "CustomerSession", "Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType$CustomerSession;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType$LegacyCustomerEphemeralKey;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface PaymentSheet$CustomerAccessType extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType$CustomerSession;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CustomerSession implements PaymentSheet$CustomerAccessType {

        @NotNull
        public static final Parcelable.Creator<CustomerSession> CREATOR = new y();

        /* renamed from: a, reason: collision with root package name */
        public final String f44570a;

        public CustomerSession(String customerSessionClientSecret) {
            Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
            this.f44570a = customerSessionClientSecret;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CustomerSession) && Intrinsics.b(this.f44570a, ((CustomerSession) obj).f44570a);
        }

        public final int hashCode() {
            return this.f44570a.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType
        public final String j() {
            return "customer_session";
        }

        public final String toString() {
            return b.c0.l("CustomerSession(customerSessionClientSecret=", this.f44570a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44570a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType$LegacyCustomerEphemeralKey;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CustomerAccessType;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class LegacyCustomerEphemeralKey implements PaymentSheet$CustomerAccessType {

        @NotNull
        public static final Parcelable.Creator<LegacyCustomerEphemeralKey> CREATOR = new z();

        /* renamed from: a, reason: collision with root package name */
        public final String f44571a;

        public LegacyCustomerEphemeralKey(String ephemeralKeySecret) {
            Intrinsics.g(ephemeralKeySecret, "ephemeralKeySecret");
            this.f44571a = ephemeralKeySecret;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof LegacyCustomerEphemeralKey) && Intrinsics.b(this.f44571a, ((LegacyCustomerEphemeralKey) obj).f44571a);
        }

        public final int hashCode() {
            return this.f44571a.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType
        public final String j() {
            return "legacy";
        }

        public final String toString() {
            return b.c0.l("LegacyCustomerEphemeralKey(ephemeralKeySecret=", this.f44571a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44571a);
        }
    }

    String j();
}
