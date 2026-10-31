package y90;

/* loaded from: classes5.dex */
public final class n extends da0.a {

    /* renamed from: a, reason: collision with root package name */
    public final ba0.p f97084a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f97085b;

    /* renamed from: c, reason: collision with root package name */
    public int f97086c;

    public n(ba0.p pVar) {
        this.f97084a = pVar;
    }

    @Override // da0.a
    public final boolean b(ba0.a aVar) {
        if (!(aVar instanceof ba0.q)) {
            return false;
        }
        if (this.f97085b && this.f97086c == 1) {
            this.f97084a.f17780f = false;
            this.f97085b = false;
        }
        return true;
    }

    @Override // da0.a
    public final ba0.a e() {
        return this.f97084a;
    }

    @Override // da0.a
    public final boolean f() {
        return true;
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        if (gVar.f97038h) {
            this.f97085b = true;
            this.f97086c = 0;
        } else if (this.f97085b) {
            this.f97086c++;
        }
        return cf.c.a(gVar.f97032b);
    }
}
