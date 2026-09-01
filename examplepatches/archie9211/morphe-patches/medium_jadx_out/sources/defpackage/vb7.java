package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vb7 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bc7 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ boolean h;
    public final /* synthetic */ n4b i;
    public final /* synthetic */ boolean j;
    public final /* synthetic */ xd k;
    public final /* synthetic */ w82 l;
    public final /* synthetic */ boolean m;
    public final /* synthetic */ boolean n;
    public final /* synthetic */ Map o;
    public final /* synthetic */ t90 p;
    public final /* synthetic */ boolean q;
    public final /* synthetic */ int r;
    public final /* synthetic */ int s;
    public final /* synthetic */ int t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vb7(bc7 bc7Var, m45 m45Var, r28 r28Var, boolean z, boolean z2, boolean z3, boolean z4, n4b n4bVar, boolean z5, xd xdVar, w82 w82Var, boolean z6, boolean z7, Map map, t90 t90Var, boolean z8, int i, int i2, int i3, int i4) {
        super(2);
        this.a = i4;
        this.b = bc7Var;
        this.c = m45Var;
        this.d = r28Var;
        this.e = z;
        this.f = z2;
        this.g = z3;
        this.h = z4;
        this.i = n4bVar;
        this.j = z5;
        this.k = xdVar;
        this.l = w82Var;
        this.m = z6;
        this.n = z7;
        this.o = map;
        this.p = t90Var;
        this.q = z8;
        this.r = i;
        this.s = i2;
        this.t = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.s;
        int i3 = this.r;
        switch (i) {
            case 0:
                ((Number) obj2).intValue();
                int iY = tr7.y(i3 | 1);
                int iY2 = tr7.y(i2);
                int i4 = this.t;
                nk7.z(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, (x12) obj, iY, iY2, i4);
                break;
            default:
                ((Number) obj2).intValue();
                int iY3 = tr7.y(i3 | 1);
                int iY4 = tr7.y(i2);
                int i5 = this.t;
                nk7.z(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, (x12) obj, iY3, iY4, i5);
                break;
        }
        return c1eVar;
    }
}
