package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vt0 extends f52 {
    public final /* synthetic */ int b = 1;

    public vt0(double d) {
        super(Double.valueOf(d));
    }

    @Override // defpackage.f52
    public final mn6 a(b38 b38Var) {
        switch (this.b) {
            case 0:
                b38Var.getClass();
                vm6 vm6VarE = b38Var.e();
                vm6VarE.getClass();
                return vm6VarE.s(x0a.BOOLEAN);
            case 1:
                b38Var.getClass();
                vm6 vm6VarE2 = b38Var.e();
                vm6VarE2.getClass();
                return vm6VarE2.s(x0a.DOUBLE);
            default:
                b38Var.getClass();
                vm6 vm6VarE3 = b38Var.e();
                vm6VarE3.getClass();
                return vm6VarE3.s(x0a.FLOAT);
        }
    }

    @Override // defpackage.f52
    public String toString() {
        int i = this.b;
        Object obj = this.a;
        switch (i) {
            case 1:
                return ((Number) obj).doubleValue() + ".toDouble()";
            case 2:
                return ((Number) obj).floatValue() + ".toFloat()";
            default:
                return super.toString();
        }
    }

    public /* synthetic */ vt0(Object obj) {
        super(obj);
    }

    public vt0(float f) {
        super(Float.valueOf(f));
    }
}
