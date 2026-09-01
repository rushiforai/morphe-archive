package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lfd extends uib implements b55 {
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ sb2 e;
    public final /* synthetic */ f0a f;
    public final /* synthetic */ x45 g;
    public final /* synthetic */ x45 h;
    public final /* synthetic */ c55 i;
    public final /* synthetic */ x45 j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lfd(sb2 sb2Var, f0a f0aVar, x45 x45Var, x45 x45Var2, c55 c55Var, x45 x45Var3, n92 n92Var) {
        super(2, n92Var);
        this.e = sb2Var;
        this.f = f0aVar;
        this.g = x45Var;
        this.h = x45Var2;
        this.i = c55Var;
        this.j = x45Var3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        lfd lfdVar = new lfd(this.e, this.f, this.g, this.h, this.i, this.j, n92Var);
        lfdVar.d = obj;
        return lfdVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((lfd) create((u4d) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            u4d u4dVar = (u4d) this.d;
            this.c = 1;
            if (qfd.g(u4dVar, this.e, this.f, this.g, this.h, this.i, this.j, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
