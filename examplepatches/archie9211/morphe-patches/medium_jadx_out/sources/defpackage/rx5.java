package defpackage;

import android.content.Context;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rx5 {
    public final Context a;
    public final Object b;
    public final rfd c;
    public final qx5 d;
    public final Map e;
    public final ch4 f;
    public final ib2 g;
    public final ib2 h;
    public final ib2 i;
    public final j31 j;
    public final j31 k;
    public final j31 l;
    public final cx7 m;
    public final x45 n;
    public final x45 o;
    public final x45 p;
    public final lfc q;
    public final dqb r;
    public final ux9 s;
    public final r84 t;
    public final px5 u;
    public final ox5 v;

    public rx5(Context context, Object obj, rfd rfdVar, qx5 qx5Var, Map map, ch4 ch4Var, ib2 ib2Var, ib2 ib2Var2, ib2 ib2Var3, j31 j31Var, j31 j31Var2, j31 j31Var3, cx7 cx7Var, x45 x45Var, x45 x45Var2, x45 x45Var3, lfc lfcVar, dqb dqbVar, ux9 ux9Var, r84 r84Var, px5 px5Var, ox5 ox5Var) {
        this.a = context;
        this.b = obj;
        this.c = rfdVar;
        this.d = qx5Var;
        this.e = map;
        this.f = ch4Var;
        this.g = ib2Var;
        this.h = ib2Var2;
        this.i = ib2Var3;
        this.j = j31Var;
        this.k = j31Var2;
        this.l = j31Var3;
        this.m = cx7Var;
        this.n = x45Var;
        this.o = x45Var2;
        this.p = x45Var3;
        this.q = lfcVar;
        this.r = dqbVar;
        this.s = ux9Var;
        this.t = r84Var;
        this.u = px5Var;
        this.v = ox5Var;
    }

    public static nx5 a(rx5 rx5Var) {
        Context context = rx5Var.a;
        rx5Var.getClass();
        return new nx5(rx5Var, context);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rx5)) {
            return false;
        }
        rx5 rx5Var = (rx5) obj;
        return g76.L(this.a, rx5Var.a) && this.b.equals(rx5Var.b) && g76.L(this.c, rx5Var.c) && g76.L(this.d, rx5Var.d) && this.e.equals(rx5Var.e) && g76.L(this.f, rx5Var.f) && g76.L(this.g, rx5Var.g) && g76.L(this.h, rx5Var.h) && g76.L(this.i, rx5Var.i) && this.j == rx5Var.j && this.k == rx5Var.k && this.l == rx5Var.l && g76.L(this.m, rx5Var.m) && g76.L(this.n, rx5Var.n) && g76.L(this.o, rx5Var.o) && g76.L(this.p, rx5Var.p) && g76.L(this.q, rx5Var.q) && this.r == rx5Var.r && this.s == rx5Var.s && this.t.equals(rx5Var.t) && this.u.equals(rx5Var.u) && g76.L(this.v, rx5Var.v);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        rfd rfdVar = this.c;
        int iHashCode2 = (iHashCode + (rfdVar == null ? 0 : rfdVar.hashCode())) * 31;
        qx5 qx5Var = this.d;
        int iHashCode3 = (this.l.hashCode() + ((this.k.hashCode() + ((this.j.hashCode() + ((this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((this.e.hashCode() + ((iHashCode2 + (qx5Var == null ? 0 : qx5Var.hashCode())) * 961)) * 961)) * 29791)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
        cx7 cx7Var = this.m;
        return this.v.hashCode() + ((this.u.hashCode() + ((this.t.a.hashCode() + ((this.s.hashCode() + ((this.r.hashCode() + ((this.q.hashCode() + ((this.p.hashCode() + ((this.o.hashCode() + ((this.n.hashCode() + ((iHashCode3 + (cx7Var != null ? cx7Var.hashCode() : 0)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ImageRequest(context=" + this.a + ", data=" + this.b + ", target=" + this.c + ", listener=" + this.d + ", memoryCacheKey=null, memoryCacheKeyExtras=" + this.e + ", diskCacheKey=null, fileSystem=" + this.f + ", fetcherFactory=null, decoderFactory=null, interceptorCoroutineContext=" + this.g + ", fetcherCoroutineContext=" + this.h + ", decoderCoroutineContext=" + this.i + ", memoryCachePolicy=" + this.j + ", diskCachePolicy=" + this.k + ", networkCachePolicy=" + this.l + ", placeholderMemoryCacheKey=" + this.m + ", placeholderFactory=" + this.n + ", errorFactory=" + this.o + ", fallbackFactory=" + this.p + ", sizeResolver=" + this.q + ", scale=" + this.r + ", precision=" + this.s + ", extras=" + this.t + ", defined=" + this.u + ", defaults=" + this.v + ')';
    }
}
