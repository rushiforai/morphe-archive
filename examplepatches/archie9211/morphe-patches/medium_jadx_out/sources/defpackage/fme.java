package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fme extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ime d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fme(ime imeVar, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = imeVar;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        ime imeVar = this.d;
        switch (i) {
            case 0:
                return new fme(imeVar, str, n92Var, 0);
            case 1:
                return new fme(imeVar, str, n92Var, 1);
            default:
                return new fme(imeVar, str, n92Var, 2);
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
        return ((fme) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        int i = this.b;
        String str = this.e;
        c1e c1eVar = c1e.a;
        ime imeVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = imeVar.n;
                nle nleVar = new nle(new v53(str));
                this.c = 1;
                xpcVar.a(nleVar, this);
                return c1eVar == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar2 = imeVar.n;
                ole oleVar = new ole(new j4b(str));
                this.c = 1;
                xpcVar2.a(oleVar, this);
                return c1eVar == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                r6c r6cVar = imeVar.l;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    a1a a1aVar = imeVar.g;
                    g08 g08Var = imeVar.r;
                    this.c = 1;
                    objC = a1aVar.C(this.e, "", null, g08Var, this);
                    if (objC != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2 || i4 == 3 || i4 == 4) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objC = obj;
                c9b c9bVar = (c9b) objC;
                if (c9bVar instanceof b9b) {
                    this.c = 2;
                    if (r6cVar.a(tle.a, this) != tb2Var3) {
                        return c1eVar;
                    }
                } else if (c9bVar instanceof a9b) {
                    this.c = 3;
                    if (r6cVar.a(sle.a, this) != tb2Var3) {
                        return c1eVar;
                    }
                } else {
                    if (!(c9bVar instanceof z8b)) {
                        ygf.a();
                        return null;
                    }
                    rle rleVar = new rle(m4.I(((z8b) c9bVar).a));
                    this.c = 4;
                    if (r6cVar.a(rleVar, this) != tb2Var3) {
                        return c1eVar;
                    }
                }
                return tb2Var3;
        }
    }
}
