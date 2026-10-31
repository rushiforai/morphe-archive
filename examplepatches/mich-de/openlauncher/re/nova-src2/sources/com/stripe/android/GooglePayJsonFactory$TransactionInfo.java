package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import dq.g;
import dq.h;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/GooglePayJsonFactory$TransactionInfo", "Landroid/os/Parcelable;", "dq/h", "dq/g", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayJsonFactory$TransactionInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayJsonFactory$TransactionInfo> CREATOR = new di.b(9);

    /* renamed from: a, reason: collision with root package name */
    public final String f42429a;

    /* renamed from: b, reason: collision with root package name */
    public final h f42430b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42431c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42432d;

    /* renamed from: e, reason: collision with root package name */
    public final Long f42433e;

    /* renamed from: f, reason: collision with root package name */
    public final String f42434f;

    /* renamed from: g, reason: collision with root package name */
    public final g f42435g;

    public GooglePayJsonFactory$TransactionInfo(String currencyCode, h totalPriceStatus, String str, String str2, Long l9, String str3, g gVar) {
        Intrinsics.g(currencyCode, "currencyCode");
        Intrinsics.g(totalPriceStatus, "totalPriceStatus");
        this.f42429a = currencyCode;
        this.f42430b = totalPriceStatus;
        this.f42431c = str;
        this.f42432d = str2;
        this.f42433e = l9;
        this.f42434f = str3;
        this.f42435g = gVar;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayJsonFactory$TransactionInfo)) {
            return false;
        }
        GooglePayJsonFactory$TransactionInfo googlePayJsonFactory$TransactionInfo = (GooglePayJsonFactory$TransactionInfo) obj;
        return Intrinsics.b(this.f42429a, googlePayJsonFactory$TransactionInfo.f42429a) && this.f42430b == googlePayJsonFactory$TransactionInfo.f42430b && Intrinsics.b(this.f42431c, googlePayJsonFactory$TransactionInfo.f42431c) && Intrinsics.b(this.f42432d, googlePayJsonFactory$TransactionInfo.f42432d) && Intrinsics.b(this.f42433e, googlePayJsonFactory$TransactionInfo.f42433e) && Intrinsics.b(this.f42434f, googlePayJsonFactory$TransactionInfo.f42434f) && this.f42435g == googlePayJsonFactory$TransactionInfo.f42435g;
    }

    public final int hashCode() {
        int iHashCode = (this.f42430b.hashCode() + (this.f42429a.hashCode() * 31)) * 31;
        String str = this.f42431c;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42432d;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.f42433e;
        int iHashCode4 = (iHashCode3 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str3 = this.f42434f;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        g gVar = this.f42435g;
        return iHashCode5 + (gVar != null ? gVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TransactionInfo(currencyCode=");
        sb2.append(this.f42429a);
        sb2.append(", totalPriceStatus=");
        sb2.append(this.f42430b);
        sb2.append(", countryCode=");
        c0.D(sb2, this.f42431c, ", transactionId=", this.f42432d, ", totalPrice=");
        sb2.append(this.f42433e);
        sb2.append(", totalPriceLabel=");
        sb2.append(this.f42434f);
        sb2.append(", checkoutOption=");
        sb2.append(this.f42435g);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42429a);
        dest.writeString(this.f42430b.name());
        dest.writeString(this.f42431c);
        dest.writeString(this.f42432d);
        Long l9 = this.f42433e;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f42434f);
        g gVar = this.f42435g;
        if (gVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(gVar.name());
        }
    }
}
