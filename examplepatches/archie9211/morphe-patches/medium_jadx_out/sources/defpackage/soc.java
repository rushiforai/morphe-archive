package defpackage;

import gen.model.SourceParameter;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class soc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ uoc d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ soc(uoc uocVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = uocVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new soc(this.d, this.e, this.f, n92Var, 0);
            default:
                return new soc(this.d, this.e, this.f, n92Var, 1);
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
        return ((soc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        uoc uocVar = this.d;
        String str = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = uocVar.f;
                    String str2 = uocVar.c;
                    String str3 = uocVar.n;
                    this.c = 1;
                    if (n0cVar.I(this, this.f, this.e, str2, str3) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                uocVar.l.a(uocVar.b, str);
                uocVar.m.d("dismissed_entity_ids", qo7.w((Set) uocVar.q.a.getValue(), str));
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kbe kbeVar = uocVar.g;
                    String str4 = uocVar.c;
                    String str5 = uocVar.n;
                    this.c = 1;
                    if (kbeVar.b(this.e, str4, this.f, str5, this) == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                uocVar.l.a(uocVar.b, str);
                uocVar.m.d("dismissed_entity_ids", qo7.w((Set) uocVar.q.a.getValue(), str));
                break;
        }
        return c1eVar;
    }
}
