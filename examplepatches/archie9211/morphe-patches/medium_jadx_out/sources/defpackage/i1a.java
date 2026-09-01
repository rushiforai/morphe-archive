package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i1a {
    public final /* synthetic */ my6 a;
    public final /* synthetic */ q1a b;

    public i1a(my6 my6Var, q1a q1aVar) {
        this.a = my6Var;
        this.b = q1aVar;
    }

    public final void a(boolean z) {
        q1a q1aVar = this.b;
        Object value = q1aVar.i.a.getValue();
        n92 n92Var = null;
        k1a k1aVar = value instanceof k1a ? (k1a) value : null;
        if (k1aVar == null || k1aVar.e == z) {
            return;
        }
        vx0.c0(f76.F(q1aVar), null, null, new o1a(q1aVar, z, n92Var, 1), 3);
    }
}
