package om;

/* loaded from: classes.dex */
public final class f implements i {

    /* renamed from: a, reason: collision with root package name */
    public final j f80522a;

    /* renamed from: b, reason: collision with root package name */
    public final fi.j f80523b;

    public f(j jVar, fi.j jVar2) {
        this.f80522a = jVar;
        this.f80523b = jVar2;
    }

    @Override // om.i
    public final boolean a(Exception exc) {
        this.f80523b.b(exc);
        return true;
    }

    @Override // om.i
    public final boolean b(pm.b bVar) {
        if (!bVar.a() || this.f80522a.a(bVar)) {
            return false;
        }
        a aVarA = b.a();
        aVarA.b(bVar.f82667c);
        aVarA.d(bVar.f82669e);
        aVarA.c(bVar.f82670f);
        this.f80523b.a(aVarA.a());
        return true;
    }
}
