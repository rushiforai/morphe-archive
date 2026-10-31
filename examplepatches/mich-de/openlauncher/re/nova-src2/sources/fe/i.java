package fe;

/* loaded from: classes3.dex */
public final class i implements wf.i {

    /* renamed from: a, reason: collision with root package name */
    public final ai.w0 f54834a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f54835b;

    /* renamed from: c, reason: collision with root package name */
    public c f54836c;

    /* renamed from: d, reason: collision with root package name */
    public wf.i f54837d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f54838e = true;

    /* renamed from: f, reason: collision with root package name */
    public boolean f54839f;

    public i(h0 h0Var, wf.q qVar) {
        this.f54835b = h0Var;
        this.f54834a = new ai.w0(qVar);
    }

    @Override // wf.i
    public final void a(g1 g1Var) {
        wf.i iVar = this.f54837d;
        if (iVar != null) {
            iVar.a(g1Var);
            g1Var = this.f54837d.c();
        }
        this.f54834a.a(g1Var);
    }

    @Override // wf.i
    public final g1 c() {
        wf.i iVar = this.f54837d;
        return iVar != null ? iVar.c() : (g1) this.f54834a.f13390e;
    }

    @Override // wf.i
    public final long d() {
        if (this.f54838e) {
            return this.f54834a.d();
        }
        wf.i iVar = this.f54837d;
        iVar.getClass();
        return iVar.d();
    }
}
