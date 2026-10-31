package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.math.BigDecimal;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/BinRange;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BinRange implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<BinRange> CREATOR = new eh.a(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f43152a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43153b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f43154c;

    public BinRange(String low, String high, boolean z11) {
        Intrinsics.g(low, "low");
        Intrinsics.g(high, "high");
        this.f43152a = low;
        this.f43153b = high;
        this.f43154c = z11;
    }

    public final boolean a(hq.f cardNumber) {
        Intrinsics.g(cardNumber, "cardNumber");
        String str = cardNumber.f59964d;
        Intrinsics.g(str, "<this>");
        BigDecimal bigDecimal = null;
        try {
            if (r70.e.f85612a.f(str)) {
                bigDecimal = new BigDecimal(str);
            }
        } catch (NumberFormatException unused) {
        }
        if (bigDecimal == null) {
            return false;
        }
        int length = str.length();
        String str2 = this.f43152a;
        boolean z11 = length >= str2.length() ? new BigDecimal(r70.l.G1(str2.length(), str)).compareTo(new BigDecimal(str2)) >= 0 : bigDecimal.compareTo(new BigDecimal(r70.l.G1(str.length(), str2))) >= 0;
        int length2 = str.length();
        String str3 = this.f43153b;
        return z11 && (length2 >= str3.length() ? new BigDecimal(r70.l.G1(str3.length(), str)).compareTo(new BigDecimal(str3)) <= 0 : bigDecimal.compareTo(new BigDecimal(r70.l.G1(str.length(), str3))) <= 0);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BinRange)) {
            return false;
        }
        BinRange binRange = (BinRange) obj;
        return Intrinsics.b(this.f43152a, binRange.f43152a) && Intrinsics.b(this.f43153b, binRange.f43153b) && this.f43154c == binRange.f43154c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f43154c) + b.c0.e(this.f43152a.hashCode() * 31, 31, this.f43153b);
    }

    public final String toString() {
        return a80.m.k(b.c0.w("BinRange(low=", this.f43152a, ", high=", this.f43153b, ", isStatic="), this.f43154c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43152a);
        dest.writeString(this.f43153b);
        dest.writeInt(this.f43154c ? 1 : 0);
    }
}
