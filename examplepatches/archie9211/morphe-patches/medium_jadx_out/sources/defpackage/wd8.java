package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wd8 implements bf4 {
    public final w5d a;
    public final w5d b;
    public final a1a c;

    public wd8(m45 m45Var) {
        oo7 oo7Var = new oo7(19);
        vd8 vd8Var = vd8.a;
        this.a = new w5d(m45Var);
        this.b = vx0.e0(oo7Var);
        a1a a1aVar = new a1a(10);
        a1aVar.b = vd8Var;
        a1aVar.c = jzb.g;
        this.c = a1aVar;
    }

    @Override // defpackage.bf4
    public final cf4 a(Object obj, ew8 ew8Var, kva kvaVar) {
        d7e d7eVar = (d7e) obj;
        if (!g76.L(d7eVar.c, "http") && !g76.L(d7eVar.c, "https")) {
            return null;
        }
        String str = d7eVar.a;
        w5d w5dVar = this.a;
        w5d w5dVar2 = new w5d(new em4(29, kvaVar));
        w5d w5dVar3 = this.b;
        a1a a1aVar = this.c;
        Context context = ew8Var.a;
        Object obj2 = a1aVar.c;
        jzb jzbVar = jzb.g;
        if (obj2 == jzbVar) {
            synchronized (a1aVar) {
                obj2 = a1aVar.c;
                if (obj2 == jzbVar) {
                    x45 x45Var = (x45) a1aVar.b;
                    x45Var.getClass();
                    Object objInvoke = x45Var.invoke(context);
                    a1aVar.c = objInvoke;
                    a1aVar.b = null;
                    obj2 = objInvoke;
                }
            }
        }
        return new be8(str, ew8Var, w5dVar, w5dVar2, w5dVar3, (q42) obj2);
    }
}
