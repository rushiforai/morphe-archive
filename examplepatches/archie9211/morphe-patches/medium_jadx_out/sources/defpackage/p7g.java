package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p7g implements d8g {
    public final d3g a;
    public final e9g b;

    public p7g(e9g e9gVar, d3g d3gVar) {
        wz7 wz7Var = j4g.a;
        this.b = e9gVar;
        this.a = d3gVar;
    }

    @Override // defpackage.d8g
    public final boolean a(Object obj) {
        throw y30.k(obj);
    }

    @Override // defpackage.d8g
    public final void b(Object obj) {
        this.b.getClass();
        c9g c9gVar = ((h5g) obj).zzc;
        if (c9gVar.e) {
            c9gVar.e = false;
        }
        wz7 wz7Var = j4g.a;
        throw y30.k(obj);
    }

    @Override // defpackage.d8g
    public final void c(Object obj, byte[] bArr, int i, int i2, hmf hmfVar) {
        h5g h5gVar = (h5g) obj;
        if (h5gVar.zzc == c9g.f) {
            h5gVar.zzc = c9g.b();
        }
        throw y30.k(obj);
    }

    @Override // defpackage.d8g
    public final int d(h5g h5gVar) {
        return h5gVar.zzc.hashCode();
    }

    @Override // defpackage.d8g
    public final void e(Object obj, Object obj2) {
        f8g.o(obj, obj2);
    }

    @Override // defpackage.d8g
    public final void f(Object obj, ujf ujfVar) {
        throw y30.k(obj);
    }

    @Override // defpackage.d8g
    public final h5g g() {
        d3g d3gVar = this.a;
        if (d3gVar instanceof h5g) {
            return ((h5g) d3gVar).n();
        }
        y4g y4gVar = (y4g) ((h5g) d3gVar).j(5);
        boolean zH = y4gVar.b.h();
        h5g h5gVar = y4gVar.b;
        if (!zH) {
            return h5gVar;
        }
        h5gVar.getClass();
        w7g.c.a(h5gVar.getClass()).b(h5gVar);
        h5gVar.e();
        return y4gVar.b;
    }

    @Override // defpackage.d8g
    public final boolean h(h5g h5gVar, h5g h5gVar2) {
        return h5gVar.zzc.equals(h5gVar2.zzc);
    }

    @Override // defpackage.d8g
    public final int i(d3g d3gVar) {
        c9g c9gVar = ((h5g) d3gVar).zzc;
        int i = c9gVar.d;
        if (i != -1) {
            return i;
        }
        int iC = 0;
        for (int i2 = 0; i2 < c9gVar.a; i2++) {
            int i3 = c9gVar.b[i2] >>> 3;
            t3g t3gVar = (t3g) c9gVar.c[i2];
            int iP = c4g.p(8);
            int iP2 = c4g.p(i3) + c4g.p(16);
            int iP3 = c4g.p(24);
            int iF = t3gVar.f();
            iC += iP + iP + iP2 + wgd.C(iF, iF, iP3);
        }
        c9gVar.d = iC;
        return iC;
    }
}
