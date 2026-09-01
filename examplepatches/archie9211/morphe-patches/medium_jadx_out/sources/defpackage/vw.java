package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vw {
    public final hud a;
    public final Object b;
    public final long c;
    public final m45 d;
    public final k49 e;
    public dx f;
    public long g;
    public long h = Long.MIN_VALUE;
    public final k49 i = qo7.u(Boolean.TRUE);

    public vw(Object obj, hud hudVar, dx dxVar, long j, Object obj2, long j2, m45 m45Var) {
        this.a = hudVar;
        this.b = obj2;
        this.c = j2;
        this.d = m45Var;
        this.e = qo7.u(obj);
        this.f = nk7.m0(dxVar);
        this.g = j;
    }

    public final void a() {
        this.i.setValue(Boolean.FALSE);
        this.d.invoke();
    }

    public final Object b() {
        return this.a.b.invoke(this.f);
    }
}
