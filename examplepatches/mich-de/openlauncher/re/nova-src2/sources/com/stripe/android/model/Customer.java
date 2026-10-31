package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Customer;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class Customer implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<Customer> CREATOR = new eh.a(29);

    /* renamed from: a, reason: collision with root package name */
    public final String f43358a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43359b;

    /* renamed from: c, reason: collision with root package name */
    public final ShippingInformation f43360c;

    /* renamed from: d, reason: collision with root package name */
    public final List f43361d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43362e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f43363f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43364g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43365h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43366i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f43367j;

    public Customer(String str, String str2, ShippingInformation shippingInformation, List sources, boolean z11, Integer num, String str3, String str4, String str5, boolean z12) {
        Intrinsics.g(sources, "sources");
        this.f43358a = str;
        this.f43359b = str2;
        this.f43360c = shippingInformation;
        this.f43361d = sources;
        this.f43362e = z11;
        this.f43363f = num;
        this.f43364g = str3;
        this.f43365h = str4;
        this.f43366i = str5;
        this.f43367j = z12;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Customer)) {
            return false;
        }
        Customer customer = (Customer) obj;
        return Intrinsics.b(this.f43358a, customer.f43358a) && Intrinsics.b(this.f43359b, customer.f43359b) && Intrinsics.b(this.f43360c, customer.f43360c) && Intrinsics.b(this.f43361d, customer.f43361d) && this.f43362e == customer.f43362e && Intrinsics.b(this.f43363f, customer.f43363f) && Intrinsics.b(this.f43364g, customer.f43364g) && Intrinsics.b(this.f43365h, customer.f43365h) && Intrinsics.b(this.f43366i, customer.f43366i) && this.f43367j == customer.f43367j;
    }

    public final int hashCode() {
        String str = this.f43358a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f43359b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        ShippingInformation shippingInformation = this.f43360c;
        int iF = c9.f(b.u4.c((iHashCode2 + (shippingInformation == null ? 0 : shippingInformation.hashCode())) * 31, 31, this.f43361d), 31, this.f43362e);
        Integer num = this.f43363f;
        int iHashCode3 = (iF + (num == null ? 0 : num.hashCode())) * 31;
        String str3 = this.f43364g;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43365h;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43366i;
        return Boolean.hashCode(this.f43367j) + ((iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("Customer(id=", this.f43358a, ", defaultSource=", this.f43359b, ", shippingInformation=");
        sbW.append(this.f43360c);
        sbW.append(", sources=");
        sbW.append(this.f43361d);
        sbW.append(", hasMore=");
        sbW.append(this.f43362e);
        sbW.append(", totalCount=");
        sbW.append(this.f43363f);
        sbW.append(", url=");
        b.c0.D(sbW, this.f43364g, ", description=", this.f43365h, ", email=");
        sbW.append(this.f43366i);
        sbW.append(", liveMode=");
        sbW.append(this.f43367j);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43358a);
        dest.writeString(this.f43359b);
        ShippingInformation shippingInformation = this.f43360c;
        if (shippingInformation == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shippingInformation.writeToParcel(dest, i5);
        }
        Iterator itK = fq.c.k(this.f43361d, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
        dest.writeInt(this.f43362e ? 1 : 0);
        Integer num = this.f43363f;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        dest.writeString(this.f43364g);
        dest.writeString(this.f43365h);
        dest.writeString(this.f43366i);
        dest.writeInt(this.f43367j ? 1 : 0);
    }
}
