package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v80 implements x45 {
    public final dm0 a;
    public final a34 b;
    public final Object c;
    public final String d;
    public final f66 e;

    public v80(dm0 dm0Var, a34 a34Var, Object obj, String str, f66 f66Var) {
        obj.getClass();
        f66Var.getClass();
        this.a = dm0Var;
        this.b = a34Var;
        this.c = obj;
        this.d = str;
        this.e = f66Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        x45 x45Var = (x45) obj;
        x45Var.getClass();
        r40.C(this.a, "eventWriteScopeInvoke-".concat(this.d), this.e, new ho(this, 6, x45Var));
        return c1e.a;
    }
}
