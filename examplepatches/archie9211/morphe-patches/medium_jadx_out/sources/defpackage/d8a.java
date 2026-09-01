package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d8a {
    public final zw6 a;

    public d8a(m45 m45Var) {
        this.a = new zw6(m45Var);
    }

    public abstract o10 a(Object obj);

    public gqe b() {
        return this.a;
    }

    public final gqe c(o10 o10Var, gqe gqeVar) {
        gqe gqeVar2 = null;
        gqeVar2 = null;
        gqeVar2 = null;
        gqeVar2 = null;
        gqeVar2 = null;
        gqeVar2 = null;
        if (gqeVar instanceof tn3) {
            if (o10Var.d) {
                tn3 tn3Var = (tn3) gqeVar;
                tn3Var.a.setValue(o10Var.c());
                gqeVar2 = tn3Var;
            }
        } else if (gqeVar instanceof nqc) {
            if ((o10Var.c || o10Var.b != null) && !o10Var.d) {
                nqc nqcVar = (nqc) gqeVar;
                if (g76.L(o10Var.c(), nqcVar.a)) {
                    gqeVar2 = nqcVar;
                }
            }
        } else if (gqeVar instanceof f32) {
            o10Var.getClass();
        }
        if (gqeVar2 != null) {
            return gqeVar2;
        }
        if (!o10Var.d) {
            return new nqc(o10Var.c());
        }
        Object obj = o10Var.b;
        ajc ajcVar = (ajc) o10Var.a;
        if (ajcVar == null) {
            ajcVar = xsa.h;
        }
        return new tn3(new k49(obj, ajcVar));
    }
}
