package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pl {
    public Object a;
    public Object b;
    public float c = Float.NaN;
    public final /* synthetic */ ul d;

    public pl(ul ulVar) {
        this.d = ulVar;
    }

    public final void a(float f, float f2) {
        ul ulVar = this.d;
        k49 k49Var = ulVar.c;
        g49 g49Var = ulVar.f;
        float fG = g49Var.g();
        g49Var.h(f);
        ulVar.g.h(f2);
        if (Float.isNaN(fG)) {
            return;
        }
        boolean z = f >= fG;
        if (g49Var.g() == ulVar.b().c(k49Var.getValue())) {
            Object objB = ulVar.b().b(g49Var.g() + (z ? 1.0f : -1.0f), z);
            if (objB == null) {
                objB = k49Var.getValue();
            }
            if (z) {
                this.a = k49Var.getValue();
                this.b = objB;
            } else {
                this.a = objB;
                this.b = k49Var.getValue();
            }
        } else {
            Object objB2 = ulVar.b().b(g49Var.g(), false);
            if (objB2 == null) {
                objB2 = k49Var.getValue();
            }
            Object objB3 = ulVar.b().b(g49Var.g(), true);
            if (objB3 == null) {
                objB3 = k49Var.getValue();
            }
            this.a = objB2;
            this.b = objB3;
        }
        ry2 ry2VarB = ulVar.b();
        Object obj = this.a;
        obj.getClass();
        float fC = ry2VarB.c(obj);
        ry2 ry2VarB2 = ulVar.b();
        Object obj2 = this.b;
        obj2.getClass();
        this.c = Math.abs(fC - ry2VarB2.c(obj2));
        if (Math.abs(g49Var.g() - ulVar.b().c(k49Var.getValue())) >= this.c / 2.0f) {
            Object value = z ? this.b : this.a;
            if (value == null) {
                value = k49Var.getValue();
            }
            k49Var.setValue(value);
        }
    }
}
