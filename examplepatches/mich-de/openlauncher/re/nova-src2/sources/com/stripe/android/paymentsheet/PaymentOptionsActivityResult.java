package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult;", "Landroid/os/Parcelable;", "Succeeded", "Canceled", "Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult$Canceled;", "Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult$Succeeded;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentOptionsActivityResult implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final int f44439a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult$Canceled;", "Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends PaymentOptionsActivityResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new g();

        /* renamed from: b, reason: collision with root package name */
        public final Throwable f44440b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentSelection f44441c;

        /* renamed from: d, reason: collision with root package name */
        public final List f44442d;

        /* renamed from: e, reason: collision with root package name */
        public final LinkAccountUpdate.Value f44443e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Canceled(Throwable th2, PaymentSelection paymentSelection, List list, LinkAccountUpdate.Value linkAccountInfo) {
            super(0);
            Intrinsics.g(linkAccountInfo, "linkAccountInfo");
            this.f44440b = th2;
            this.f44441c = paymentSelection;
            this.f44442d = list;
            this.f44443e = linkAccountInfo;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Canceled)) {
                return false;
            }
            Canceled canceled = (Canceled) obj;
            return Intrinsics.b(this.f44440b, canceled.f44440b) && Intrinsics.b(this.f44441c, canceled.f44441c) && Intrinsics.b(this.f44442d, canceled.f44442d) && Intrinsics.b(this.f44443e, canceled.f44443e);
        }

        public final int hashCode() {
            Throwable th2 = this.f44440b;
            int iHashCode = (th2 == null ? 0 : th2.hashCode()) * 31;
            PaymentSelection paymentSelection = this.f44441c;
            int iHashCode2 = (iHashCode + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31;
            List list = this.f44442d;
            return this.f44443e.hashCode() + ((iHashCode2 + (list != null ? list.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "Canceled(mostRecentError=" + this.f44440b + ", paymentSelection=" + this.f44441c + ", paymentMethods=" + this.f44442d + ", linkAccountInfo=" + this.f44443e + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f44440b);
            dest.writeParcelable(this.f44441c, i5);
            List list = this.f44442d;
            if (list == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(list.size());
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    dest.writeParcelable((Parcelable) it.next(), i5);
                }
            }
            this.f44443e.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult$Succeeded;", "Lcom/stripe/android/paymentsheet/PaymentOptionsActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Succeeded extends PaymentOptionsActivityResult {

        @NotNull
        public static final Parcelable.Creator<Succeeded> CREATOR = new h();

        /* renamed from: b, reason: collision with root package name */
        public final PaymentSelection f44444b;

        /* renamed from: c, reason: collision with root package name */
        public final LinkAccountUpdate.Value f44445c;

        /* renamed from: d, reason: collision with root package name */
        public final List f44446d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Succeeded(PaymentSelection paymentSelection, LinkAccountUpdate.Value linkAccountInfo, List list) {
            super(-1);
            Intrinsics.g(paymentSelection, "paymentSelection");
            Intrinsics.g(linkAccountInfo, "linkAccountInfo");
            this.f44444b = paymentSelection;
            this.f44445c = linkAccountInfo;
            this.f44446d = list;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Succeeded)) {
                return false;
            }
            Succeeded succeeded = (Succeeded) obj;
            return Intrinsics.b(this.f44444b, succeeded.f44444b) && Intrinsics.b(this.f44445c, succeeded.f44445c) && Intrinsics.b(this.f44446d, succeeded.f44446d);
        }

        public final int hashCode() {
            int iHashCode = (this.f44445c.hashCode() + (this.f44444b.hashCode() * 31)) * 31;
            List list = this.f44446d;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Succeeded(paymentSelection=");
            sb2.append(this.f44444b);
            sb2.append(", linkAccountInfo=");
            sb2.append(this.f44445c);
            sb2.append(", paymentMethods=");
            return a80.m.j(sb2, this.f44446d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44444b, i5);
            this.f44445c.writeToParcel(dest, i5);
            List list = this.f44446d;
            if (list == null) {
                dest.writeInt(0);
                return;
            }
            dest.writeInt(1);
            dest.writeInt(list.size());
            Iterator it = list.iterator();
            while (it.hasNext()) {
                dest.writeParcelable((Parcelable) it.next(), i5);
            }
        }
    }

    public PaymentOptionsActivityResult(int i5) {
        this.f44439a = i5;
    }
}
