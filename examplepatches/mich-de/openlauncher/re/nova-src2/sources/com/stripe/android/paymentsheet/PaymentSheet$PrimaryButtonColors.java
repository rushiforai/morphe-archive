package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$PrimaryButtonColors", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$PrimaryButtonColors implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$PrimaryButtonColors> CREATOR = new ou.l0(13);

    /* renamed from: f, reason: collision with root package name */
    public static final PaymentSheet$PrimaryButtonColors f44616f;

    /* renamed from: g, reason: collision with root package name */
    public static final PaymentSheet$PrimaryButtonColors f44617g;

    /* renamed from: a, reason: collision with root package name */
    public final Integer f44618a;

    /* renamed from: b, reason: collision with root package name */
    public final int f44619b;

    /* renamed from: c, reason: collision with root package name */
    public final int f44620c;

    /* renamed from: d, reason: collision with root package name */
    public final int f44621d;

    /* renamed from: e, reason: collision with root package name */
    public final int f44622e;

    static {
        hw.k kVar = hw.q.f60780e;
        hw.i iVar = kVar.f60744a;
        f44616f = new PaymentSheet$PrimaryButtonColors(i2.r0.r(iVar.f60737b), i2.r0.r(iVar.f60738c), i2.r0.r(iVar.f60739d), i2.r0.r(iVar.f60740e), null);
        hw.i iVar2 = kVar.f60745b;
        f44617g = new PaymentSheet$PrimaryButtonColors(i2.r0.r(iVar2.f60737b), i2.r0.r(iVar2.f60738c), i2.r0.r(iVar2.f60739d), i2.r0.r(iVar2.f60740e), null);
    }

    public PaymentSheet$PrimaryButtonColors(int i5, int i11, int i12, int i13, Integer num) {
        this.f44618a = num;
        this.f44619b = i5;
        this.f44620c = i11;
        this.f44621d = i12;
        this.f44622e = i13;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$PrimaryButtonColors)) {
            return false;
        }
        PaymentSheet$PrimaryButtonColors paymentSheet$PrimaryButtonColors = (PaymentSheet$PrimaryButtonColors) obj;
        return Intrinsics.b(this.f44618a, paymentSheet$PrimaryButtonColors.f44618a) && this.f44619b == paymentSheet$PrimaryButtonColors.f44619b && this.f44620c == paymentSheet$PrimaryButtonColors.f44620c && this.f44621d == paymentSheet$PrimaryButtonColors.f44621d && this.f44622e == paymentSheet$PrimaryButtonColors.f44622e;
    }

    public final int hashCode() {
        Integer num = this.f44618a;
        return ((((((((num == null ? 0 : num.hashCode()) * 31) + this.f44619b) * 31) + this.f44620c) * 31) + this.f44621d) * 31) + this.f44622e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PrimaryButtonColors(background=");
        sb2.append(this.f44618a);
        sb2.append(", onBackground=");
        sb2.append(this.f44619b);
        sb2.append(", border=");
        b.c0.A(sb2, this.f44620c, ", successBackgroundColor=", this.f44621d, ", onSuccessBackgroundColor=");
        return b.c0.o(sb2, this.f44622e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Integer num = this.f44618a;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        dest.writeInt(this.f44619b);
        dest.writeInt(this.f44620c);
        dest.writeInt(this.f44621d);
        dest.writeInt(this.f44622e);
    }
}
