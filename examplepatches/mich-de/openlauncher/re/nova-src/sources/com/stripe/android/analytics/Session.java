package com.stripe.android.analytics;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/analytics/Session;", "Landroid/os/Parcelable;", "Owner", "Observer", "Lcom/stripe/android/analytics/Session$Observer;", "Lcom/stripe/android/analytics/Session$Owner;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface Session extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/analytics/Session$Observer;", "Lcom/stripe/android/analytics/Session;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Observer implements Session {

        /* renamed from: a, reason: collision with root package name */
        public static final Observer f42455a = new Observer();

        @NotNull
        public static final Parcelable.Creator<Observer> CREATOR = new a();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Observer);
        }

        public final int hashCode() {
            return 642243785;
        }

        public final String toString() {
            return "Observer";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/analytics/Session$Owner;", "Lcom/stripe/android/analytics/Session;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Owner implements Session {

        @NotNull
        public static final Parcelable.Creator<Owner> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f42456a;

        public Owner(String id2) {
            Intrinsics.g(id2, "id");
            this.f42456a = id2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Owner) && Intrinsics.b(this.f42456a, ((Owner) obj).f42456a);
        }

        public final int hashCode() {
            return this.f42456a.hashCode();
        }

        public final String toString() {
            return c0.l("Owner(id=", this.f42456a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42456a);
        }
    }
}
