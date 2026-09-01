package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fjd implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CharSequence b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ long f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ jgd h;
    public final /* synthetic */ long i;
    public final /* synthetic */ int j;
    public final /* synthetic */ boolean k;
    public final /* synthetic */ int l;
    public final /* synthetic */ int m;
    public final /* synthetic */ x45 n;
    public final /* synthetic */ mkd o;
    public final /* synthetic */ int p;
    public final /* synthetic */ int q;
    public final /* synthetic */ int r;

    public /* synthetic */ fjd(String str, r28 r28Var, long j, long j2, long j3, ohd ohdVar, jgd jgdVar, long j4, int i, boolean z, int i2, int i3, x45 x45Var, mkd mkdVar, int i4, int i5, int i6, int i7) {
        this.a = i7;
        this.b = str;
        this.c = r28Var;
        this.d = j;
        this.e = j2;
        this.f = j3;
        this.g = ohdVar;
        this.h = jgdVar;
        this.i = j4;
        this.j = i;
        this.k = z;
        this.l = i2;
        this.m = i3;
        this.n = x45Var;
        this.o = mkdVar;
        this.p = i4;
        this.q = i5;
        this.r = i6;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.q;
        int i3 = this.p;
        Object obj3 = this.g;
        CharSequence charSequence = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i3 | 1);
                int iY2 = tr7.y(i2);
                jjd.b((String) charSequence, this.c, this.d, this.e, this.f, (ohd) obj3, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, (x12) obj, iY, iY2, this.r);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i3 | 1);
                int iY4 = tr7.y(i2);
                kjd.b((String) charSequence, this.c, this.d, this.e, this.f, (ohd) obj3, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, (x12) obj, iY3, iY4, this.r);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(i3 | 1);
                int iY6 = tr7.y(i2);
                jjd.c((mx) charSequence, this.c, this.d, this.e, this.f, this.h, this.i, this.j, this.k, this.l, this.m, (Map) obj3, this.n, this.o, (x12) obj, iY5, iY6, this.r);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fjd(mx mxVar, r28 r28Var, long j, long j2, long j3, jgd jgdVar, long j4, int i, boolean z, int i2, int i3, Map map, x45 x45Var, mkd mkdVar, int i4, int i5, int i6) {
        this.a = 2;
        this.b = mxVar;
        this.c = r28Var;
        this.d = j;
        this.e = j2;
        this.f = j3;
        this.h = jgdVar;
        this.i = j4;
        this.j = i;
        this.k = z;
        this.l = i2;
        this.m = i3;
        this.g = map;
        this.n = x45Var;
        this.o = mkdVar;
        this.p = i4;
        this.q = i5;
        this.r = i6;
    }
}
