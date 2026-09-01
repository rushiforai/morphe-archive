package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h52 {
    public static final /* synthetic */ fj6[] k;
    public final Object a;
    public final q21 b;
    public final q52 d;
    public final q52 e;
    public final q52 f;
    public final q52 g;
    public final i52 c = new i52("parent");
    public final g52 h = new g52(this, new ze3(null, "wrap"));
    public final g52 i = new g52(this, new ze3(null, "wrap"));
    public final g52 j = new g52(this);

    static {
        c78 c78Var = new c78(h52.class, "width", "getWidth()Landroidx/constraintlayout/compose/Dimension;", 0);
        s1b s1bVar = n1b.a;
        k = new fj6[]{s1bVar.e(c78Var), ka1.h(h52.class, "height", "getHeight()Landroidx/constraintlayout/compose/Dimension;", 0, s1bVar), ka1.h(h52.class, "visibility", "getVisibility()Landroidx/constraintlayout/compose/Visibility;", 0, s1bVar), ka1.h(h52.class, "scaleX", "getScaleX()F", 0, s1bVar), ka1.h(h52.class, "scaleY", "getScaleY()F", 0, s1bVar), ka1.h(h52.class, "rotationX", "getRotationX()F", 0, s1bVar), ka1.h(h52.class, "rotationY", "getRotationY()F", 0, s1bVar), ka1.h(h52.class, "rotationZ", "getRotationZ()F", 0, s1bVar), ka1.h(h52.class, "translationX", "getTranslationX-D9Ej5fM()F", 0, s1bVar), ka1.h(h52.class, "translationY", "getTranslationY-D9Ej5fM()F", 0, s1bVar), ka1.h(h52.class, "translationZ", "getTranslationZ-D9Ej5fM()F", 0, s1bVar), ka1.h(h52.class, "pivotX", "getPivotX()F", 0, s1bVar), ka1.h(h52.class, "pivotY", "getPivotY()F", 0, s1bVar), ka1.h(h52.class, "horizontalChainWeight", "getHorizontalChainWeight()F", 0, s1bVar), ka1.h(h52.class, "verticalChainWeight", "getVerticalChainWeight()F", 0, s1bVar)};
    }

    public h52(Object obj, q21 q21Var) {
        this.a = obj;
        this.b = q21Var;
        this.d = new q52(q21Var, -2, 1);
        this.e = new q52(q21Var, 0, 0);
        this.f = new q52(q21Var, -1, 1);
        this.g = new q52(q21Var, 1, 0);
    }

    public static void b(h52 h52Var, v52 v52Var, v52 v52Var2, float f, float f2, float f3, int i) {
        if ((i & 4) != 0) {
            f = 0.0f;
        }
        if ((i & 8) != 0) {
            f2 = 0.0f;
        }
        if ((i & 64) != 0) {
            f3 = 0.5f;
        }
        h52Var.e.a(v52Var, f, 0.0f);
        h52Var.g.a(v52Var2, f2, 0.0f);
        h52Var.b.I("vBias", new o21(f3));
    }

    public static void c(h52 h52Var, w52 w52Var, w52 w52Var2, float f, float f2, float f3, int i) {
        float f4 = (i & 4) != 0 ? 0.0f : f;
        float f5 = (i & 8) != 0 ? 0.0f : f2;
        if ((i & 64) != 0) {
            f3 = 0.5f;
        }
        h52Var.a(w52Var, w52Var2, f4, f5, 0.0f, 0.0f, f3);
    }

    public final void a(w52 w52Var, w52 w52Var2, float f, float f2, float f3, float f4, float f5) {
        this.d.b(w52Var, f, f3);
        this.f.b(w52Var2, f2, f4);
        this.b.I("hRtlBias", new o21(f5));
    }

    public final void d(ze3 ze3Var) {
        this.i.a(k[1], ze3Var);
    }

    public final void e(pwe pweVar) {
        this.j.a(k[2], pweVar);
    }

    public final void f(ze3 ze3Var) {
        this.h.a(k[0], ze3Var);
    }
}
