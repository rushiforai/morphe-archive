package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class av6 extends b2 {
    public final yu6 c;
    public final yt6 d;
    public final long e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ yt6 g;
    public final /* synthetic */ int h;
    public final /* synthetic */ int i;
    public final /* synthetic */ wd j;
    public final /* synthetic */ zq0 k;
    public final /* synthetic */ int l;
    public final /* synthetic */ int m;
    public final /* synthetic */ long n;
    public final /* synthetic */ kv6 o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av6(long j, boolean z, yu6 yu6Var, yt6 yt6Var, int i, int i2, wd wdVar, zq0 zq0Var, int i3, int i4, long j2, kv6 kv6Var) {
        super(3);
        this.f = z;
        this.g = yt6Var;
        this.h = i;
        this.i = i2;
        this.j = wdVar;
        this.k = zq0Var;
        this.l = i3;
        this.m = i4;
        this.n = j2;
        this.o = kv6Var;
        this.c = yu6Var;
        this.d = yt6Var;
        this.e = h72.b(0, z ? f72.h(j) : Integer.MAX_VALUE, 0, z ? Integer.MAX_VALUE : f72.g(j), 5);
    }

    @Override // defpackage.b2
    public final zt6 m0(int i, int i2, int i3, long j) {
        return w0(i, j);
    }

    public final dv6 w0(int i, long j) {
        yu6 yu6Var = this.c;
        Object objC = yu6Var.c(i);
        Object objV = yu6Var.b.V(i);
        return new dv6(i, p0(this.d, i, j), this.f, this.j, this.k, this.g.b.getLayoutDirection(), this.l, this.m, i == this.h + (-1) ? 0 : this.i, this.n, objC, objV, this.o.o, j);
    }
}
