package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v7c {
    public final boolean a;
    public final x45 b;
    public final boolean c;
    public tj4 d;
    public final tl e;
    public tj4 f;
    public tj4 g;

    public v7c(boolean z, m45 m45Var, m45 m45Var2, w7c w7cVar, x45 x45Var, boolean z2) {
        this.a = z;
        this.b = x45Var;
        this.c = z2;
        if (z && w7cVar == w7c.PartiallyExpanded) {
            ay0.e("The initial value must not be set to PartiallyExpanded if skipPartiallyExpanded is set to true.");
            throw null;
        }
        if (z2 && w7cVar == w7c.Hidden) {
            ay0.e("The initial value must not be set to Hidden if skipHiddenState is set to true.");
            throw null;
        }
        this.d = s7c.a;
        this.e = new tl(w7cVar, new r00(9, m45Var), m45Var2, new d9a(this, 1), x45Var);
        this.f = new nic();
        this.g = new nic();
    }

    public static Object a(v7c v7cVar, w7c w7cVar, tj4 tj4Var, n92 n92Var) {
        Object objB = v7cVar.e.b(w7cVar, s78.Default, new u7c(v7cVar, ((g49) v7cVar.e.l).g(), tj4Var, null), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    public final Object b(p4d p4dVar) {
        Object objA;
        w7c w7cVar = w7c.Expanded;
        return (((Boolean) this.b.invoke(w7cVar)).booleanValue() && (objA = a(this, w7cVar, this.f, p4dVar)) == tb2.COROUTINE_SUSPENDED) ? objA : c1e.a;
    }

    public final w7c c() {
        return (w7c) ((k49) this.e.g).getValue();
    }

    public final Object d(n92 n92Var) {
        Object objA;
        if (this.c) {
            ygf.f("Attempted to animate to hidden when skipHiddenState was enabled. Set skipHiddenState to false to use this function.");
            return null;
        }
        w7c w7cVar = w7c.Hidden;
        return (((Boolean) this.b.invoke(w7cVar)).booleanValue() && (objA = a(this, w7cVar, this.g, n92Var)) == tb2.COROUTINE_SUSPENDED) ? objA : c1e.a;
    }

    public final boolean e() {
        return ((k49) this.e.g).getValue() != w7c.Hidden;
    }

    public final Object f(p4d p4dVar) {
        Object objA;
        if (this.a) {
            ygf.f("Attempted to animate to partial expanded when skipPartiallyExpanded was enabled. Set skipPartiallyExpanded to false to use this function.");
            return null;
        }
        w7c w7cVar = w7c.PartiallyExpanded;
        return (((Boolean) this.b.invoke(w7cVar)).booleanValue() && (objA = a(this, w7cVar, this.g, p4dVar)) == tb2.COROUTINE_SUSPENDED) ? objA : c1e.a;
    }

    public final Object g(p4d p4dVar) {
        Object objA;
        gh7 gh7VarG = this.e.g();
        w7c w7cVar = w7c.PartiallyExpanded;
        if (!gh7VarG.a.containsKey(w7cVar)) {
            w7cVar = w7c.Expanded;
        }
        return (((Boolean) this.b.invoke(w7cVar)).booleanValue() && (objA = a(this, w7cVar, this.f, p4dVar)) == tb2.COROUTINE_SUSPENDED) ? objA : c1e.a;
    }
}
