package om;

/* loaded from: classes.dex */
public final class g implements i {

    /* renamed from: a, reason: collision with root package name */
    public final fi.j f80524a;

    public g(fi.j jVar) {
        this.f80524a = jVar;
    }

    @Override // om.i
    public final boolean a(Exception exc) {
        return false;
    }

    @Override // om.i
    public final boolean b(pm.b bVar) {
        int i5 = bVar.f82666b;
        if (i5 != 3 && !bVar.a() && i5 != 5) {
            return false;
        }
        this.f80524a.c(bVar.f82665a);
        return true;
    }
}
