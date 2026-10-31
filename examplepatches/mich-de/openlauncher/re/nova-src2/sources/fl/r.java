package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class r extends c {

    /* renamed from: a, reason: collision with root package name */
    public final int f55408a;

    /* renamed from: b, reason: collision with root package name */
    public final int f55409b;

    /* renamed from: c, reason: collision with root package name */
    public final int f55410c;

    /* renamed from: d, reason: collision with root package name */
    public final j f55411d;

    public r(int i5, int i11, int i12, j jVar) {
        this.f55408a = i5;
        this.f55409b = i11;
        this.f55410c = i12;
        this.f55411d = jVar;
    }

    public static x7.h b() {
        x7.h hVar = new x7.h(6, false);
        hVar.f95137b = null;
        hVar.f95138c = null;
        hVar.f95139d = null;
        hVar.f95140e = j.f55347p;
        return hVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55411d != j.f55347p;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return rVar.f55408a == this.f55408a && rVar.f55409b == this.f55409b && rVar.f55410c == this.f55410c && rVar.f55411d == this.f55411d;
    }

    public final int hashCode() {
        return Objects.hash(r.class, Integer.valueOf(this.f55408a), Integer.valueOf(this.f55409b), Integer.valueOf(this.f55410c), this.f55411d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AesGcm Parameters (variant: ");
        sb2.append(this.f55411d);
        sb2.append(", ");
        sb2.append(this.f55409b);
        sb2.append("-byte IV, ");
        sb2.append(this.f55410c);
        sb2.append("-byte tag, and ");
        return b.c0.o(sb2, this.f55408a, "-byte key)");
    }
}
