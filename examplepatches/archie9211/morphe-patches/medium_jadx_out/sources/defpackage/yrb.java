package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yrb implements nsb {
    public static final mya j = new mya(new mpb(28), 3, new npb(29));
    public final h49 a;
    public float f;
    public final h49 b = new h49(0);
    public final h49 c = new h49(0);
    public final m68 d = new m68();
    public final h49 e = new h49(Integer.MAX_VALUE);
    public final v13 g = new v13(new eb8(27, this));
    public final j83 h = bjc.b(new hy3(this, 1));
    public final j83 i = bjc.b(new hy3(this, 2));

    public yrb(int i) {
        this.a = new h49(i);
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.g.a();
    }

    @Override // defpackage.nsb
    public final Object b(s78 s78Var, b55 b55Var, n92 n92Var) {
        Object objB = this.g.b(s78Var, b55Var, n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.i.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.h.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.g.e(f);
    }
}
