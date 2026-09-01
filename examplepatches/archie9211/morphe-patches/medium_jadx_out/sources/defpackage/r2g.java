package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r2g extends t0g {
    public final int a;
    public final d1g b;

    public r2g(int i, d1g d1gVar) {
        this.a = i;
        this.b = d1gVar;
    }

    public static d2f b() {
        d2f d2fVar = new d2f(15);
        d2fVar.b = null;
        d2fVar.c = d1g.k;
        return d2fVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.b != d1g.k;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof r2g)) {
            return false;
        }
        r2g r2gVar = (r2g) obj;
        return r2gVar.a == this.a && r2gVar.b == this.b;
    }

    public final int hashCode() {
        return Objects.hash(r2g.class, Integer.valueOf(this.a), this.b);
    }

    public final String toString() {
        return ho2.C(this.a, "AesGcmSiv Parameters (variant: ", String.valueOf(this.b), ", ", "-byte key)");
    }
}
