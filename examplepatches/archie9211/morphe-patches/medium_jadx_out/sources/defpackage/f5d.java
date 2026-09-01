package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f5d extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ ou d;
    public final /* synthetic */ float e;
    public final /* synthetic */ ou f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f5d(ou ouVar, float f, ou ouVar2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ouVar;
        this.e = f;
        this.f = ouVar2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                f5d f5dVar = new f5d(this.d, this.e, this.f, n92Var, 0);
                f5dVar.c = obj;
                return f5dVar;
            case 1:
                f5d f5dVar2 = new f5d(this.d, this.e, this.f, n92Var, 1);
                f5dVar2.c = obj;
                return f5dVar2;
            default:
                f5d f5dVar3 = new f5d(this.d, this.e, this.f, n92Var, 2);
                f5dVar3.c = obj;
                return f5dVar3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((f5d) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        ou ouVar = this.f;
        float f = this.e;
        ou ouVar2 = this.d;
        n92 n92Var = null;
        int i2 = 3;
        sb2 sb2Var = (sb2) this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new e5d(ouVar2, f, n92Var, 0), 3);
                return vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, i2), 3);
            case 1:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new e5d(ouVar2, f, n92Var, 1), 3);
                return vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, 4), 3);
            default:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new e5d(ouVar2, f, n92Var, 2), 3);
                return vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, 5), 3);
        }
    }
}
