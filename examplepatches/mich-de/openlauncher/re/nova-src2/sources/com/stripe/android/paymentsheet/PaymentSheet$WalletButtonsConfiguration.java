package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$WalletButtonsConfiguration", "Landroid/os/Parcelable;", "Visibility", "ou/z0", "ou/x0", "ou/y0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$WalletButtonsConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$WalletButtonsConfiguration> CREATOR = new n0();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f44655a;

    /* renamed from: b, reason: collision with root package name */
    public final Visibility f44656b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$ButtonThemes f44657c;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$WalletButtonsConfiguration$Visibility;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Visibility implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Visibility> CREATOR = new o0();

        /* renamed from: a, reason: collision with root package name */
        public final Map f44658a;

        /* renamed from: b, reason: collision with root package name */
        public final Map f44659b;

        public Visibility(Map paymentElement, Map walletButtonsView) {
            Intrinsics.g(paymentElement, "paymentElement");
            Intrinsics.g(walletButtonsView, "walletButtonsView");
            this.f44658a = paymentElement;
            this.f44659b = walletButtonsView;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Visibility)) {
                return false;
            }
            Visibility visibility = (Visibility) obj;
            return Intrinsics.b(this.f44658a, visibility.f44658a) && Intrinsics.b(this.f44659b, visibility.f44659b);
        }

        public final int hashCode() {
            return this.f44659b.hashCode() + (this.f44658a.hashCode() * 31);
        }

        public final String toString() {
            return "Visibility(paymentElement=" + this.f44658a + ", walletButtonsView=" + this.f44659b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Map map = this.f44658a;
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString(((ou.y0) entry.getKey()).name());
                dest.writeString(((ou.x0) entry.getValue()).name());
            }
            Map map2 = this.f44659b;
            dest.writeInt(map2.size());
            for (Map.Entry entry2 : map2.entrySet()) {
                dest.writeString(((ou.y0) entry2.getKey()).name());
                dest.writeString(((ou.z0) entry2.getValue()).name());
            }
        }
    }

    public PaymentSheet$WalletButtonsConfiguration(boolean z11, Visibility visibility, PaymentSheet$ButtonThemes buttonThemes) {
        Intrinsics.g(visibility, "visibility");
        Intrinsics.g(buttonThemes, "buttonThemes");
        this.f44655a = z11;
        this.f44656b = visibility;
        this.f44657c = buttonThemes;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$WalletButtonsConfiguration)) {
            return false;
        }
        PaymentSheet$WalletButtonsConfiguration paymentSheet$WalletButtonsConfiguration = (PaymentSheet$WalletButtonsConfiguration) obj;
        return this.f44655a == paymentSheet$WalletButtonsConfiguration.f44655a && Intrinsics.b(this.f44656b, paymentSheet$WalletButtonsConfiguration.f44656b) && Intrinsics.b(this.f44657c, paymentSheet$WalletButtonsConfiguration.f44657c);
    }

    public final int hashCode() {
        return this.f44657c.f44520a.hashCode() + ((this.f44656b.hashCode() + (Boolean.hashCode(this.f44655a) * 31)) * 31);
    }

    public final String toString() {
        return "WalletButtonsConfiguration(willDisplayExternally=" + this.f44655a + ", visibility=" + this.f44656b + ", buttonThemes=" + this.f44657c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f44655a ? 1 : 0);
        this.f44656b.writeToParcel(dest, i5);
        this.f44657c.writeToParcel(dest, i5);
    }
}
