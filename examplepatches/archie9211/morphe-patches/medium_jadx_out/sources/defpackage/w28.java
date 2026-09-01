package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w28 extends uib implements b55 {
    public enc c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ sb2 f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ m45 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w28(sb2 sb2Var, boolean z, m45 m45Var, n92 n92Var) {
        super(2, n92Var);
        this.f = sb2Var;
        this.g = z;
        this.h = m45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        w28 w28Var = new w28(this.f, this.g, this.h, n92Var);
        w28Var.e = obj;
        return w28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((w28) create((u4d) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        enc encVar;
        u4d u4dVar = (u4d) this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.d;
        n92 n92Var = null;
        if (i == 0) {
            br7.v(obj);
            this.e = u4dVar;
            this.d = 1;
            obj = qfd.b(u4dVar, null, this, 2);
            if (obj != tb2Var) {
            }
            return tb2Var;
        }
        if (i != 1) {
            if (i != 2) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            encVar = this.c;
            br7.v(obj);
            encVar.m(null);
            return c1e.a;
        }
        br7.v(obj);
        enc encVarC0 = vx0.c0(this.f, null, null, new lj1(this.g, (rb9) obj, this.h, n92Var, 5), 3);
        this.e = null;
        this.c = encVarC0;
        this.d = 2;
        if (qfd.i(u4dVar, mb9.Main, this) != tb2Var) {
            encVar = encVarC0;
            encVar.m(null);
            return c1e.a;
        }
        return tb2Var;
    }
}
