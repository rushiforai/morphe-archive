package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/AccountRange;", "Lcom/stripe/android/core/model/StripeModel;", "ft/a", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AccountRange implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<AccountRange> CREATOR = new eh.a(12);

    /* renamed from: a, reason: collision with root package name */
    public final BinRange f43122a;

    /* renamed from: b, reason: collision with root package name */
    public final int f43123b;

    /* renamed from: c, reason: collision with root package name */
    public final ft.a f43124c;

    /* renamed from: d, reason: collision with root package name */
    public final ft.c f43125d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43126e;

    public /* synthetic */ AccountRange(BinRange binRange, int i5, ft.a aVar) {
        this(binRange, i5, aVar, ft.c.f55914f, null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AccountRange)) {
            return false;
        }
        AccountRange accountRange = (AccountRange) obj;
        return Intrinsics.b(this.f43122a, accountRange.f43122a) && this.f43123b == accountRange.f43123b && this.f43124c == accountRange.f43124c && this.f43125d == accountRange.f43125d && Intrinsics.b(this.f43126e, accountRange.f43126e);
    }

    public final int hashCode() {
        int iHashCode = (this.f43125d.hashCode() + ((this.f43124c.hashCode() + b.u4.a(this.f43123b, this.f43122a.hashCode() * 31, 31)) * 31)) * 31;
        String str = this.f43126e;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AccountRange(binRange=");
        sb2.append(this.f43122a);
        sb2.append(", panLength=");
        sb2.append(this.f43123b);
        sb2.append(", brandInfo=");
        sb2.append(this.f43124c);
        sb2.append(", funding=");
        sb2.append(this.f43125d);
        sb2.append(", country=");
        return b.c0.q(sb2, this.f43126e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43122a.writeToParcel(dest, i5);
        dest.writeInt(this.f43123b);
        dest.writeString(this.f43124c.name());
        dest.writeString(this.f43125d.name());
        dest.writeString(this.f43126e);
    }

    public AccountRange(BinRange binRange, int i5, ft.a brandInfo, ft.c funding, String str) {
        Intrinsics.g(binRange, "binRange");
        Intrinsics.g(brandInfo, "brandInfo");
        Intrinsics.g(funding, "funding");
        this.f43122a = binRange;
        this.f43123b = i5;
        this.f43124c = brandInfo;
        this.f43125d = funding;
        this.f43126e = str;
    }
}
