package ql;

import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class u extends g0 {

    /* renamed from: e, reason: collision with root package name */
    public static final BigInteger f84213e = BigInteger.valueOf(65537);

    /* renamed from: a, reason: collision with root package name */
    public final int f84214a;

    /* renamed from: b, reason: collision with root package name */
    public final BigInteger f84215b;

    /* renamed from: c, reason: collision with root package name */
    public final t f84216c;

    /* renamed from: d, reason: collision with root package name */
    public final s f84217d;

    public u(int i5, BigInteger bigInteger, t tVar, s sVar) {
        this.f84214a = i5;
        this.f84215b = bigInteger;
        this.f84216c = tVar;
        this.f84217d = sVar;
    }

    public static r b() {
        r rVar = new r();
        rVar.f84200a = null;
        rVar.f84201b = f84213e;
        rVar.f84202c = null;
        rVar.f84203d = t.f84211e;
        return rVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f84216c != t.f84211e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return uVar.f84214a == this.f84214a && Objects.equals(uVar.f84215b, this.f84215b) && uVar.f84216c == this.f84216c && uVar.f84217d == this.f84217d;
    }

    public final int hashCode() {
        return Objects.hash(u.class, Integer.valueOf(this.f84214a), this.f84215b, this.f84216c, this.f84217d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RSA SSA PKCS1 Parameters (variant: ");
        sb2.append(this.f84216c);
        sb2.append(", hashType: ");
        sb2.append(this.f84217d);
        sb2.append(", publicExponent: ");
        sb2.append(this.f84215b);
        sb2.append(", and ");
        return b.c0.o(sb2, this.f84214a, "-bit modulus)");
    }
}
