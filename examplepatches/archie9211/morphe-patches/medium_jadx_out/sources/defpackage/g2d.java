package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class g2d extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ j2d d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g2d(j2d j2dVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = j2dVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new g2d(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new g2d(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new g2d(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new g2d(this.d, this.e, this.f, n92Var, 3);
            default:
                return new g2d(this.d, this.e, this.f, n92Var, 4);
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
        return ((g2d) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        g2d g2dVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        j2d j2dVar = this.d;
        switch (i) {
            case 0:
                g2d g2dVar2 = this;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = g2dVar2.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = j2dVar.h;
                    String str = j2dVar.b;
                    String str2 = j2dVar.o;
                    g2dVar2.c = 1;
                    obj = n0cVar.I(g2dVar2, g2dVar2.f, g2dVar2.e, str, str2);
                    g2dVar2 = g2dVar2;
                    if (obj != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = j2dVar.w;
                v1d v1dVar = new v1d((oq1) obj);
                g2dVar2.c = 2;
                if (r6cVar.a(v1dVar, g2dVar2) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    mya myaVar = j2dVar.i;
                    String str3 = j2dVar.b;
                    String str4 = j2dVar.o;
                    this.c = 1;
                    obj = myaVar.p(this.e, str3, this.f, str4, this);
                    if (obj != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = j2dVar.w;
                w1d w1dVar = new w1d((x7d) obj);
                this.c = 2;
                if (r6cVar2.a(w1dVar, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    mya myaVar2 = j2dVar.i;
                    String str5 = j2dVar.b;
                    String str6 = j2dVar.o;
                    this.c = 1;
                    obj = myaVar2.K(this.e, str5, this.f, str6, this);
                    if (obj != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = j2dVar.w;
                w1d w1dVar2 = new w1d((a8d) obj);
                this.c = 2;
                if (r6cVar3.a(w1dVar2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = j2dVar.h;
                    String str7 = j2dVar.b;
                    String str8 = j2dVar.o;
                    this.c = 1;
                    obj = n0cVar2.k0(this.e, str7, this.f, str8, this);
                    if (obj != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i5 != 1) {
                    if (i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar4 = j2dVar.w;
                v1d v1dVar2 = new v1d((xq1) obj);
                this.c = 2;
                if (r6cVar4.a(v1dVar2, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    kbe kbeVar = j2dVar.j;
                    String str9 = j2dVar.b;
                    String str10 = j2dVar.o;
                    this.c = 1;
                    obj = kbeVar.h(this, this.f, this.e, str9, str10);
                    g2dVar = this;
                    if (obj != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                g2dVar = this;
                r6c r6cVar5 = j2dVar.w;
                x1d x1dVar = new x1d((b8e) obj);
                g2dVar.c = 2;
                if (r6cVar5.a(x1dVar, g2dVar) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
        }
    }
}
