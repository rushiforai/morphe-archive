package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p1g extends t0g {
    public final int a;
    public final int b;
    public final int c;
    public final d1g d;

    public p1g(int i, int i2, int i3, d1g d1gVar) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = d1gVar;
    }

    public static o2b b() {
        o2b o2bVar = new o2b(25, false);
        o2bVar.b = null;
        o2bVar.c = null;
        o2bVar.d = null;
        o2bVar.e = d1g.h;
        return o2bVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.d != d1g.h;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof p1g)) {
            return false;
        }
        p1g p1gVar = (p1g) obj;
        return p1gVar.a == this.a && p1gVar.b == this.b && p1gVar.c == this.c && p1gVar.d == this.d;
    }

    public final int hashCode() {
        return Objects.hash(p1g.class, Integer.valueOf(this.a), Integer.valueOf(this.b), Integer.valueOf(this.c), this.d);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "AesEax Parameters (variant: ", String.valueOf(this.d), ", ", "-byte IV, ");
        sbT.append(this.c);
        sbT.append("-byte tag, and ");
        sbT.append(this.a);
        sbT.append("-byte key)");
        return sbT.toString();
    }
}
