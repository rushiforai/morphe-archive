package fe;

/* loaded from: classes3.dex */
public final /* synthetic */ class q implements wf.f, wf.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ a0 f54963a;

    public /* synthetic */ q(a0 a0Var) {
        this.f54963a = a0Var;
    }

    @Override // wf.f
    public void f(Object obj, wf.d dVar) {
        ((j1) obj).onEvents(this.f54963a.f54682f, new i1(dVar));
    }

    @Override // wf.e
    public void invoke(Object obj) {
        ((j1) obj).onAvailableCommandsChanged(this.f54963a.O);
    }
}
