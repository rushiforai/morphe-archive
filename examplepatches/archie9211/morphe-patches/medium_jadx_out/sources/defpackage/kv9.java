package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kv9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ UpsellInfo e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kv9(sw9 sw9Var, UpsellInfo upsellInfo, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = upsellInfo;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new kv9(this.d, this.e, this.f, n92Var, 0);
            default:
                return new kv9(this.d, this.e, this.f, n92Var, 1);
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
        return ((kv9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.f;
        UpsellInfo upsellInfo = this.e;
        sw9 sw9Var = this.d;
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
                sw9Var.p.e(upsellInfo, sw9Var.D0, str, sw9Var.d);
                r6c r6cVar = sw9Var.x0;
                zs9 zs9Var = new zs9(upsellInfo, str);
                this.c = 1;
                return r6cVar.a(zs9Var, this) == tb2Var ? tb2Var : c1eVar;
            default:
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
                r6c r6cVar2 = sw9Var.x0;
                zs9 zs9Var2 = new zs9(upsellInfo, str);
                this.c = 1;
                return r6cVar2.a(zs9Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
