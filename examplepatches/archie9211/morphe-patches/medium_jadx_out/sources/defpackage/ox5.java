package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ox5 {
    public static final ox5 o;
    public final ch4 a;
    public final ib2 b;
    public final ib2 c;
    public final ib2 d;
    public final j31 e;
    public final j31 f;
    public final j31 g;
    public final x45 h;
    public final x45 i;
    public final x45 j;
    public final lfc k;
    public final dqb l;
    public final ux9 m;
    public final r84 n;

    static {
        zkc zkcVar = zkc.s;
        ig6 ig6Var = ch4.a;
        r13 r13Var = xg3.a;
        vz2 vz2Var = vz2.c;
        j31 j31Var = j31.ENABLED;
        o = new ox5(ig6Var, zx3.a, vz2Var, vz2Var, j31Var, j31Var, j31Var, zkcVar, zkcVar, zkcVar, lfc.a, dqb.FIT, ux9.EXACT, r84.b);
    }

    public ox5(ch4 ch4Var, ib2 ib2Var, ib2 ib2Var2, ib2 ib2Var3, j31 j31Var, j31 j31Var2, j31 j31Var3, x45 x45Var, x45 x45Var2, x45 x45Var3, lfc lfcVar, dqb dqbVar, ux9 ux9Var, r84 r84Var) {
        this.a = ch4Var;
        this.b = ib2Var;
        this.c = ib2Var2;
        this.d = ib2Var3;
        this.e = j31Var;
        this.f = j31Var2;
        this.g = j31Var3;
        this.h = x45Var;
        this.i = x45Var2;
        this.j = x45Var3;
        this.k = lfcVar;
        this.l = dqbVar;
        this.m = ux9Var;
        this.n = r84Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ox5)) {
            return false;
        }
        ox5 ox5Var = (ox5) obj;
        return g76.L(this.a, ox5Var.a) && g76.L(this.b, ox5Var.b) && g76.L(this.c, ox5Var.c) && g76.L(this.d, ox5Var.d) && this.e == ox5Var.e && this.f == ox5Var.f && this.g == ox5Var.g && g76.L(this.h, ox5Var.h) && g76.L(this.i, ox5Var.i) && g76.L(this.j, ox5Var.j) && g76.L(this.k, ox5Var.k) && this.l == ox5Var.l && this.m == ox5Var.m && g76.L(this.n, ox5Var.n);
    }

    public final int hashCode() {
        return this.n.a.hashCode() + ((this.m.hashCode() + ((this.l.hashCode() + ((this.k.hashCode() + ((this.j.hashCode() + ((this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Defaults(fileSystem=" + this.a + ", interceptorCoroutineContext=" + this.b + ", fetcherCoroutineContext=" + this.c + ", decoderCoroutineContext=" + this.d + ", memoryCachePolicy=" + this.e + ", diskCachePolicy=" + this.f + ", networkCachePolicy=" + this.g + ", placeholderFactory=" + this.h + ", errorFactory=" + this.i + ", fallbackFactory=" + this.j + ", sizeResolver=" + this.k + ", scale=" + this.l + ", precision=" + this.m + ", extras=" + this.n + ')';
    }
}
