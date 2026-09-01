package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ebg extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ nig c;
    public final /* synthetic */ ntf d;
    public final /* synthetic */ long e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ebg(long j, n92 n92Var, ntf ntfVar, nig nigVar) {
        super(2, n92Var);
        this.c = nigVar;
        this.d = ntfVar;
        this.e = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        ebg ebgVar = new ebg(this.e, n92Var, this.d, this.c);
        ebgVar.b = obj;
        return ebgVar;
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        ebg ebgVar = (ebg) create((fdg) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        ebgVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        fdg fdgVar = (fdg) this.b;
        nig nigVar = this.c;
        ntf ntfVar = this.d;
        long j = this.e;
        synchronized (fdgVar) {
            try {
                o33 o33Var = (o33) nigVar.e;
                if (o33Var == null || o33Var.P()) {
                    nigVar.e = vx0.G((k92) ((uz5) nigVar.f).c, null, new j82(fdgVar, nigVar, ntfVar, j, (n92) null, 12), 3);
                    vx0.G((k92) ((uz5) nigVar.f).c, null, new t1g(nigVar, fdgVar, null, 8), 3);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return c1e.a;
    }
}
