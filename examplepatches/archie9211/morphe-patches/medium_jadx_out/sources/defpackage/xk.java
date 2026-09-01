package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xk extends p4d implements d55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public /* synthetic */ Object d;
    public /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xk(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        jc4 jc4Var;
        jc4 gc4Var;
        switch (this.b) {
            case 0:
                br7.v(obj);
                pl plVar = (pl) this.d;
                float fC = ((ry2) this.e).c(this.c);
                if (!Float.isNaN(fC)) {
                    plVar.a(fC, 0.0f);
                }
                return c1e.a;
            default:
                Object obj2 = this.c;
                ec4 ec4Var = (ec4) this.d;
                qz8 qz8Var = (qz8) this.e;
                br7.v(obj);
                if (bjb.b(obj2) != null) {
                    return lc4.a;
                }
                tb4 tb4Var = (tb4) obj2;
                jda jdaVar = tb4Var.c;
                String str = tb4Var.b;
                int i = jdaVar.a;
                int i2 = jdaVar.b;
                boolean z = i == i2;
                long j = jdaVar.d;
                Long l = jdaVar.c;
                if (qz8Var instanceof nz8) {
                    jc4Var = fc4.a;
                } else if (qz8Var instanceof oz8) {
                    oz8 oz8Var = (oz8) qz8Var;
                    List list = oz8Var.a;
                    if (!list.isEmpty()) {
                        gc4Var = new gc4(bo.f0(list), oz8Var.c);
                        return new kc4(str, i, i2, z, j, l, ec4Var, gc4Var);
                    }
                    jc4Var = ic4.a;
                } else {
                    if (!g76.L(qz8Var, pz8.a)) {
                        ygf.a();
                        return null;
                    }
                    jc4Var = hc4.a;
                }
                gc4Var = jc4Var;
                return new kc4(str, i, i2, z, j, l, ec4Var, gc4Var);
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 4;
        switch (i) {
            case 0:
                xk xkVar = new xk(i2, 0, (n92) obj4);
                xkVar.d = (pl) obj;
                xkVar.e = (ry2) obj2;
                xkVar.c = obj3;
                xkVar.invokeSuspend(c1eVar);
                return c1eVar;
            default:
                Object obj5 = ((bjb) obj).a;
                xk xkVar2 = new xk(i2, 1, (n92) obj4);
                xkVar2.c = obj5;
                xkVar2.d = (ec4) obj2;
                xkVar2.e = (qz8) obj3;
                return xkVar2.invokeSuspend(c1eVar);
        }
    }
}
