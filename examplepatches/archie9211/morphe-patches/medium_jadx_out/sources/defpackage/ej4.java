package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ej4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ fj4 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ String g;
    public final /* synthetic */ SourceParameter h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ej4(fj4 fj4Var, String str, String str2, String str3, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = fj4Var;
        this.e = str;
        this.f = str2;
        this.g = str3;
        this.h = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new ej4(this.d, this.e, this.f, this.g, this.h, n92Var, 0);
            default:
                return new ej4(this.d, this.e, this.f, this.g, this.h, n92Var, 1);
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
        return ((ej4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ej4 ej4Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        fj4 fj4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    kbe kbeVar = fj4Var.g;
                    this.c = 1;
                    obj = kbeVar.d(this, this.h, this.e, this.f, this.g);
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
                r6c r6cVar = fj4Var.w;
                li4 li4Var = new li4((g8e) obj);
                this.c = 2;
                if (r6cVar.a(li4Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kbe kbeVar2 = fj4Var.g;
                    this.c = 1;
                    obj = kbeVar2.i(this, this.h, this.e, this.f, this.g);
                    ej4Var = this;
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
                ej4Var = this;
                r6c r6cVar2 = fj4Var.w;
                li4 li4Var2 = new li4((g8e) obj);
                ej4Var.c = 2;
                if (r6cVar2.a(li4Var2, ej4Var) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
