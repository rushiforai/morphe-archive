package com.stripe.android.ui.core;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import aw.a;
import b.c9;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/ui/core/BillingDetailsCollectionConfiguration;", "Landroid/os/Parcelable;", "aw/a", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BillingDetailsCollectionConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<BillingDetailsCollectionConfiguration> CREATOR = new w(20);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f45274a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f45275b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f45276c;

    /* renamed from: d, reason: collision with root package name */
    public final a f45277d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f45278e;

    public BillingDetailsCollectionConfiguration(boolean z11, boolean z12, boolean z13, a address, Set allowedCountries) {
        Intrinsics.g(address, "address");
        Intrinsics.g(allowedCountries, "allowedCountries");
        this.f45274a = z11;
        this.f45275b = z12;
        this.f45276c = z13;
        this.f45277d = address;
        this.f45278e = allowedCountries;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BillingDetailsCollectionConfiguration)) {
            return false;
        }
        BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = (BillingDetailsCollectionConfiguration) obj;
        return this.f45274a == billingDetailsCollectionConfiguration.f45274a && this.f45275b == billingDetailsCollectionConfiguration.f45275b && this.f45276c == billingDetailsCollectionConfiguration.f45276c && this.f45277d == billingDetailsCollectionConfiguration.f45277d && Intrinsics.b(this.f45278e, billingDetailsCollectionConfiguration.f45278e);
    }

    public final int hashCode() {
        return this.f45278e.hashCode() + ((this.f45277d.hashCode() + c9.f(c9.f(Boolean.hashCode(this.f45274a) * 31, 31, this.f45275b), 31, this.f45276c)) * 31);
    }

    public final String toString() {
        return "BillingDetailsCollectionConfiguration(collectName=" + this.f45274a + ", collectEmail=" + this.f45275b + ", collectPhone=" + this.f45276c + ", address=" + this.f45277d + ", allowedCountries=" + this.f45278e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f45274a ? 1 : 0);
        dest.writeInt(this.f45275b ? 1 : 0);
        dest.writeInt(this.f45276c ? 1 : 0);
        dest.writeString(this.f45277d.name());
        Set set = this.f45278e;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
    }

    public BillingDetailsCollectionConfiguration(boolean z11, boolean z12, boolean z13, a aVar, int i5) {
        this((i5 & 1) != 0 ? false : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? false : z13, (i5 & 8) != 0 ? a.f15701a : aVar, EmptySet.f71734a);
    }
}
