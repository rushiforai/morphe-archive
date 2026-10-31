package ql;

import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class b0 extends g0 {

    /* renamed from: g, reason: collision with root package name */
    public static final BigInteger f84121g = BigInteger.valueOf(65537);

    /* renamed from: a, reason: collision with root package name */
    public final int f84122a;

    /* renamed from: b, reason: collision with root package name */
    public final BigInteger f84123b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f84124c;

    /* renamed from: d, reason: collision with root package name */
    public final z f84125d;

    /* renamed from: e, reason: collision with root package name */
    public final z f84126e;

    /* renamed from: f, reason: collision with root package name */
    public final int f84127f;

    public b0(int i5, BigInteger bigInteger, a0 a0Var, z zVar, z zVar2, int i11) {
        this.f84122a = i5;
        this.f84123b = bigInteger;
        this.f84124c = a0Var;
        this.f84125d = zVar;
        this.f84126e = zVar2;
        this.f84127f = i11;
    }

    public static y b() {
        y yVar = new y();
        yVar.f84237a = null;
        yVar.f84238b = f84121g;
        yVar.f84239c = null;
        yVar.f84240d = null;
        yVar.f84241e = null;
        yVar.f84242f = a0.f84108e;
        return yVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f84124c != a0.f84108e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof b0)) {
            return false;
        }
        b0 b0Var = (b0) obj;
        return b0Var.f84122a == this.f84122a && Objects.equals(b0Var.f84123b, this.f84123b) && Objects.equals(b0Var.f84124c, this.f84124c) && Objects.equals(b0Var.f84125d, this.f84125d) && Objects.equals(b0Var.f84126e, this.f84126e) && b0Var.f84127f == this.f84127f;
    }

    public final int hashCode() {
        return Objects.hash(b0.class, Integer.valueOf(this.f84122a), this.f84123b, this.f84124c, this.f84125d, this.f84126e, Integer.valueOf(this.f84127f));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RSA SSA PSS Parameters (variant: ");
        sb2.append(this.f84124c);
        sb2.append(", signature hashType: ");
        sb2.append(this.f84125d);
        sb2.append(", mgf1 hashType: ");
        sb2.append(this.f84126e);
        sb2.append(", saltLengthBytes: ");
        sb2.append(this.f84127f);
        sb2.append(", publicExponent: ");
        sb2.append(this.f84123b);
        sb2.append(", and ");
        return b.c0.o(sb2, this.f84122a, "-bit modulus)");
    }
}
