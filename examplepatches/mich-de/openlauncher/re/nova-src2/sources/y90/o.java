package y90;

import ba0.t;

/* loaded from: classes5.dex */
public final class o extends da0.a {

    /* renamed from: a, reason: collision with root package name */
    public final ba0.q f97087a = new ba0.q();

    /* renamed from: b, reason: collision with root package name */
    public final int f97088b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97089c;

    public o(int i5) {
        this.f97088b = i5;
    }

    @Override // da0.a
    public final boolean b(ba0.a aVar) {
        if (!this.f97089c) {
            return true;
        }
        ba0.a aVar2 = (ba0.a) this.f97087a.f17781a;
        if (!(aVar2 instanceof ba0.p)) {
            return true;
        }
        ((ba0.p) aVar2).f17780f = false;
        return true;
    }

    @Override // da0.a
    public final ba0.a e() {
        return this.f97087a;
    }

    @Override // da0.a
    public final boolean f() {
        return true;
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        if (gVar.f97038h) {
            if (this.f97087a.f17782b == null) {
                return null;
            }
            ba0.a aVarE = gVar.h().e();
            this.f97089c = (aVarE instanceof t) || (aVarE instanceof ba0.q);
            return cf.c.a(gVar.f97035e);
        }
        int i5 = gVar.f97037g;
        int i11 = this.f97088b;
        if (i5 >= i11) {
            return new cf.c(-1, gVar.f97033c + i11, false);
        }
        return null;
    }
}
