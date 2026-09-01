package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dv implements vh3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public dv(ob3 ob3Var, ba8 ba8Var, ejc ejcVar) {
        this.a = 1;
        this.c = ob3Var;
        this.d = ba8Var;
        this.b = ejcVar;
    }

    @Override // defpackage.vh3
    public final void dispose() {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                ((ejc) obj3).remove(obj2);
                ((ov) obj).d.k(obj2);
                break;
            case 1:
                ba8 ba8Var = (ba8) obj;
                ((ob3) obj2).b().c(ba8Var);
                ((ejc) obj3).remove(ba8Var);
                break;
            case 2:
                ((iy6) obj3).getLifecycle().b((ay6) obj2);
                zl0 zl0Var = (zl0) ((rya) obj).a;
                if (zl0Var != null) {
                    zl0Var.a();
                }
                break;
            default:
                oob oobVar = (oob) obj3;
                tob tobVar = (tob) obj;
                if (oobVar.b.k(obj2) == tobVar) {
                    Map map = oobVar.a;
                    Map mapC = tobVar.c();
                    if (!mapC.isEmpty()) {
                        map.put(obj2, mapC);
                    } else {
                        map.remove(obj2);
                    }
                }
                break;
        }
    }

    public /* synthetic */ dv(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
