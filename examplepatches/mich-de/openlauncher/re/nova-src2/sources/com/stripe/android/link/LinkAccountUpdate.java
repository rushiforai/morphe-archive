package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.model.LinkAccount;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bq\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/LinkAccountUpdate;", "Landroid/os/Parcelable;", "Value", "None", "Lcom/stripe/android/link/LinkAccountUpdate$None;", "Lcom/stripe/android/link/LinkAccountUpdate$Value;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface LinkAccountUpdate extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkAccountUpdate$None;", "Lcom/stripe/android/link/LinkAccountUpdate;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class None implements LinkAccountUpdate {

        /* renamed from: a, reason: collision with root package name */
        public static final None f42863a = new None();

        @NotNull
        public static final Parcelable.Creator<None> CREATOR = new b();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof None);
        }

        public final int hashCode() {
            return -56225397;
        }

        public final String toString() {
            return "None";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/link/LinkAccountUpdate$Value;", "Lcom/stripe/android/link/LinkAccountUpdate;", "com/stripe/android/link/d", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Value implements LinkAccountUpdate {

        @NotNull
        public static final Parcelable.Creator<Value> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final LinkAccount f42864a;

        /* renamed from: b, reason: collision with root package name */
        public final d f42865b;

        public Value(LinkAccount linkAccount, d dVar) {
            this.f42864a = linkAccount;
            this.f42865b = dVar;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Value)) {
                return false;
            }
            Value value = (Value) obj;
            return Intrinsics.b(this.f42864a, value.f42864a) && this.f42865b == value.f42865b;
        }

        public final int hashCode() {
            LinkAccount linkAccount = this.f42864a;
            int iHashCode = (linkAccount == null ? 0 : linkAccount.hashCode()) * 31;
            d dVar = this.f42865b;
            return iHashCode + (dVar != null ? dVar.hashCode() : 0);
        }

        public final String toString() {
            return "Value(account=" + this.f42864a + ", lastUpdateReason=" + this.f42865b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            LinkAccount linkAccount = this.f42864a;
            if (linkAccount == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                linkAccount.writeToParcel(dest, i5);
            }
            d dVar = this.f42865b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }
}
