package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mh0 implements lm8 {
    public static final mh0 a = new mh0();
    public static final gf4 b = gf4.a("eventType");
    public static final gf4 c = gf4.a("sessionData");
    public static final gf4 d = gf4.a("applicationInfo");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        z0c z0cVar = (z0c) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, z0cVar.a);
        mm8Var.a(c, z0cVar.b);
        mm8Var.a(d, z0cVar.c);
    }
}
