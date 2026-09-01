package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vf0 implements lm8 {
    public static final vf0 a = new vf0();
    public static final gf4 b = gf4.a("arch");
    public static final gf4 c = gf4.a("libraryName");
    public static final gf4 d = gf4.a("buildId");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        qc2 qc2Var = (qc2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((zh0) qc2Var).a);
        zh0 zh0Var = (zh0) qc2Var;
        mm8Var.a(c, zh0Var.b);
        mm8Var.a(d, zh0Var.c);
    }
}
