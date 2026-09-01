package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kg0 implements lm8 {
    public static final kg0 a = new kg0();
    public static final gf4 b = gf4.a("name");
    public static final gf4 c = gf4.a("importance");
    public static final gf4 d = gf4.a("frames");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        cd2 cd2Var = (cd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((qi0) cd2Var).a);
        qi0 qi0Var = (qi0) cd2Var;
        mm8Var.e(c, qi0Var.b);
        mm8Var.a(d, qi0Var.c);
    }
}
