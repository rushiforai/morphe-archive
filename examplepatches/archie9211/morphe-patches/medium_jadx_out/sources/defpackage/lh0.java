package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lh0 implements lm8 {
    public static final lh0 a = new lh0();
    public static final gf4 b = gf4.a("processName");
    public static final gf4 c = gf4.a("pid");
    public static final gf4 d = gf4.a("importance");
    public static final gf4 e = gf4.a("defaultProcess");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        w1a w1aVar = (w1a) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, w1aVar.a);
        mm8Var.e(c, w1aVar.b);
        mm8Var.e(d, w1aVar.c);
        mm8Var.d(e, w1aVar.d);
    }
}
