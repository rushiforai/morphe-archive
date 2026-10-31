package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"com/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent", "Landroid/os/Parcelable;", "OnBack", "OnEnterManually", "Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent$OnBack;", "Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent$OnEnterManually;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AddressElementNavigator$AutocompleteEvent extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent$OnBack;", "Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class OnBack implements AddressElementNavigator$AutocompleteEvent {

        @NotNull
        public static final Parcelable.Creator<OnBack> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$Address f44689a;

        public OnBack(PaymentSheet$Address paymentSheet$Address) {
            this.f44689a = paymentSheet$Address;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof OnBack) && Intrinsics.b(this.f44689a, ((OnBack) obj).f44689a);
        }

        public final int hashCode() {
            PaymentSheet$Address paymentSheet$Address = this.f44689a;
            if (paymentSheet$Address == null) {
                return 0;
            }
            return paymentSheet$Address.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AddressElementNavigator$AutocompleteEvent
        /* renamed from: k, reason: from getter */
        public final PaymentSheet$Address getF44690a() {
            return this.f44689a;
        }

        public final String toString() {
            return "OnBack(address=" + this.f44689a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            PaymentSheet$Address paymentSheet$Address = this.f44689a;
            if (paymentSheet$Address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentSheet$Address.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent$OnEnterManually;", "Lcom/stripe/android/paymentsheet/addresselement/AddressElementNavigator$AutocompleteEvent;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class OnEnterManually implements AddressElementNavigator$AutocompleteEvent {

        @NotNull
        public static final Parcelable.Creator<OnEnterManually> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$Address f44690a;

        public OnEnterManually(PaymentSheet$Address paymentSheet$Address) {
            this.f44690a = paymentSheet$Address;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof OnEnterManually) && Intrinsics.b(this.f44690a, ((OnEnterManually) obj).f44690a);
        }

        public final int hashCode() {
            PaymentSheet$Address paymentSheet$Address = this.f44690a;
            if (paymentSheet$Address == null) {
                return 0;
            }
            return paymentSheet$Address.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AddressElementNavigator$AutocompleteEvent
        /* renamed from: k, reason: from getter */
        public final PaymentSheet$Address getF44690a() {
            return this.f44690a;
        }

        public final String toString() {
            return "OnEnterManually(address=" + this.f44690a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            PaymentSheet$Address paymentSheet$Address = this.f44690a;
            if (paymentSheet$Address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentSheet$Address.writeToParcel(dest, i5);
            }
        }
    }

    /* renamed from: k */
    PaymentSheet$Address getF44690a();
}
