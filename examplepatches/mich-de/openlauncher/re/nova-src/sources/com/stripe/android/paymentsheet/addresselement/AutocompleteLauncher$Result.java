package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"com/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result", "Landroid/os/Parcelable;", "EnterManually", "OnBack", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result$EnterManually;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result$OnBack;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AutocompleteLauncher$Result extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result$EnterManually;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class EnterManually implements AutocompleteLauncher$Result {

        @NotNull
        public static final Parcelable.Creator<EnterManually> CREATOR = new a0();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$Address f44719a;

        public EnterManually(PaymentSheet$Address paymentSheet$Address) {
            this.f44719a = paymentSheet$Address;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof EnterManually) && Intrinsics.b(this.f44719a, ((EnterManually) obj).f44719a);
        }

        public final int hashCode() {
            PaymentSheet$Address paymentSheet$Address = this.f44719a;
            if (paymentSheet$Address == null) {
                return 0;
            }
            return paymentSheet$Address.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteLauncher$Result
        /* renamed from: k, reason: from getter */
        public final PaymentSheet$Address getF44720a() {
            return this.f44719a;
        }

        public final String toString() {
            return "EnterManually(address=" + this.f44719a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            PaymentSheet$Address paymentSheet$Address = this.f44719a;
            if (paymentSheet$Address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentSheet$Address.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result$OnBack;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteLauncher$Result;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class OnBack implements AutocompleteLauncher$Result {

        @NotNull
        public static final Parcelable.Creator<OnBack> CREATOR = new b0();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$Address f44720a;

        public OnBack(PaymentSheet$Address paymentSheet$Address) {
            this.f44720a = paymentSheet$Address;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof OnBack) && Intrinsics.b(this.f44720a, ((OnBack) obj).f44720a);
        }

        public final int hashCode() {
            PaymentSheet$Address paymentSheet$Address = this.f44720a;
            if (paymentSheet$Address == null) {
                return 0;
            }
            return paymentSheet$Address.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteLauncher$Result
        /* renamed from: k, reason: from getter */
        public final PaymentSheet$Address getF44720a() {
            return this.f44720a;
        }

        public final String toString() {
            return "OnBack(address=" + this.f44720a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            PaymentSheet$Address paymentSheet$Address = this.f44720a;
            if (paymentSheet$Address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentSheet$Address.writeToParcel(dest, i5);
            }
        }
    }

    /* renamed from: k */
    PaymentSheet$Address getF44720a();
}
