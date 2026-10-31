package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult;", "Landroid/os/Parcelable;", "Succeeded", "Canceled", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult$Canceled;", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult$Succeeded;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class AddressLauncherResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult$Canceled;", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Canceled extends AddressLauncherResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new n();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f44704a;

        public Canceled(boolean z11) {
            this.f44704a = z11;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AddressLauncherResult
        public final int b() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Canceled) && this.f44704a == ((Canceled) obj).f44704a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f44704a);
        }

        public final String toString() {
            return a80.m.i("Canceled(irrelevantValueForGeneratedCode=", ")", this.f44704a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f44704a ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult$Succeeded;", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Succeeded extends AddressLauncherResult {

        @NotNull
        public static final Parcelable.Creator<Succeeded> CREATOR = new o();

        /* renamed from: a, reason: collision with root package name */
        public final AddressDetails f44705a;

        public Succeeded(AddressDetails address) {
            Intrinsics.g(address, "address");
            this.f44705a = address;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AddressLauncherResult
        public final int b() {
            return -1;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Succeeded) && Intrinsics.b(this.f44705a, ((Succeeded) obj).f44705a);
        }

        public final int hashCode() {
            return this.f44705a.hashCode();
        }

        public final String toString() {
            return "Succeeded(address=" + this.f44705a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f44705a.writeToParcel(dest, i5);
        }
    }

    public abstract int b();
}
