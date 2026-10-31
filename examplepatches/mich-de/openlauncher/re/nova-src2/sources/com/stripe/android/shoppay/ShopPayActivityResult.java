package com.stripe.android.shoppay;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/shoppay/ShopPayActivityResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/shoppay/ShopPayActivityResult$Canceled;", "Lcom/stripe/android/shoppay/ShopPayActivityResult$Completed;", "Lcom/stripe/android/shoppay/ShopPayActivityResult$Failed;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ShopPayActivityResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/shoppay/ShopPayActivityResult$Canceled;", "Lcom/stripe/android/shoppay/ShopPayActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled implements ShopPayActivityResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f45014a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new b();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return 991179064;
        }

        public final String toString() {
            return "Canceled";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/shoppay/ShopPayActivityResult$Completed;", "Lcom/stripe/android/shoppay/ShopPayActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed implements ShopPayActivityResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Completed f45015a = new Completed();

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new c();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Completed);
        }

        public final int hashCode() {
            return -1217733236;
        }

        public final String toString() {
            return "Completed";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/shoppay/ShopPayActivityResult$Failed;", "Lcom/stripe/android/shoppay/ShopPayActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements ShopPayActivityResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f45016a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f45016a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f45016a, ((Failed) obj).f45016a);
        }

        public final int hashCode() {
            return this.f45016a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f45016a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f45016a);
        }
    }
}
