package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class px5 {
    public final ib2 a;
    public final ib2 b;
    public final ib2 c;
    public final j31 d;
    public final j31 e;
    public final x45 f;
    public final x45 g;
    public final x45 h;
    public final lfc i;
    public final dqb j;
    public final ux9 k;

    public px5(ib2 ib2Var, ib2 ib2Var2, ib2 ib2Var3, j31 j31Var, j31 j31Var2, x45 x45Var, x45 x45Var2, x45 x45Var3, lfc lfcVar, dqb dqbVar, ux9 ux9Var) {
        this.a = ib2Var;
        this.b = ib2Var2;
        this.c = ib2Var3;
        this.d = j31Var;
        this.e = j31Var2;
        this.f = x45Var;
        this.g = x45Var2;
        this.h = x45Var3;
        this.i = lfcVar;
        this.j = dqbVar;
        this.k = ux9Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof px5)) {
            return false;
        }
        px5 px5Var = (px5) obj;
        return g76.L(this.a, px5Var.a) && g76.L(this.b, px5Var.b) && g76.L(this.c, px5Var.c) && this.d == px5Var.d && this.e == px5Var.e && this.f.equals(px5Var.f) && this.g.equals(px5Var.g) && this.h.equals(px5Var.h) && g76.L(this.i, px5Var.i) && this.j == px5Var.j && this.k == px5Var.k;
    }

    public final int hashCode() {
        ib2 ib2Var = this.a;
        int iHashCode = (ib2Var == null ? 0 : ib2Var.hashCode()) * 31;
        ib2 ib2Var2 = this.b;
        int iHashCode2 = (iHashCode + (ib2Var2 == null ? 0 : ib2Var2.hashCode())) * 31;
        ib2 ib2Var3 = this.c;
        int iHashCode3 = (iHashCode2 + (ib2Var3 == null ? 0 : ib2Var3.hashCode())) * 31;
        j31 j31Var = this.d;
        int iHashCode4 = (iHashCode3 + (j31Var == null ? 0 : j31Var.hashCode())) * 31;
        j31 j31Var2 = this.e;
        int iHashCode5 = (this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((iHashCode4 + (j31Var2 == null ? 0 : j31Var2.hashCode())) * 961)) * 31)) * 31)) * 31;
        lfc lfcVar = this.i;
        int iHashCode6 = (iHashCode5 + (lfcVar == null ? 0 : lfcVar.hashCode())) * 31;
        dqb dqbVar = this.j;
        int iHashCode7 = (iHashCode6 + (dqbVar == null ? 0 : dqbVar.hashCode())) * 31;
        ux9 ux9Var = this.k;
        return iHashCode7 + (ux9Var != null ? ux9Var.hashCode() : 0);
    }

    public final String toString() {
        return "Defined(fileSystem=null, interceptorCoroutineContext=" + this.a + ", fetcherCoroutineContext=" + this.b + ", decoderCoroutineContext=" + this.c + ", memoryCachePolicy=" + this.d + ", diskCachePolicy=" + this.e + ", networkCachePolicy=null, placeholderFactory=" + this.f + ", errorFactory=" + this.g + ", fallbackFactory=" + this.h + ", sizeResolver=" + this.i + ", scale=" + this.j + ", precision=" + this.k + ')';
    }
}
