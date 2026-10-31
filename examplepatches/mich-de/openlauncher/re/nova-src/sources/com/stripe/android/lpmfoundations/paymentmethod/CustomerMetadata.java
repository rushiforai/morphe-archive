package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/CustomerMetadata;", "Landroid/os/Parcelable;", "Permissions", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CustomerMetadata implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<CustomerMetadata> CREATOR = new d();

    /* renamed from: a, reason: collision with root package name */
    public final String f43071a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43072b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43073c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f43074d;

    /* renamed from: e, reason: collision with root package name */
    public final Permissions f43075e;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/CustomerMetadata$Permissions;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Permissions implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Permissions> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final tq.a f43076a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f43077b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f43078c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f43079d;

        public Permissions(tq.a removePaymentMethod, boolean z11, boolean z12, boolean z13) {
            Intrinsics.g(removePaymentMethod, "removePaymentMethod");
            this.f43076a = removePaymentMethod;
            this.f43077b = z11;
            this.f43078c = z12;
            this.f43079d = z13;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Permissions)) {
                return false;
            }
            Permissions permissions = (Permissions) obj;
            return this.f43076a == permissions.f43076a && this.f43077b == permissions.f43077b && this.f43078c == permissions.f43078c && this.f43079d == permissions.f43079d;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f43079d) + c9.f(c9.f(this.f43076a.hashCode() * 31, 31, this.f43077b), 31, this.f43078c);
        }

        public final String toString() {
            return "Permissions(removePaymentMethod=" + this.f43076a + ", canRemoveLastPaymentMethod=" + this.f43077b + ", canRemoveDuplicates=" + this.f43078c + ", canUpdateFullPaymentMethodDetails=" + this.f43079d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43076a.name());
            dest.writeInt(this.f43077b ? 1 : 0);
            dest.writeInt(this.f43078c ? 1 : 0);
            dest.writeInt(this.f43079d ? 1 : 0);
        }
    }

    public CustomerMetadata(String id2, String ephemeralKeySecret, String str, boolean z11, Permissions permissions) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(ephemeralKeySecret, "ephemeralKeySecret");
        Intrinsics.g(permissions, "permissions");
        this.f43071a = id2;
        this.f43072b = ephemeralKeySecret;
        this.f43073c = str;
        this.f43074d = z11;
        this.f43075e = permissions;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CustomerMetadata)) {
            return false;
        }
        CustomerMetadata customerMetadata = (CustomerMetadata) obj;
        return Intrinsics.b(this.f43071a, customerMetadata.f43071a) && Intrinsics.b(this.f43072b, customerMetadata.f43072b) && Intrinsics.b(this.f43073c, customerMetadata.f43073c) && this.f43074d == customerMetadata.f43074d && Intrinsics.b(this.f43075e, customerMetadata.f43075e);
    }

    public final int hashCode() {
        int iE = c0.e(this.f43071a.hashCode() * 31, 31, this.f43072b);
        String str = this.f43073c;
        return this.f43075e.hashCode() + c9.f((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.f43074d);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("CustomerMetadata(id=", this.f43071a, ", ephemeralKeySecret=", this.f43072b, ", customerSessionClientSecret=");
        a80.m.q(this.f43073c, ", isPaymentMethodSetAsDefaultEnabled=", ", permissions=", sbW, this.f43074d);
        sbW.append(this.f43075e);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43071a);
        dest.writeString(this.f43072b);
        dest.writeString(this.f43073c);
        dest.writeInt(this.f43074d ? 1 : 0);
        this.f43075e.writeToParcel(dest, i5);
    }
}
