package ads_mobile_sdk;

import b.c0;
import b.k9;

/* loaded from: classes2.dex */
public final class qz2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f8894a;

    /* renamed from: b, reason: collision with root package name */
    public final int f8895b;

    /* renamed from: c, reason: collision with root package name */
    public final int f8896c;

    /* renamed from: d, reason: collision with root package name */
    public final int f8897d;

    public qz2(int i5, int i11, int i12, int i13) {
        this.f8894a = i5;
        this.f8895b = i11;
        this.f8896c = i12;
        this.f8897d = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qz2)) {
            return false;
        }
        qz2 qz2Var = (qz2) obj;
        return this.f8894a == qz2Var.f8894a && this.f8895b == qz2Var.f8895b && this.f8896c == qz2Var.f8896c && this.f8897d == qz2Var.f8897d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f8897d) + k9.b(this.f8896c, k9.b(this.f8895b, Integer.hashCode(this.f8894a) * 31));
    }

    public final String toString() {
        StringBuilder sbT = c0.t(this.f8894a, "RoundedCornerRadii(topLeft=", ", topRight=", this.f8895b, ", bottomRight=");
        sbT.append(this.f8896c);
        sbT.append(", bottomLeft=");
        sbT.append(this.f8897d);
        sbT.append(")");
        return sbT.toString();
    }
}
