package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class k extends c {

    /* renamed from: a, reason: collision with root package name */
    public final int f55364a;

    /* renamed from: b, reason: collision with root package name */
    public final int f55365b;

    /* renamed from: c, reason: collision with root package name */
    public final int f55366c;

    /* renamed from: d, reason: collision with root package name */
    public final int f55367d;

    /* renamed from: e, reason: collision with root package name */
    public final j f55368e;

    /* renamed from: f, reason: collision with root package name */
    public final j f55369f;

    public k(int i5, int i11, int i12, int i13, j jVar, j jVar2) {
        this.f55364a = i5;
        this.f55365b = i11;
        this.f55366c = i12;
        this.f55367d = i13;
        this.f55368e = jVar;
        this.f55369f = jVar2;
    }

    public static bm.t b() {
        bm.t tVar = new bm.t();
        tVar.f18110b = null;
        tVar.f18111c = null;
        tVar.f18112d = null;
        tVar.f18113e = null;
        tVar.f18114f = null;
        tVar.f18115g = j.f55343j;
        return tVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55368e != j.f55343j;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return kVar.f55364a == this.f55364a && kVar.f55365b == this.f55365b && kVar.f55366c == this.f55366c && kVar.f55367d == this.f55367d && kVar.f55368e == this.f55368e && kVar.f55369f == this.f55369f;
    }

    public final int hashCode() {
        return Objects.hash(k.class, Integer.valueOf(this.f55364a), Integer.valueOf(this.f55365b), Integer.valueOf(this.f55366c), Integer.valueOf(this.f55367d), this.f55368e, this.f55369f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AesCtrHmacAead Parameters (variant: ");
        sb2.append(this.f55368e);
        sb2.append(", hashType: ");
        sb2.append(this.f55369f);
        sb2.append(", ");
        sb2.append(this.f55366c);
        sb2.append("-byte IV, and ");
        sb2.append(this.f55367d);
        sb2.append("-byte tags, and ");
        sb2.append(this.f55364a);
        sb2.append("-byte AES key, and ");
        return b.c0.o(sb2, this.f55365b, "-byte HMAC key)");
    }
}
