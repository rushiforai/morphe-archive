package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v13 implements nsb {
    public final x45 a;
    public final u13 b = new u13(this);
    public final z78 c = new z78();
    public final k49 d;
    public final k49 e;
    public final k49 f;

    public v13(x45 x45Var) {
        this.a = x45Var;
        Boolean bool = Boolean.FALSE;
        this.d = qo7.u(bool);
        this.e = qo7.u(bool);
        this.f = qo7.u(bool);
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return ((Boolean) this.d.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final Object b(s78 s78Var, b55 b55Var, n92 n92Var) {
        Object objS = o7f.s(new ku2(this, s78Var, b55Var, null, 3), n92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return true;
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return true;
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return ((Number) this.a.invoke(Float.valueOf(f))).floatValue();
    }
}
