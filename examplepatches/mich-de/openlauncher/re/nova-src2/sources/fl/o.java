package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class o extends c {

    /* renamed from: a, reason: collision with root package name */
    public final int f55394a;

    /* renamed from: b, reason: collision with root package name */
    public final int f55395b;

    /* renamed from: c, reason: collision with root package name */
    public final int f55396c;

    /* renamed from: d, reason: collision with root package name */
    public final j f55397d;

    public o(int i5, int i11, int i12, j jVar) {
        this.f55394a = i5;
        this.f55395b = i11;
        this.f55396c = i12;
        this.f55397d = jVar;
    }

    public static x7.n b() {
        x7.n nVar = new x7.n();
        nVar.f95149a = null;
        nVar.f95150b = null;
        nVar.f95151c = null;
        nVar.f95152d = j.f55346m;
        return nVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55397d != j.f55346m;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return oVar.f55394a == this.f55394a && oVar.f55395b == this.f55395b && oVar.f55396c == this.f55396c && oVar.f55397d == this.f55397d;
    }

    public final int hashCode() {
        return Objects.hash(o.class, Integer.valueOf(this.f55394a), Integer.valueOf(this.f55395b), Integer.valueOf(this.f55396c), this.f55397d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AesEax Parameters (variant: ");
        sb2.append(this.f55397d);
        sb2.append(", ");
        sb2.append(this.f55395b);
        sb2.append("-byte IV, ");
        sb2.append(this.f55396c);
        sb2.append("-byte tag, and ");
        return b.c0.o(sb2, this.f55394a, "-byte key)");
    }
}
