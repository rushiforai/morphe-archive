package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class js6 extends xx8 {
    public static final /* synthetic */ fj6[] n;
    public final a1b h;
    public final n0c i;
    public final u67 j;
    public final of6 k;
    public final p67 l;
    public final ly m;

    static {
        u4a u4aVar = new u4a(js6.class, "binaryClasses", "getBinaryClasses$descriptors_jvm()Ljava/util/Map;", 0);
        s1b s1bVar = n1b.a;
        n = new fj6[]{s1bVar.g(u4aVar), km4.t(js6.class, "partToFacade", "getPartToFacade()Ljava/util/HashMap;", 0, s1bVar)};
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public js6(n0c n0cVar, a1b a1bVar) {
        k96 k96Var = (k96) n0cVar.b;
        super(k96Var.h, a1bVar.a);
        this.h = a1bVar;
        n0c n0cVarX = vv2.x(n0cVar, this, null, 6);
        this.i = n0cVarX;
        k96Var.d.c().c.getClass();
        zz7 zz7Var = zz7.g;
        k96 k96Var2 = (k96) n0cVarX.b;
        x67 x67Var = k96Var2.a;
        this.j = new u67(x67Var, new hs6(this, 0));
        this.k = new of6(n0cVarX, a1bVar, this);
        this.l = new p67(x67Var, new hs6(this, 1));
        this.m = k96Var2.m.b ? cd7.e : k50.h0(n0cVarX, a1bVar);
        x67Var.a(new hs6(this, 2));
    }

    @Override // defpackage.wx8
    public final ev7 H() {
        return this.k;
    }

    @Override // defpackage.xx8, defpackage.bw2, defpackage.aw2
    public final jkc d() {
        return new rz2(27, this);
    }

    @Override // defpackage.b2, defpackage.gx
    public final ly getAnnotations() {
        return this.m;
    }

    @Override // defpackage.xx8, defpackage.zv2, defpackage.b2
    public final String toString() {
        return "Lazy Java package fragment: " + this.f + " of module " + ((k96) this.i.b).h;
    }
}
