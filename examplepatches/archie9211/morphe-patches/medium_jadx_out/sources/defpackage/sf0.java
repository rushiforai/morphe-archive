package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sf0 implements lm8 {
    public static final sf0 a = new sf0();
    public static final gf4 b = gf4.a("networkType");
    public static final gf4 c = gf4.a("mobileSubtype");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        td8 td8Var = (td8) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((wj0) td8Var).a);
        mm8Var.a(c, ((wj0) td8Var).b);
    }
}
