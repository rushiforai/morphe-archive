package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Colors", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Colors implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Colors> CREATOR = new ou.l0(5);

    /* renamed from: l, reason: collision with root package name */
    public static final PaymentSheet$Colors f44531l;

    /* renamed from: m, reason: collision with root package name */
    public static final PaymentSheet$Colors f44532m;

    /* renamed from: a, reason: collision with root package name */
    public final int f44533a;

    /* renamed from: b, reason: collision with root package name */
    public final int f44534b;

    /* renamed from: c, reason: collision with root package name */
    public final int f44535c;

    /* renamed from: d, reason: collision with root package name */
    public final int f44536d;

    /* renamed from: e, reason: collision with root package name */
    public final int f44537e;

    /* renamed from: f, reason: collision with root package name */
    public final int f44538f;

    /* renamed from: g, reason: collision with root package name */
    public final int f44539g;

    /* renamed from: h, reason: collision with root package name */
    public final int f44540h;

    /* renamed from: i, reason: collision with root package name */
    public final int f44541i;

    /* renamed from: j, reason: collision with root package name */
    public final int f44542j;

    /* renamed from: k, reason: collision with root package name */
    public final int f44543k;

    static {
        hw.n nVar = hw.q.f60776a;
        long jF = nVar.f60761i.f();
        f1.t0 t0Var = nVar.f60761i;
        f44531l = new PaymentSheet$Colors(jF, t0Var.h(), nVar.f60753a, nVar.f60754b, nVar.f60755c, nVar.f60756d, nVar.f60757e, nVar.f60759g, t0Var.e(), nVar.f60760h, t0Var.c());
        hw.n nVar2 = hw.q.f60777b;
        long jF2 = nVar2.f60761i.f();
        f1.t0 t0Var2 = nVar2.f60761i;
        f44532m = new PaymentSheet$Colors(jF2, t0Var2.h(), nVar2.f60753a, nVar2.f60754b, nVar2.f60755c, nVar2.f60756d, nVar2.f60757e, nVar2.f60759g, t0Var2.e(), nVar2.f60760h, t0Var2.c());
    }

    public PaymentSheet$Colors(int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, int i19, int i21) {
        this.f44533a = i5;
        this.f44534b = i11;
        this.f44535c = i12;
        this.f44536d = i13;
        this.f44537e = i14;
        this.f44538f = i15;
        this.f44539g = i16;
        this.f44540h = i17;
        this.f44541i = i18;
        this.f44542j = i19;
        this.f44543k = i21;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Colors)) {
            return false;
        }
        PaymentSheet$Colors paymentSheet$Colors = (PaymentSheet$Colors) obj;
        return this.f44533a == paymentSheet$Colors.f44533a && this.f44534b == paymentSheet$Colors.f44534b && this.f44535c == paymentSheet$Colors.f44535c && this.f44536d == paymentSheet$Colors.f44536d && this.f44537e == paymentSheet$Colors.f44537e && this.f44538f == paymentSheet$Colors.f44538f && this.f44539g == paymentSheet$Colors.f44539g && this.f44540h == paymentSheet$Colors.f44540h && this.f44541i == paymentSheet$Colors.f44541i && this.f44542j == paymentSheet$Colors.f44542j && this.f44543k == paymentSheet$Colors.f44543k;
    }

    public final int hashCode() {
        return (((((((((((((((((((this.f44533a * 31) + this.f44534b) * 31) + this.f44535c) * 31) + this.f44536d) * 31) + this.f44537e) * 31) + this.f44538f) * 31) + this.f44539g) * 31) + this.f44540h) * 31) + this.f44541i) * 31) + this.f44542j) * 31) + this.f44543k;
    }

    public final String toString() {
        StringBuilder sbT = b.c0.t(this.f44533a, "Colors(primary=", ", surface=", this.f44534b, ", component=");
        b.c0.A(sbT, this.f44535c, ", componentBorder=", this.f44536d, ", componentDivider=");
        b.c0.A(sbT, this.f44537e, ", onComponent=", this.f44538f, ", onSurface=");
        b.c0.A(sbT, this.f44539g, ", subtitle=", this.f44540h, ", placeholderText=");
        b.c0.A(sbT, this.f44541i, ", appBarIcon=", this.f44542j, ", error=");
        return b.c0.o(sbT, this.f44543k, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f44533a);
        dest.writeInt(this.f44534b);
        dest.writeInt(this.f44535c);
        dest.writeInt(this.f44536d);
        dest.writeInt(this.f44537e);
        dest.writeInt(this.f44538f);
        dest.writeInt(this.f44539g);
        dest.writeInt(this.f44540h);
        dest.writeInt(this.f44541i);
        dest.writeInt(this.f44542j);
        dest.writeInt(this.f44543k);
    }

    public PaymentSheet$Colors(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22) {
        this(i2.r0.r(j11), i2.r0.r(j12), i2.r0.r(j13), i2.r0.r(j14), i2.r0.r(j15), i2.r0.r(j16), i2.r0.r(j19), i2.r0.r(j17), i2.r0.r(j18), i2.r0.r(j21), i2.r0.r(j22));
    }
}
