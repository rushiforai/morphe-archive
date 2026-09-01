package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ke6 extends vm6 {
    public static final /* synthetic */ fj6[] h = {n1b.a.g(new u4a(ke6.class, "customizer", "getCustomizer()Lorg/jetbrains/kotlin/builtins/jvm/JvmBuiltInsCustomizer;", 0))};
    public ge6 f;
    public final u67 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ke6(x67 x67Var, he6 he6Var) {
        super(x67Var);
        he6Var.getClass();
        this.g = new u67(x67Var, new a3(this, 12, x67Var));
        int i = je6.a[he6Var.ordinal()];
        if (i != 1) {
            if (i == 2) {
                c();
            } else if (i == 3) {
                c();
            } else {
                ygf.a();
                throw null;
            }
        }
    }

    public final oe6 J() {
        return (oe6) mk7.z(this.g, h[0]);
    }

    @Override // defpackage.vm6
    public final bb d() {
        return J();
    }

    @Override // defpackage.vm6
    public final Iterable m() {
        Iterable iterableM = super.m();
        c38 c38VarL = l();
        c38VarL.getClass();
        return bu1.P0(iterableM, new fe6(this.d, c38VarL));
    }

    @Override // defpackage.vm6
    public final fa9 p() {
        return J();
    }
}
