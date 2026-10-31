package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayLauncher$Result", "Landroid/os/Parcelable;", "Completed", "Failed", "Canceled", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Canceled;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Completed;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Failed;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class GooglePayLauncher$Result implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Canceled;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends GooglePayLauncher$Result {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42777a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new a();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return 1700832601;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Completed;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends GooglePayLauncher$Result {

        /* renamed from: a, reason: collision with root package name */
        public static final Completed f42778a = new Completed();

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new b();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Completed);
        }

        public final int hashCode() {
            return -693310069;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result$Failed;", "Lcom/stripe/android/googlepaylauncher/GooglePayLauncher$Result;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failed extends GooglePayLauncher$Result {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42779a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42779a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42779a, ((Failed) obj).f42779a);
        }

        public final int hashCode() {
            return this.f42779a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42779a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42779a);
        }
    }
}
